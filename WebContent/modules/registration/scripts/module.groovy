import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Account
import org.metamorphosis.core.User
import org.metamorphosis.core.DatabaseInfo
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine
import com.jelastic.api.development.response.ScriptEvalResponse
import com.jelastic.api.development.response.interfaces.ArrayResponse
import com.jelastic.api.environment.Control
import com.jelastic.api.users.Authentication
import com.jelastic.api.users.response.AuthenticationResponse
import org.json.JSONArray
import org.json.JSONObject

class ModuleDao extends AbstractDao {

    def verifyEmail(email) {
       def valid = true
       try {
         def connection = getConnection()
         def stmt = connection.createStatement()
         def SQL = """\
	        select id from users 
	        where owner = true and email = '${email}';
	        """    
	     def rs = stmt.executeQuery(SQL)
	     if(rs.next()) {
	       println "this user is already registred as an owner"
	       valid = false
	     }
	     rs.close()
	     stmt.close()
	     connection.close()
       }catch(e){
         println e
       }
       valid 
    }
    

    def saveAccount(registration,callback) {
       try {
          def connection = getConnection()
          connection.setAutoCommit(false)
          def stmt = connection.createStatement()
          def SQL = """\
             insert INTO users(firstName,lastName,profession,email,password,lang,owner) 
             VALUES("${registration.user.firstName}","${registration.user.lastName}","${registration.user.profession}","${registration.user.email}","${registration.user.password}","${registration.user.lang}",true);
          """
	      stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS)
	      def generatedKeys = stmt.getGeneratedKeys()
	      if(generatedKeys.next()) {
	          def user_id = generatedKeys.getLong(1)
	          SQL = """\
                 insert into structures(name,acronym,typeof,business,size,state,target,country,city,location,createdBy) 
                 values('${registration.account.structure.name}','${registration.account.structure.acronym}',"${registration.account.structure.type}","${registration.account.structure.business}",
                 "${registration.account.structure.size}","${registration.account.structure.state}","${registration.account.structure.target}","${registration.account.structure.address.country}",
                 "${registration.account.structure.address.city}","${registration.account.structure.address.location}",${user_id});              
                """
              stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS)
              generatedKeys = stmt.getGeneratedKeys()
		      if(generatedKeys.next()) {
		          def structure_id = generatedKeys.getLong(1)
		          SQL = """\
	                insert into subscriptions(mailing, hosting, modules,structure_id) VALUES(${registration.mailing},"${registration.hosting}","${registration.subscription}",${structure_id});
	              """
	              stmt.addBatch(SQL)
		          SQL = """\
	                insert into accounts(main,activated,activation_code,trial,role,user_id,structure_id,createdBy) VALUES(true,false,"${registration.activationCode}",true,"manager",${user_id},${structure_id},${user_id});
	              """
	              stmt.addBatch(SQL)
	              stmt.executeBatch()
		      }
	      }
	      connection.commit()
	      stmt.close()
	      connection.close()
	      callback()
	   }catch(e) {
	     println e
	   }
    }
    
    def activateAccount(code,callback) {
       try {
          def connection = getConnection()
          def stmt = connection.createStatement()
          def SQL = """\
	        select a.main,s.id,s.name,s.country,sub.hosting, sub.modules from accounts a, structures s, subscriptions sub
	        where a.activated = false and a.activation_code = '$code' and a.structure_id = s.id;
	      """    
	      def rs = stmt.executeQuery(SQL)
	      if(rs.next()) {
	       def main = rs.getBoolean("main")
	       if(main) {
	         def account = new Account()
	         def registration = new Registration(account : account)
	         println "getting the hosting info to create the database and the tables"
	         account.structure.id =  rs.getLong("id")
	         account.structure.name =  rs.getString("name")
	         account.structure.address.country =  rs.getString("country")
	         registration.hosting = rs.getString("hosting")
	         registration.subscription = rs.getString("modules")
	         callback(registration)
	       }
	       SQL = """\
             update accounts set activated = true where activation_code = '$code';
           """
	       stmt.executeUpdate(SQL)
	     }
         rs.close()
	     stmt.close()
	     connection.close()
	   }catch(e) {
	     println e
	   }
       
    }
    
    def createDatabase(registration) {
        if(!registration.account.structure.databaseInfo) {
            def connection = getConnection()
            connection.setAutoCommit(false)
            def stmt = connection.createStatement()
		    for(def sql in registration.getSQL(registration.database_name)) stmt.addBatch(sql)
		    stmt.executeBatch()
            connection.commit()
            stmt.close()
            connection.close()
		}else {
	         def connection = getConnection(registration.account.structure)
             connection.setAutoCommit(false)
             def stmt = connection.createStatement()
	         for(def sql in registration.getSQL(registration.account.structure.databaseInfo.name)) stmt.addBatch(sql)
	         stmt.executeBatch()
             connection.commit()
             stmt.close()
             connection.close()
		}
    }
    
    
}

class Registration {
    def user
    def account
    def moduleManager
    String subscription
    boolean mailing
    String database_name
    String hosting
    int nodes
    int fixedCloudlets
    int flexibleCloudlets
    def activationCode
    def complete 
    
    def getSQL(database_name) {
        def SQL = """\
        drop database IF EXISTS $database_name;
        create database $database_name;  
        use $database_name;  
        """
        for(def module in modules) {
         def file =  new File(module.folder.absolutePath +"/sql/module.sql")
         if(file.exists()) {
            file.eachLine {  
 				line -> SQL += line
			} 
         }
        }
        SQL.split(";")
    }
    
    def getModules() {
        def modules = []
        for(def id in subscription.split(",")) {
         def module = moduleManager.getModuleById(id.trim()) 
         if(module)modules << module 
        }
      modules
    }
    
}

class ModuleAction extends ActionSupport {
    def user =  new User()
    def account = new Account()
    def registration = new Registration(user : user, account : account,moduleManager : moduleManager)
    
	def register() {
	  def dao = new ModuleDao()
	  def captcha = request.getParameter("g-recaptcha-response")
	  if(captcha && dao.verifyEmail(registration.user.email)) {
	      registration.activationCode = UUID.randomUUID().toString() + "-" + UUID.randomUUID().toString()
	      createAccount(registration)
	      if(registration.complete) {
	      	def url = request.contextPath+"/"+module.url+"/success"
	      	response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
	      }else {
	        response.setStatus(404)
		    response.writer.write(groovy.json.JsonOutput.toJson([message: "error during the registration"]))
	      }
	  }else {
	     response.setStatus(404)
		 response.writer.write(groovy.json.JsonOutput.toJson([message: "error during the registration"]))
	  }
	}
	
	def createAccount(registration) {
	     def dao = new ModuleDao()
		 dao.saveAccount(registration,{
		       def mailConfig = new MailConfig("noreply@thinktech.sn","xgC#xo@6","smtp.thinktech.sn")
		       def mailSender = new MailSender(mailConfig)
		       def mail = new Mail(registration.user.fullName,registration.user.email,"${registration.user.fullName}, please confirm your email address",getRegistrationTemplate(registration))
		       mailSender.sendMail(mail)
		       registration.complete = true
		 })
	}
	
	def confirm() {
	    def code = request.getParameter("activation_code")
	    if(code) {
	       def dao = new ModuleDao()
	       dao.activateAccount(code,{ registration ->
	          registration.moduleManager = moduleManager 
	          if(registration.hosting.equals("colocation")) {
	       	  	registration.database_name = "database_"+registration.account.structure.id
	       	  	dao.createDatabase(registration)
	       	  }else {
	       	    println "creating the database server here"
	       	    def database_name = registration.account.structure.name.replaceAll("\\s","_")
	          	registration.account.structure.databaseInfo = new DatabaseInfo()
	          	registration.nodes = 1
	          	registration.flexibleCloudlets = 4
	            registration.account.structure.databaseInfo.name = database_name
	            registration.account.structure.databaseInfo.user = "root"
	            String alphabet = (('A'..'N')+('P'..'Z')+('a'..'k')+('m'..'z')+('2'..'9')).join() 
				int n = 15
				def password = new Random().with {
                     (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
                }
                println password
	            registration.account.structure.databaseInfo.password = password
	       	    createDatabaseServer(registration,{
	       	       dao.createDatabase(registration)
	       	    })
	       	  }
	       	  
	       })
	    }
	    SUCCESS
	}
	
	def createDatabaseServer(registration,callback) {
	   try {
	   def PLATFORM_APPID = "1dd8d191d38fff45e62564fcf67fdcd6";
       def HOSTER_URL = "https://app.mircloud.host"; // your hosting provider’s URL, see http://docs.jelastic.com/en/jelastic-hoster-info
       def USER_EMAIL = "dev@thinktech.sn"; // your Jelastic account’s email
       def USER_PASSWORD = "mirhosting"; // your Jelastic account’s password
       def structure = registration.account.structure
       def ENV_NAME = structure.name.replaceAll("\\s","-") + "-" + structure.address.country + "-database"
       def  authenticationService = new Authentication(PLATFORM_APPID)
       authenticationService.setServerUrl(HOSTER_URL + "/1.0/")
       def environmentService = new Control(PLATFORM_APPID)
       environmentService.setServerUrl(HOSTER_URL + "/1.0/")
       def authenticationResponse = authenticationService.signin(USER_EMAIL, USER_PASSWORD);
       if(authenticationResponse.isOK()) {
           def session = authenticationResponse.getSession()
           JSONObject env = new JSONObject()
                .put("ishaenabled", false)
                .put("shortdomain", ENV_NAME)
           def mysqlNode = new JSONObject()
                .put("nodeType", "mysql5")
                .put("extip", false)
                .put("count", registration.nodes)
                .put("flexibleCloudlets", registration.flexibleCloudlets)
           def nodes = new JSONArray().put(mysqlNode)
           def jsonResponse =  environmentService.createEnvironment(PLATFORM_APPID, session, "createenv", env.toString(), nodes.toString()).toJSON()
           nodes = jsonResponse.get("response").get("nodes")
           def nodeid = nodes.get(0).get("id")
           structure.databaseInfo.port = nodes.get(0).get("port")
           structure.databaseInfo.host = nodes.get(0).get("url")
           structure.databaseInfo.host = structure.databaseInfo.host.substring(8,structure.databaseInfo.host.length())
           environmentService.resetNodePasswordById(ENV_NAME,session,nodeid,structure.databaseInfo.password)
           callback()
       }
       }catch(e) {
           println e
       }
        
	}
	
	def deleteDatabaseServer(registration) {
	   try {
	   def PLATFORM_APPID = "1dd8d191d38fff45e62564fcf67fdcd6";
       def HOSTER_URL = "https://app.mircloud.host"; // your hosting provider’s URL, see http://docs.jelastic.com/en/jelastic-hoster-info
       def USER_EMAIL = "dev@thinktech.sn"; // your Jelastic account’s email
       def USER_PASSWORD = "mirhosting"; // your Jelastic account’s password
       def structure = registration.account.structure
       def ENV_NAME = structure.name.replaceAll("\\s","-") + "-" + structure.address.country + "-database"
       def  authenticationService = new Authentication(PLATFORM_APPID)
       authenticationService.setServerUrl(HOSTER_URL + "/1.0/")
       def environmentService = new Control(PLATFORM_APPID)
       environmentService.setServerUrl(HOSTER_URL + "/1.0/")
       def authenticationResponse = authenticationService.signin(USER_EMAIL, USER_PASSWORD);
       if(authenticationResponse.isOK()) {
           environmentService.deleteEnv(ENV_NAME, authenticationResponse.getSession(),"mirhosting");
       }
       }catch(e) {
           println e
       }
        
	}
	
	def resetPassword() {
	    println "reset password "
	    def mailConfig = new MailConfig("noreply@thinktech.sn","xgC#xo@6","smtp.thinktech.sn")
		def mailSender = new MailSender(mailConfig)
		def user = new User()
		user.firstName = "Mamadou Lamine"
		user.lastName = "Ba"
		user.email = "lamine.ba@thinktech.sn"
		def mail = new Mail(user.fullName,user.email,"${user.fullName}, here's the link to reset your password",getResetPasswordTemplate(user))
		mailSender.sendMail(mail)
	    SUCCESS
	}
	
	def changePassword() {
	    println "changing password "
	    SUCCESS
	}
	
	def getRegistrationTemplate(registration) {
	    TemplateConfiguration config = new TemplateConfiguration()
		MarkupTemplateEngine engine = new MarkupTemplateEngine(config)
		def text = '''\
		 div(style : "background:#fafafa;padding-bottom:16px"){
		 div(style : "padding-bottom:12px;margin-left:auto;margin-right:auto;width:80%;background:#fff") {
		    img(src : "https://thinktech.sn/images/logo.png", style : "display:block;margin : 0 auto")
		    div(style : "margin-top:10px;padding:10px;height:90px;text-align:center;background:#eceaea") {
		      h4(style : "font-size: 200%;color: rgb(0, 0, 0);margin: 3px") {
		        span("Account successfully created")
		      }
		      p(style : "font-size:150%;color:rgb(100,100,100)"){
		         span("click the button below to complete your registration")
		      }
		    }
		    div(style : "width:90%;margin:auto;margin-top : 30px;margin-bottom:30px") {
		      p("Thanks for signing up")
		      p("Please confirm your email address to get access to <a href='$url'>$app</a> to use the modules to which you have subscribed.")
		      ul(style : "font-weight:bold") {
		        for(def module in registration.modules) {
		          li("$module.name")
		        }
		      }
		      if(registration.hosting.equals("private")) {
		      	p("Your dedicated database server will be created after confirmation and you can update your subscription at any time once logged to your account.")
		      }else {
		         p("You can update your subscription at any time once logged to your account.")
		      }
		    }
		    div(style : "text-align:center") {
		       a(href : "$url/registration/account/confirm?activation_code=$registration.activationCode",style : "font-size:16px;width:180px;margin:auto;text-decoration:none;background: #06d0d8;display:block;padding:10px;border-radius:2px;border:1px solid #eee;color:#fff;") {
		         span("Confirm your email")
		       }
		    }
		  }
		  
		  div(style :"margin-top:10px;font-size : 11px;text-align:center") {
		      p("You're receiving this email because you (or someone using this email)")
		      p(" created an account using this address")
		  }
		  
		   
		 }
		'''
		def template = engine.createTemplate(text).make([registration:registration,url : baseUrl,app : getInitParameter('app_name')])
		template.toString()
	}
	
	def getResetPasswordTemplate(user) {
	    TemplateConfiguration config = new TemplateConfiguration()
		MarkupTemplateEngine engine = new MarkupTemplateEngine(config)
		def text = '''\
		 div(style : "background:#fafafa;padding-bottom:16px"){
		 div(style : "padding-bottom:12px;margin-left:auto;margin-right:auto;width:80%;background:#fff") {
		    img(src : "https://thinktech.sn/images/logo.png", style : "display:block;margin : 0 auto")
		    div(style : "margin-top:10px;padding:10px;height:90px;text-align:center;background:#eceaea") {
		      h4(style : "font-size: 200%;color: rgb(0, 0, 0);margin: 3px") {
		        span("Hi ${user.fullName}")
		      }
		      p(style : "font-size:150%;color:rgb(100,100,100)"){
		         span("Reset your password")
		      }
		    }
		    div(style : "width:90%;margin:auto;margin-top : 30px;margin-bottom:30px") {
		      p("To change your password, click here or paste the following link into your browser.")
		      p(style : "text-align:center") {
		         span("<br><a href='$url/password/change?token=1225466554558787878' style='text-align:center'>$url/password/change?token=1225466554558787878</a><br><br>")
		      }
		      p("Thanks for using $app!<br><br><b>Regards</b><br><b>ThinkTech Team</b>")
		    }
		  }
		  
		  div(style :"margin-top:10px;font-size : 11px;text-align:center") {
		      p("This email was intended for ${user.fullName}.")
		  }
		   
		 }
		'''
		def template = engine.createTemplate(text).make([user:user,url : baseUrl,app : getInitParameter('app_name')])
		template.toString()
	}
	
		
}

new ModuleAction()
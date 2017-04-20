import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Account
import org.metamorphosis.core.User
import org.metamorphosis.core.DatabaseInfo
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine
import com.jelastic.api.development.response.ScriptEvalResponse;
import com.jelastic.api.development.response.interfaces.ArrayResponse;
import com.jelastic.api.environment.Control;
import com.jelastic.api.users.Authentication;
import com.jelastic.api.users.response.AuthenticationResponse;
import org.json.JSONArray;
import org.json.JSONObject;

class ModuleDao extends AbstractDao {

    def saveAccount(registration,callback) {
       try {
          def connection = getConnection()
          connection.setAutoCommit(false);
          def stmt = connection.createStatement()
          def SQL = """\
             insert INTO users(firstName,lastName,profession,email,password,lang) 
             VALUES("${registration.user.firstName}","${registration.user.lastName}","${registration.user.profession}","${registration.user.email}","${registration.user.password}","${registration.user.lang}");
          """
	      stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS)
	      def generatedKeys = stmt.getGeneratedKeys()
	      if(generatedKeys.next()) {
	          def user_id = generatedKeys.getLong(1)
	          if(!registration.account.structure.databaseInfo) {
	            registration.database_name =  "database_"+user_id
	            registration.stmt = stmt
	            SQL = """\
                 insert into structures(name,sigle,typeof,business,size,state,target,country,city,location,database_name,createdBy) 
                 values('${registration.account.structure.name}','${registration.account.structure.sigle}',"${registration.account.structure.type}","${registration.account.structure.business}",
                 "${registration.account.structure.size}","${registration.account.structure.state}","${registration.account.structure.target}","${registration.account.structure.address.country}",
                 "${registration.account.structure.address.city}","${registration.account.structure.address.location}","${registration.database_name}",${user_id});              
                """
              }else {
	            SQL = """\
                 insert into structures(name,sigle,typeof,business,size,state,target,country,city,location,database_host,database_name,database_port,database_user,database_password,createdBy) 
                 values('${registration.account.structure.name}','${registration.account.structure.sigle}',"${registration.account.structure.type}","${registration.account.structure.business}",
                 "${registration.account.structure.size}","${registration.account.structure.state}","${registration.account.structure.target}","${registration.account.structure.address.country}",
                 "${registration.account.structure.address.city}","${registration.account.structure.address.location}","${registration.account.structure.databaseInfo.host}","${registration.account.structure.databaseInfo.name}",
                 "${registration.account.structure.databaseInfo.port}","${registration.account.structure.databaseInfo.user}","${registration.account.structure.databaseInfo.password}",${user_id});              
                """
              }
              stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS)
              generatedKeys = stmt.getGeneratedKeys()
		      if(generatedKeys.next()) {
		          def structure_id = generatedKeys.getLong(1)
		          SQL = """\
	                insert into subscription(mailing, modules,structure_id) VALUES(${registration.mailing},"${registration.subscription}",${structure_id});
	              """
	              stmt.executeUpdate(SQL)
		          SQL = """\
	                insert into accounts(main,activated,trial,role,user_id,structure_id,createdBy) VALUES(true,false,true,"manager",${user_id},${structure_id},${user_id});
	              """
	              stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS)
	              generatedKeys = stmt.getGeneratedKeys()
		          if(generatedKeys.next()) registration.account.id = generatedKeys.getLong(1)
		      }
		      createDatabase(registration)
	      }
	      connection.commit()
	      stmt.close()
	      connection.close()
	      callback()
	   }catch(e) {
	     println e
	   }
    }
    
    def createDatabase(registration) {
        if(!registration.account.structure.databaseInfo) {
		    def lines = registration.getSQL(registration.database_name)
		    for(def line in lines) registration.stmt.addBatch(line)
		    registration.stmt.executeBatch()
		}else {
	         def connection = getConnection(registration.account.structure)
             connection.setAutoCommit(false)
             def stmt = connection.createStatement()
             def lines = registration.getSQL(registration.account.structure.databaseInfo.name)
	         for(def line in lines) stmt.addBatch(line)
	         stmt.executeBatch()
             connection.commit()
             stmt.close()
             connection.close()
		}
    }
    
    def activateAccount(id) {
       try {
          def connection = getConnection()
          def stmt = connection.createStatement()
          def SQL = """\
             update accounts set activated = true where id = $id;
          """
	      stmt.executeUpdate(SQL)
	      stmt.close()
	      connection.close()
	   }catch(e) {
	     println e
	   }
       
    }
    
}

class Registration {
    def user
    def account
    def moduleManager
    String subscription
    boolean mailing
    String hosting
    def database_name
    def stmt 
    def complete 
    
    def getSQL(database_name) {
        def SQL = """\
        drop database IF EXISTS $database_name;
        create database $database_name;  
        use $database_name;  
        """
        def names = subscription.split(",")
        for(def name in names) {
         name = name.trim()
         def module = moduleManager.getModuleByName(name) 
         def file =  new File(module.folder.absolutePath +"/sql/module.sql")
         if(file.exists()) {
            file.eachLine {  
 				line -> SQL += line; 
			} 
         }
        }
       SQL.split(";")
    }
}

class ModuleAction extends ActionSupport {
    def user =  new User()
    def account = new Account()
    def registration = new Registration(user : user, account : account,moduleManager : moduleManager)
    
	def register() {
	  /*def captcha = request.getParameter("g-recaptcha-response")*/
	  def captcha = "fake"
	  if(captcha) {
	      if(registration.hosting.equals("private")) {
	          def database_name = registration.account.structure.name.replaceAll("\\s","_")
	          registration.account.structure.databaseInfo = new DatabaseInfo()
	          registration.account.structure.databaseInfo.name = database_name
	          registration.account.structure.databaseInfo.user = "root"
	          registration.account.structure.databaseInfo.password = "passer"
	          createDatabaseServer(registration.account.structure,{
	             createAccount(registration)
	          })
	      }else {
	          createAccount(registration)
	      }
	      if(registration.complete) {
	      	def url = request.contextPath+"/"+module.url+"/success"
	      	response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
	      }else {
	        response.setStatus(404)
		    response.writer.write(groovy.json.JsonOutput.toJson([message: "error during the registration"]))
	      }
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
	
	def createDatabaseServer(structure,callback) {
	   try {
	   def PLATFORM_APPID = "1dd8d191d38fff45e62564fcf67fdcd6";
       def HOSTER_URL = "https://app.mircloud.host"; // your hosting provider’s URL, see http://docs.jelastic.com/en/jelastic-hoster-info
       def USER_EMAIL = "dev@thinktech.sn"; // your Jelastic account’s email
       def USER_PASSWORD = "mirhosting"; // your Jelastic account’s password
       def ENV_NAME = structure.name.replaceAll("\\s","-") + "-" + structure.address.country + "-database"
       println "env name " + ENV_NAME
       def  authenticationService = new Authentication(PLATFORM_APPID)
       authenticationService.setServerUrl(HOSTER_URL + "/1.0/")
       def environmentService = new Control(PLATFORM_APPID)
       environmentService.setServerUrl(HOSTER_URL + "/1.0/")
       println "Authenticate user..."
       def authenticationResponse = authenticationService.signin(USER_EMAIL, USER_PASSWORD);
       println "Signin response: " + authenticationResponse
       if(authenticationResponse.isOK()) {
           def session = authenticationResponse.getSession()
           JSONObject env = new JSONObject()
                .put("ishaenabled", false)
                .put("shortdomain", ENV_NAME)
           def mysqlNode = new JSONObject()
                .put("nodeType", "mysql5")
                .put("extip", false)
                .put("fixedCloudlets", 0)
                .put("flexibleCloudlets", 2)
           def nodes = new JSONArray().put(mysqlNode)
           println "Creating environment..."
           def response = environmentService.createEnvironment(PLATFORM_APPID, session, "createenv", env.toString(), nodes.toString());
           println "CreateEnvironment response: " + response
           def jsonResponse = response.toJSON()
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
	
	def confirm() {
	    def id = request.getParameter("id")
	    if(id) {
	       def dao = new ModuleDao()
	       dao.activateAccount(id)
	    }
	    SUCCESS
	}
	
	def close() {
	    def id = request.getParameter("id")
	    println "closing account "+id
	    SUCCESS
	}
	
	def resetPassword() {
	    /*println "reset password "
	    def mailConfig = new MailConfig("noreply@thinktech.sn","xgC#xo@6","smtp.thinktech.sn")
		def mailSender = new MailSender(mailConfig)
		def user = new User()
		user.firstName = "Mamadou Lamine"
		user.lastName = "Ba"
		user.email = "lamine.ba@thinktech.sn"
		def mail = new Mail(user.fullName,user.email,"${user.fullName}, here's the link to reset your password",getResetPasswordTemplate(user))
		mailSender.sendMail(mail)*/
		createDatabase()
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
		      p("Please confirm your email address to get access to $app to use the modules to which you have subscribed.")
		      def modules = registration.subscription.split(",")
		      ul(style : "font-weight:bold") {
		        for(def module in modules) {
		          li("$module")
		        }
		      }
		      p("You can update your subscription at any time once logged to your account.")
		    }
		    div(style : "text-align:center") {
		       a(href : "$url/registration/account/confirm?id=$registration.account.id",style : "font-size:16px;width:180px;margin:auto;text-decoration:none;background: #06d0d8;display:block;padding:10px;border-radius:2px;border:1px solid #eee;color:#fff;") {
		         span("Confirm your email")
		       }
		    }
		  }
		  
		  div(style :"margin-top:10px;font-size : 11px;text-align:center") {
		      p("You're receiving this email because you (or someone using this email)")
		      p(" created an account using this address")
		      p("Didn't sign up for $app? <a href='$url/registration/account/close?id=$registration.account.id'>Close account</a>")
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
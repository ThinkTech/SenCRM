import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Account
import org.metamorphosis.core.User
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

    def saveAccount(moduleManager,user,account,registration,callback) {
       try {
          def connection = getConnection()
          connection.setAutoCommit(false);
          def stmt = connection.createStatement()
          def SQL = """\
             insert INTO users(firstName,lastName,profession,email,password,lang) 
             VALUES("${user.firstName}","${user.lastName}","${user.profession}","${user.email}","${user.password}","${user.lang}");
          """
	      stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS)
	      def generatedKeys = stmt.getGeneratedKeys()
	      if(generatedKeys.next()) {
	          def user_id = generatedKeys.getLong(1)
	          def base =  "database_"+user_id
	          SQL = """\
                insert into structures(name,sigle,typeof,business,state,target,country,city,location,base,createdBy) 
                values('${account.structure.name}','${account.structure.sigle}',"${account.structure.type}","${account.structure.business}",
                "${account.structure.state}","${account.structure.target}","${account.structure.address.country}",
                "${account.structure.address.city}","${account.structure.address.location}","${base}",${user_id});              
              """
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
		          if(generatedKeys.next()) {
		            account.id = generatedKeys.getLong(1)
		          }
		      }
		      SQL = """\
		       drop database IF EXISTS $base;
               create database $base;  
               use $base;  
              """
		      def names = registration.subscription.split(",")
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
		      def lines = SQL.split(";")
		      for(def line in lines) stmt.addBatch(line)
		      stmt.executeBatch();
              connection.commit();
	      }
	      stmt.close()
	      connection.close()
	      callback()
	   }catch(e) {
	     println e
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
    
    String subscription
    boolean mailing
    String hosting
}

class ModuleAction extends ActionSupport {

    def user = new User() 
    def account = new Account()
    def registration = new Registration()
    
	def register() {
	  def captcha = request.getParameter("g-recaptcha-response")
	  if(captcha) {
	      def dao = new ModuleDao()
		  dao.saveAccount(moduleManager,user,account,registration,{
		       def mailConfig = new MailConfig("noreply@thinktech.sn","xgC#xo@6","smtp.thinktech.sn")
		       def mailSender = new MailSender(mailConfig)
		       def mail = new Mail(user.fullName,user.email,"${user.fullName}, please confirm your email address",getTemplate(account,registration.subscription))
		       mailSender.sendMail(mail)
		  })
	  }
	  captcha ? SUCCESS : ERROR
	}
	
	def createDatabase() {
	   try {
	   def PLATFORM_APPID = "1dd8d191d38fff45e62564fcf67fdcd6";
       def HOSTER_URL = "https://app.mircloud.host"; // your hosting provider’s URL, see http://docs.jelastic.com/en/jelastic-hoster-info
       def USER_EMAIL = "dev@thinktech.sn"; // your Jelastic account’s email
       def USER_PASSWORD = "mirhosting"; // your Jelastic account’s password
       def ENV_NAME = "test-api-environment-" + new Random().nextInt(100)
       def  authenticationService = new Authentication(PLATFORM_APPID)
       authenticationService.setServerUrl(HOSTER_URL + "/1.0/")
       def environmentService = new Control(PLATFORM_APPID)
       environmentService.setServerUrl(HOSTER_URL + "/1.0/")
       println "Authenticate user..."
       def authenticationResponse = authenticationService.signin(USER_EMAIL, USER_PASSWORD);
       println "Signin response: " + authenticationResponse
       if(authenticationResponse.isOK()) {
           final String session = authenticationResponse.getSession();
           
           JSONObject env = new JSONObject()
                .put("ishaenabled", false)
                .put("shortdomain", ENV_NAME);
           
           def mysqlNode = new JSONObject()
                .put("nodeType", "mysql5")
                .put("extip", false)
                .put("fixedCloudlets", 0)
                .put("flexibleCloudlets", 2);
           def nodes = new JSONArray().put(mysqlNode);
           System.out.println("Creating environment...");
           def scriptEvalResponse = environmentService.createEnvironment(PLATFORM_APPID, session, "createenv", env.toString(), nodes.toString());
           println "CreateEnvironment response: " + scriptEvalResponse;
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
	
	def getTemplate(account,subscription) {
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
		      def modules = subscription.split(",")
		      ul(style : "font-weight:bold") {
		        for(def module in modules) {
		          li("$module")
		        }
		      }
		      p("You can update your subscription at any time once logged to your account.")
		    }
		    div(style : "text-align:center") {
		       a(href : "$url/registration/account/confirm?id=$account.id",style : "font-size:16px;width:180px;margin:auto;text-decoration:none;background: #06d0d8;display:block;padding:10px;border-radius:2px;border:1px solid #eee;color:#fff;") {
		         span("Confirm your email")
		       }
		    }
		  }
		  
		  div(style :"margin-top:10px;font-size : 11px;text-align:center") {
		      p("You're receiving this email because you (or someone using this email)")
		      p(" created an account using this address")
		      p("Didn't sign up for $app? <a href='$url/registration/account/close?id=$account.id'>Close account</a>")
		  }
		  
		   
		 }
		'''
		def template = engine.createTemplate(text).make([account:account,subscription:subscription,url : baseUrl,app : getInitParameter('app_name')])
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
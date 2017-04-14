import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Account
import org.metamorphosis.core.User
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine

class ModuleDao extends AbstractDao {

    def saveAccount(user,account,registration,callback) {
       try {
          def connection = getConnection()
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
	                insert into accounts(main,activated,trial,role,user_id,structure_id,createdBy) VALUES(true,false,true,"manager",${user_id},${structure_id},${user_id});
	              """
	              stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS)
	              generatedKeys = stmt.getGeneratedKeys()
		          if(generatedKeys.next()) {
		            account.id = generatedKeys.getLong(1)
		          }
		      }
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
          println SQL
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

}

class ModuleAction extends ActionSupport {

    def user = new User() 
    def account = new Account()
    def registration = new Registration()
    
	def register() {
	  def captcha = request.getParameter("g-recaptcha-response")
	  //if(captcha) {
	      def dao = new ModuleDao()
		  dao.saveAccount(user,account,registration,{
		       def mailConfig = new MailConfig("noreply@thinktech.sn","xgC#xo@6","smtp.thinktech.sn")
		       def mailSender = new MailSender(mailConfig)
		       def mail = new Mail(user.fullName,user.email,"${user.fullName}, please confirm your email address",getTemplate(account))
		       mailSender.sendMail(mail)
		   })
	  // }
	   captcha ? SUCCESS : SUCCESS
	}
	
	def confirm() {
	    def id = request.getParameter("id")
	    println "confirmation account "+id
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
	
	def getTemplate(account) {
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
		def template = engine.createTemplate(text).make([account:account,url : baseUrl,app : getInitParameter('app_name')])
		template.toString()
	}
		
}

new ModuleAction()
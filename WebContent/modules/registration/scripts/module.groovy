import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Account
import org.metamorphosis.core.User
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine

class ModuleDao extends AbstractDao {

    def saveAccount(account,callback) {
       println "creating account"
       callback()
    }
}

class ModuleAction extends ActionSupport {

    def account = new Account()
    def user = new User() 
    def subscription = []
    
	def register() {
	   println account.structure.name
	   def dao = new ModuleDao()
	   dao.saveAccount(account, {
	       def mailSender = new MailSender()
	       def mail = new Mail(user.fullName,user.email,"${user.fullName}, please confirm your email address",getTemplate(account))
	       mailSender.sendMail(mail,true)
	   })
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
		       a(href : "$url/registration/account/confirm?id=1245555",style : "font-size:16px;width:180px;margin:auto;text-decoration:none;background: #06d0d8;display:block;padding:10px;border-radius:2px;border:1px solid #eee;color:#fff;") {
		         span("Confirm your email")
		       }
		    }
		  }
		  
		  div(style :"margin-top:10px;font-size : 11px;text-align:center") {
		      p("You're receiving this email because you (or someone using this email)")
		      p(" created an account using this address")
		      p("Didn't sign up for $app? <a href='$url/registration/account/close?id=1245555'>Close account</a>")
		  }
		  
		   
		 }
		'''
		def template = engine.createTemplate(text).make([account:account,url : baseUrl,app : getInitParameter('app_name')])
		template.toString()
	}
		
}

new ModuleAction()
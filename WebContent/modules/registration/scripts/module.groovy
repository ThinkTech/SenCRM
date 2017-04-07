import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Account
import org.metamorphosis.core.User
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine


class ModuleAction extends ActionSupport {

    def account = new Account()
    def user = new User() 
	def register() {
	   println account.structure.name
	   SUCCESS
	}
	def getTemplate(ticket,message) {
	    TemplateConfiguration config = new TemplateConfiguration()
		MarkupTemplateEngine engine = new MarkupTemplateEngine(config)
		def text = '''\
		 div(style : "margin-left:auto;margin-right:auto;width:90%") {
		    img(src : "https://thinktech.sn/images/logo.png", style : "display:block;margin : 0 auto")
		    div(style : "margin-top:10px;padding:10px;height:90px;text-align:center;background:#eee") {
		      h4(style : "font-size: 200%;color: rgb(0, 0, 0);margin: 3px") {
		        span("New Notification from the $ticket.department team")
		      }
		      h1(style : "font-size: 150%;color:#06d0d8;margin-top: 15px;font-weight: bold;text-transform: uppercase;") {
		        span("Module : $ticket.id")
		      }
		    }
		    div(style : "width:60%;margin:auto;margin-top : 30px;margin-bottom:30px") {
		      p("$message")
		    }
		    div(style : "text-align:center") {
		       a(href : "$url",style : "width:100px;margin:auto;text-decoration:none;text-transform:uppercase;background: #06d0d8;display:block;padding:10px;border-radius:2px;border:1px solid #eee;color:#fff;") {
		         span("See Module")
		       }
		    }
		    div(style : "margin-top:20px;background:#eee;padding-top:15px;height:30px;text-align:center;") {
		       p("contact <a href='mailto:support@thinktech.sn'>support@thinktech.sn</a> to get additional information");
		    }
		 }
		'''
		def template = engine.createTemplate(text).make([ticket:ticket, message : message,url : baseUrl+"/tickets/opened/details?id="+ticket.id])
		template.toString()
	}
		
}

new ModuleAction()
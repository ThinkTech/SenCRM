import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Search
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine


class ModuleAction extends ActionSupport {

    def entity
	def search = new Search()
	def tickets
	
	
	def showProspects() {
	    SUCCESS
	}
	
	def showPartners() {
	    SUCCESS
	}
	
	def createCustomer() {
	    entity = "customer"
	    SUCCESS
	}
	
	def createProspect() {
	    entity = "prospect"
	    SUCCESS
	}
	
	def createPartner() {
	    entity = "partner"
	    SUCCESS
	}
	
	def saveEntity()  {
		SUCCESS
	}
	
	def String execute() {
	   SUCCESS
	}
		
	
	def getTemplate(ticket,message) {
	    TemplateConfiguration config = new TemplateConfiguration()
		MarkupTemplateEngine engine = new MarkupTemplateEngine(config)
		def text = '''\
		 div {
		    img(src : "https://jelastic.com/wp-content/themes/salient/assets/img/logo.png", style : "display:block;margin : 0 auto")
		    div(style : "margin-top:10px;padding:10px;height:120px;text-align:center;background:#eee") {
		      h4(style : "font-size: 27px;color: rgb(0, 172, 235);white-space: nowrap;margin: 3px") {
		        span("New Notification from the technical support")
		      }
		      h1(style : "font-size: 55px;white-space: nowrap;color: rgb(0, 172, 235);margin: 3px;font-weight: bold;text-transform: uppercase;line-height: 57px;") {
		        span("Ticket : $ticket.id")
		      }
		    }
		    div(style : "width:60%;margin:auto;margin-bottom:30px") {
		      p("$message")
		    }
		    div(style : "text-align:center") {
		       a(href : "$url",style : "width:100px;margin:auto;text-decoration:none;text-transform:uppercase;background: rgb(0, 172, 235);display:block;padding:10px;border-radius:2px;border:1px solid #ccc;color:#fff;") {
		         span("See Ticket")
		       }
		    }
		    div(style : "margin-top:20px;background:#eee;padding-top:15px;height:30px;text-align:center;") {
		       p("contact <a href='mailto:support@thinktech.sn'>support@thinktech.sn</a> to get additional information");
		    }
		 }
		'''
		def template = engine.createTemplate(text).make([ticket:ticket, message : message,url : "http://localhost:8080/sentickets/tickets/details?id="+ticket.id])
		template.toString()
	}
		
}

new ModuleAction()
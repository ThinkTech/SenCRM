import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import org.metamorphosis.core.Structure
import org.metamorphosis.core.Contact
import org.metamorphosis.core.Address
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine


class ModuleAction extends ActionSupport {

    def structure = new Structure()
    def contact = new Contact()
	def structures
	
	def String execute() {
	   println "getting customers"
	   structures = session.getAttribute("customers")
	   if(!structures) {
	   		structures = []
	   		session.setAttribute("customers",structures) 
	   }
	   SUCCESS
	}
	
	def showProspects() {
	    println "getting prospects"
	    structures = session.getAttribute("prospects")
	    if(!structures) {
	   		structures = []
	   		session.setAttribute("prospects",structures) 
	    }
	    SUCCESS
	}
	
	def showPartners() {
	    println "getting partners"
	    structures = session.getAttribute("partners")
	    if(!structures) {
	   		structures = []
	   		session.setAttribute("partners",structures) 
	    }
	    SUCCESS
	}
	
	def createCustomer() {
	    structure.instance = "customer"
	    SUCCESS
	}
	
	def createProspect() {
	    structure.instance = "prospect"
	    SUCCESS
	}
	
	def createPartner() {
	    structure.instance = "partner"
	    SUCCESS
	}
	
	def saveStructure()  {
	    structures = session.getAttribute(structure.instance+"s")
	    structure.id = new Random().nextLong() + 1
	    structure.createdBy = loggedUser
	    structure.createdOn = new Date()
	    structure.contacts << contact
	    structures << structure
		return structure.instance
	}
	
	def showCustomer() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    structures = session.getAttribute("customers");
	    def found;
	    for(int i=0;i<structures.size();i++) {
	        if(id.equals(structures[i].id)) {
	           structure = structures[i]
	           found = true
	           break
	        }
	    }
	    found ? SUCCESS : ERROR
	}
	
	def showProspect() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    structures = session.getAttribute("prospects");
	    def found;
	    for(int i=0;i<structures.size();i++) {
	        if(id.equals(structures[i].id)) {
	           structure = structures[i]
	           found = true
	           break
	        }
	    }
	    found ? SUCCESS : ERROR
	}
	
	def showPartner() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    structures = session.getAttribute("partners");
	    def found;
	    for(int i=0;i<structures.size();i++) {
	        if(id.equals(structures[i].id)) {
	           structure = structures[i]
	           found = true
	           break
	        }
	    }
	    found ? SUCCESS : ERROR
	}
	
	
	def searchCustomers() {
	    println search.filter
	    println search.value
	    SUCCESS
	}
	
	def searchProspects() {
	    println search.filter
	    println search.value
	    SUCCESS
	}
	
	def searchPartners() {
	    println search.filter
	    println search.value
	    SUCCESS
	}
		
	
	def getTemplate(structure,message) {
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
		def template = engine.createTemplate(text).make([structure:structure, message : message,url : "http://localhost:8080/sentickets/tickets/details?id="+ticket.id])
		template.toString()
	}
		
}

new ModuleAction()
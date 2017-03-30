import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine

class Entity {
  long id
  String name
  String sigle
  String type
  String category
  String ninea
  String rc
  String business
  String size
  String state
  String target
  def address
  def contacts = []
  String instance
  def createdOn
  def createdBy
}

class Address {
  String country
  String town
  String location
  String longitude
  String latitude
  String altitude
  String telephone
  String mobile
  String email
  String bp
  String fax
  String website
}

class Contact {
  def firstName
  def lastName
  def profession
  def dateOfBirth
  def gender
}

class ModuleAction extends ActionSupport {

    def entity = new Entity()
    def address = new Address()
	def entities
	
	def String execute() {
	   println "getting customers"
	   entities = session.getAttribute("customers")
	   if(!entities) {
	   		entities = []
	   		session.setAttribute("customers",entities) 
	   }
	   SUCCESS
	}
	
	def showProspects() {
	    println "getting prospects"
	    entities = session.getAttribute("prospects")
	    if(!entities) {
	   		entities = []
	   		session.setAttribute("prospects",entities) 
	    }
	    SUCCESS
	}
	
	def showPartners() {
	    println "getting partners"
	    entities = session.getAttribute("partners")
	    if(!entities) {
	   		entities = []
	   		session.setAttribute("partners",entities) 
	    }
	    SUCCESS
	}
	
	def createCustomer() {
	    entity.instance = "customer"
	    SUCCESS
	}
	
	def createProspect() {
	    entity.instance = "prospect"
	    SUCCESS
	}
	
	def createPartner() {
	    entity.instance = "partner"
	    SUCCESS
	}
	
	def saveEntity()  {
	    entities = session.getAttribute(entity.instance+"s")
	    entity.id = new Random().nextLong() + 1
	    entity.createdBy = loggedUser
	    entity.address = address
	    entity.createdOn = new Date()
	    entities << entity
		return entity.instance
	}
	
	def showCustomer() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    entities = session.getAttribute("customers");
	    def found;
	    for(int i=0;i<entities.size();i++) {
	        if(id.equals(entities[i].id)) {
	           entity = entities[i]
	           found = true
	           break
	        }
	    }
	    found ? SUCCESS : ERROR
	}
	
	def showProspect() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    entities = session.getAttribute("prospects");
	    def found;
	    for(int i=0;i<entities.size();i++) {
	        if(id.equals(entities[i].id)) {
	           entity = entities[i]
	           found = true
	           break
	        }
	    }
	    found ? SUCCESS : ERROR
	}
	
	def showPartner() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    entities = session.getAttribute("partners");
	    def found;
	    for(int i=0;i<entities.size();i++) {
	        if(id.equals(entities[i].id)) {
	           entity = entities[i]
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
		
	
	def getTemplate(entity,message) {
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
		def template = engine.createTemplate(text).make([entity:entity, message : message,url : "http://localhost:8080/sentickets/tickets/details?id="+ticket.id])
		template.toString()
	}
		
}

new ModuleAction()
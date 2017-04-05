import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import org.metamorphosis.core.Structure
import org.metamorphosis.core.Contact
import org.metamorphosis.core.Address
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine
import java.sql.Timestamp

class ModuleDao extends AbstractDao {

    def getStructures(instance,user) {
     def results = []
     try {
      def connection = getConnection(user.structure)
       def SQL = "select id, name, country, city,location,createdOn,createdBy from ${instance};"
	   def stmt = connection.createStatement()
	   def rs = stmt.executeQuery(SQL)
	   while(rs.next()) {
	      def result = new Structure()
	      result.id = rs.getLong("id")
	      result.name = rs.getString("name")
	      result.address.country = rs.getString("country")
	      result.address.city = rs.getString("city")
	      result.address.location = rs.getString("location")
	      result.createdOn = rs.getTimestamp("createdOn")
	      results << result
	   }
	   stmt.close()
	   connection.close()
	   }catch(e) {
	     println e
	   }
	    results
    }
    
    def getStructure(instance,id,user) {
     def result=null;
     try {
      def connection = getConnection(user.structure)
       def SQL = "select * from ${instance} where id = ${id};"
	   def stmt = connection.createStatement()
	   def rs = stmt.executeQuery(SQL)
	   if(rs.next()) {
	      result = new Structure()
	      result.id = rs.getLong("id")
	      result.name = rs.getString("name")
	      result.sigle = rs.getString("sigle")
	      result.type = getValue("type",rs.getString("typeof"))
	      result.business = getValue("business",rs.getString("business"))
	      result.state = getValue("state",rs.getString("state"))
	      result.target = getValue("target",rs.getString("target"))
	      result.address.country = rs.getString("country")
	      result.address.city = rs.getString("city")
	      result.address.location = rs.getString("location")
	      result.address.longitude = rs.getString("longitude")
	      result.address.latitude = rs.getString("latitude")
	      result.address.altitude = rs.getString("altitude")
	      result.address.telephone = rs.getString("telephone")
	      result.address.email = rs.getString("email")
	      result.address.bp = rs.getString("bp")
	      result.address.fax = rs.getString("fax")
	      result.address.website = rs.getString("website")
	      result.address.youtube = rs.getString("youtube")
	      result.address.facebook = rs.getString("facebook")
	      result.address.twitter = rs.getString("twitter")
	      result.createdOn = rs.getTimestamp("createdOn")
	      result.createdBy = getUser(rs.getLong("createdBy"))
	   }
	   stmt.close()
	   connection.close()
	   }catch(e) {
	     println e
	   }
	   result
    }
    
    def saveStructure(instance,structure,user) {
     try {
       def connection = getConnection(user.structure)
       def SQL = """\
           insert into ${instance}(name,sigle,typeof,business,state,target,country,city,location,telephone,email,website,createdBy) 
           values("${structure.name}","${structure.sigle}","${structure.type}","${structure.business}","${structure.state}","${structure.target}","${structure.address.country}","${structure.address.city}",
           "${structure.address.location}","${structure.address.telephone}","${structure.address.email}","${structure.address.website}",${user.id}) ;"""
	   def stmt = connection.createStatement()
	   stmt.executeUpdate(SQL)
	     stmt.close()
	   connection.close()
	   }catch(e) {
	     println e
	   }
    }
}

class ModuleAction extends ActionSupport {

    def structure = new Structure()
    def contact = new Contact()
	def structures
	
	def String execute() {
	   println "getting customers"
	   def moduleDao = new ModuleDao()
	   structures = moduleDao.getStructures("customers",loggedUser)
	   SUCCESS
	}
	
	def showProspects() {
	    println "getting prospects"
	    def moduleDao = new ModuleDao()
	    structures = moduleDao.getStructures("prospects",loggedUser)
	    SUCCESS
	}
	
	def showPartners() {
	    println "getting partners"
	    def moduleDao = new ModuleDao()
	    structures = moduleDao.getStructures("partners",loggedUser)
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
	    def moduleDao = new ModuleDao()
	    moduleDao.saveStructure(structure.instance+"s",structure,loggedUser)
		return structure.instance
	}
	
	def showCustomer() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    def moduleDao = new ModuleDao()
	    structure = moduleDao.getStructure("customers",id,loggedUser)
	    structure.instance = "customer"
	    structure ? SUCCESS : ERROR
	}
	
	def showProspect() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    def moduleDao = new ModuleDao()
	    structure = moduleDao.getStructure("prospects",id,loggedUser)
	    structure.instance = "prospect"
	    structure ? SUCCESS : ERROR
	}
	
	def showPartner() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    def moduleDao = new ModuleDao()
	    structure = moduleDao.getStructure("partners",id,loggedUser)
	    structure.instance = "partner"
	    structure ? SUCCESS : ERROR
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
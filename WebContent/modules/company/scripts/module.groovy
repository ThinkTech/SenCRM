import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import org.metamorphosis.core.Structure
import org.metamorphosis.core.Contact
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine
import java.sql.Timestamp

class ModuleDao extends AbstractDao {

    def getStructures(instance,user) {
     def results = []
     try {
      def connection = getConnection(user)
       def SQL = "select id, name, country, city,location,createdOn,createdBy from structures where instance = '${instance}';"
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
    
    def getStructure(id,user) {
     def result=null;
     try {
      def connection = getConnection(user)
      def stmt = connection.createStatement()
       def SQL = "select * from structures where id = ${id};"
	   def rs = stmt.executeQuery(SQL)
	   if(rs.next()) {
	      result = new Structure()
	      result.id = rs.getLong("id")
	      result.name = rs.getString("name")
	      result.sigle = rs.getString("sigle")
	      result.instance = rs.getString("instance")
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
	   SQL = "select * from contacts where structure_id = ${result.id};"
	   rs = stmt.executeQuery(SQL)
	   while(rs.next()) {
	      def contact = new Contact()
	      contact.id = rs.getLong("id")
	      contact.firstName = rs.getString("firstName")
	      contact.lastName = rs.getString("lastName")
	      contact.profession = rs.getString("profession")
	      contact.address.country = rs.getString("country")
	      contact.address.city = rs.getString("city")
	      contact.address.telephone = rs.getString("telephone")
	      contact.address.mobile = rs.getString("mobile")
	      contact.address.email = rs.getString("email")
	      contact.address.bp = rs.getString("bp")
	      contact.address.fax = rs.getString("fax")
	      contact.address.website = rs.getString("website")
	      contact.address.youtube = rs.getString("youtube")
	      contact.address.facebook = rs.getString("facebook")
	      contact.address.twitter = rs.getString("twitter")
	      contact.createdOn = rs.getTimestamp("createdOn")
	      contact.createdBy = getUser(rs.getLong("createdBy"))
	      result.contacts << contact
	   }
	   stmt.close()
	   connection.close()
	   }catch(e) {
	     println e
	   }
	   result
    }
    
    def saveStructure(structure,user) {
     try {
       def connection = getConnection(user)
       def stmt = connection.createStatement()
       def SQL = """\
           insert into structures(name,sigle,instance,typeof,business,state,target,country,city,location,telephone,email,website,createdBy) 
           values("${structure.name}","${structure.sigle}","${structure.instance}","${structure.type}","${structure.business}","${structure.state}","${structure.target}","${structure.address.country}","${structure.address.city}",
           "${structure.address.location}","${structure.address.telephone}","${structure.address.email}","${structure.address.website}",${user.id}) ;"""
	   stmt.executeUpdate(SQL,java.sql.Statement.RETURN_GENERATED_KEYS);
	   def generatedKeys = stmt.getGeneratedKeys()
	   if(generatedKeys.next()) {
            structure.id = generatedKeys.getLong(1);
            def contact = structure.contacts[0]
            SQL = """\
            insert into contacts(firstName,lastName,profession,email,country,city,telephone,mobile,createdBy,structure_id) 
            values("${contact.firstName}","${contact.lastName}","${contact.profession}","${contact.address.email}","${contact.address.country}","${contact.address.city}",
            "${contact.address.telephone}","${contact.address.mobile}",${user.id},${structure.id}) ;"""
	        stmt.executeUpdate(SQL)
       }
	   stmt.close()
	   connection.close()
	   }catch(e) {
	     println e
	   }
    }
    
    def createAccount(structure,contact,user) {
     try {
       def connection = getConnection()
       def stmt = connection.createStatement()
       def SQL = """\
           insert INTO users(firstName,lastName,email,password,role,structure_id) 
           VALUES("${contact.firstName}","${contact.lastName}","${contact.address.email}","passer","${structure.instance}",${user.structure.id});
           ;"""
	   stmt.executeUpdate(SQL);
	   stmt.close()
	   connection.close()
	   }catch(e) {
	     println e
	   }
    }
    
    def searchStructures(instance,search,user) {
     def results = []
     try {
      def connection = getConnection(user)
       def SQL = "select id, name, country, city,location,createdOn,createdBy from structures where instance = '${instance}' and ${search.filter} like '${search.value}%';"
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
    
}

class ModuleAction extends ActionSupport {

    def structure = new Structure()
    def contact = new Contact()
	def structures
	
	def String execute() {
	   println "getting customers"
	   showStructures("customer")
	}
	
	def showStructures(instance) {
	   def moduleDao = new ModuleDao()
	   structures = moduleDao.getStructures(instance,loggedUser)
	   SUCCESS
	}
	
	def showProspects() {
	    println "getting prospects"
	    showStructures("prospect");
	}
	
	def showPartners() {
	    println "getting partners"
	    showStructures("partner")
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
	    structure.contacts << contact
	    moduleDao.saveStructure(structure,loggedUser)
	    if(structure.createAccount && contact.address.email) {
	        moduleDao.createAccount(structure,contact,loggedUser)
	    	def mailSender = new MailSender()
	    	def fullName = contact.firstName + " " + contact.lastName
	    	def mail = new Mail(fullName,contact.address.email,"Invitation",getTemplate(structure))
	    	mailSender.sendMail(mail,true)
	    }
		return structure.instance
	}
	
	def showStructure() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    def moduleDao = new ModuleDao()
	    structure = moduleDao.getStructure(id,loggedUser)
	    structure ? SUCCESS : ERROR
	}
	
	def deleteStructure() {
	    Long id = Long.parseLong(request.getParameter("id"))
	    def moduleDao = new ModuleDao()
	    return request.getParameter("instance")
	}
	
	
	def search(instance) {
	    if(!search.value) {
	    	showStructures(instance)
	    }else {
	       def moduleDao = new ModuleDao()
	       structures = moduleDao.searchStructures(instance,search,loggedUser)
	    }
	}
	
	def searchCustomers() {
	    search("customer")
	    SUCCESS
	}
	
	def searchProspects() {
	    search("prospect")
	    SUCCESS
	}
	
	def searchPartners() {
	    search("partner")
	    SUCCESS
	}
		
	def getTemplate(structure) {
	    TemplateConfiguration config = new TemplateConfiguration()
		MarkupTemplateEngine engine = new MarkupTemplateEngine(config)
		def text = '''\
		 div(style : "margin-left:auto;margin-right:auto;width:90%") {
		    img(src : "https://thinktech.sn/images/logo.png", style : "display:block;margin : 0 auto")
		    div(style : "margin-top:10px;padding:10px;height:90px;text-align:center;background:#eee") {
		      h4(style : "font-size: 200%;color: rgb(0, 0, 0);margin: 3px") {
		        span("Invitation from $structure.name $structure.sigle")
		      }
		      
		    }
		    div(style : "width:60%;margin:auto;margin-top : 30px;margin-bottom:30px") {
		      p("invitation message")
		    }
		    div(style : "text-align:center") {
		       a(href : "$url",style : "width:100px;margin:auto;text-decoration:none;text-transform:uppercase;background: #06d0d8;display:block;padding:10px;border-radius:2px;border:1px solid #ccc;color:#fff;") {
		         span("Confirm")
		       }
		    }
		    div(style : "margin-top:20px;background:#eee;padding-top:15px;height:30px;text-align:center;") {
		       p("contact <a href='mailto:info@thinktech.sn'>info@thinktech.sn</a> to get additional information");
		    }
		 }
		'''
		def template = engine.createTemplate(text).make([structure:structure, url : baseUrl+"/invitations/confirm?id=12455666666"])
		template.toString()
	}
		
}

new ModuleAction()
import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.Mail
import org.metamorphosis.core.MailConfig
import org.metamorphosis.core.MailSender
import groovy.text.markup.TemplateConfiguration
import groovy.text.markup.MarkupTemplateEngine

class Ticket {
  long id
  String department
  String product
  String subject
  String message
  String priority
  Date dateCreation
  Date dateClose
  String status
  def messages = []
  def user
}

class Message {
  Date dateCreation
  String content
  def user
}

class TicketAction extends ActionSupport {

	def ticket = new Ticket()
	def message = new Message()
	def tickets
	
	def createTicket() {
	    SUCCESS
	}
	
	def saveTicket()  {
	    tickets = session.getAttribute("openedTickets")
	    ticket.id = new Random().nextLong() + 1
	    ticket.dateCreation = new Date()
	    ticket.status = "on support"
	    ticket.user = loggedUser;
	    tickets << ticket
	    def mailSender = new MailSender()
	    def mail = new Mail(ticket.user.fullName,ticket.user.email,ticket.subject,getTemplate(ticket,ticket.message))
	    mailSender.sendMail(mail,true)
		SUCCESS
	}
	
	def String execute() {
	   println "opened tickets"
	   tickets = session.getAttribute("openedTickets")
	   if(!tickets) {
	   		tickets = []
	   		session.setAttribute("openedTickets",tickets) 
	   }
	   SUCCESS
	}
		
	def showClosedTickets() {
	   println "closed tickets"
	   tickets = session.getAttribute("closedTickets")
	   if(!tickets) {
	   		tickets = []
	   		session.setAttribute("closedTickets",tickets) 
	   }
	   SUCCESS
	}
	
	def showTicket()  {
	    Long id = Long.parseLong(request.getParameter("id"))
	    def tickets = session.getAttribute("openedTickets")
	    def found;
	    for(int i=0;i<tickets.size();i++) {
	        if(id.equals(tickets[i].id)) {
	           ticket = tickets[i]
	           found = true
	           break
	        }
	    }
	    if(!found) {
	       tickets = session.getAttribute("closedTickets") ? session.getAttribute("closedTickets") : [] 
	       for(int i=0;i<tickets.size();i++) {
	        if(id.equals(tickets[i].id)) {
	           ticket = tickets[i]
	           found = true
	           break
	        }
	       }
	    }
	    found ? SUCCESS : ERROR
	}
	
	def addMessage()  {
	    tickets = session.getAttribute("openedTickets")
	    for(int i=0;i<tickets.size();i++) {
	        if(ticket.id.equals(tickets[i].id)) {
	           message.dateCreation = new Date()
	           message.user = loggedUser
	           tickets[i].messages << message
	           if(message.user.role.equals("customer")) {
	              tickets[i].status = "on support"
	           }else {
	              tickets[i].status = "on customer"
	           }
	           break
	        }
	    }
	    def mailSender = new MailSender()
	    def mail = new Mail(message.user.fullName,message.user.email,ticket.subject,getTemplate(ticket,message.content))
	    mailSender.sendMail(mail,true)
		response.sendRedirect(request.getHeader("referer"))
	}
	
	def closeTicket()  {
	    Long id = Long.parseLong(request.getParameter("id"))
	    def tickets = session.getAttribute("openedTickets")
	    def closedTickets = session.getAttribute("closedTickets") ? session.getAttribute("closedTickets") : [] 	
	    def index
	    for(int i=0;i<tickets.size();i++) {
	        if(id.equals(tickets[i].id)) {
	           tickets[i].dateClose = new Date()
	           tickets[i].status = "closed"
	           closedTickets << tickets[i]
	           index = i
	           break
	        }
	    }
	    tickets.remove(index)
	    session.setAttribute("openedTickets",tickets) 
	    session.setAttribute("closedTickets",closedTickets) 
		SUCCESS
	}
	
	def searchOpenedTickets() {
	    println "search opened tickets"
	    def openedTickets = session.getAttribute("openedTickets")
	    tickets = []
	    if(search.value) {
		    for(ticket in openedTickets) {
		       if(search.filter.equals("id")) {
		          if(ticket.id.equals(new Long(search.value))) {
		             tickets << ticket
		          }
		       }else if(search.filter.equals("subject")) {
		          println ticket.subject
		          if(ticket.subject.startsWith(search.value)) {
		             tickets << ticket
		          }
		       }
		    }
		  SUCCESS  
	    }else {
	     execute()
	    }
	}
	
	def searchClosedTickets() {
	    println "search closed tickets"
	    def closedTickets = session.getAttribute("closedTickets")
	    tickets = []
	    if(search.value) {
		    for(ticket in closedTickets) {
		       if(search.filter.equals("id")) {
		          if(ticket.id.equals(new Long(search.value))) {
		             tickets << ticket
		          }
		       }else if(search.filter.equals("subject")) {
		          println ticket.subject
		          if(ticket.subject.startsWith(search.value)) {
		             tickets << ticket
		          }
		       }
		    }
		  SUCCESS  
	    }else {
	     showClosedTickets()
	    }
	}
	
	def getTemplate(ticket,message) {
	    TemplateConfiguration config = new TemplateConfiguration()
		MarkupTemplateEngine engine = new MarkupTemplateEngine(config)
		def text = '''\
		 div {
		    img(src : "http://thinktech.sn/images/logo.png", style : "display:block;margin : 0 auto")
		    div(style : "margin-top:10px;padding:10px;height:120px;text-align:center;background:#eee") {
		      h4(style : "font-size: 35px;color: rgb(0, 0, 0);white-space: nowrap;margin: 3px") {
		        span("New Notification from the technical support")
		      }
		      h1(style : "font-size: 29px;white-space: nowrap;color:#06d0d8;margin: 3px;font-weight: bold;text-transform: uppercase;line-height: 57px;") {
		        span("Ticket : $ticket.id")
		      }
		    }
		    div(style : "width:60%;margin:auto;margin-bottom:30px") {
		      p("$message")
		    }
		    div(style : "text-align:center") {
		       a(href : "$url",style : "width:100px;margin:auto;text-decoration:none;text-transform:uppercase;background: #06d0d8;display:block;padding:10px;border-radius:2px;border:1px solid #eee;color:#fff;") {
		         span("See Ticket")
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

new TicketAction()
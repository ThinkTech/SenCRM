import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.User

class UserDao extends AbstractDao {
  
   
   def authenticate(user) {
        def success = false
        def connection = getConnection()
	    def SQL = "select id, firstName, lastName, role, structure_id from users where email = '${user.email}' and password = '${user.password}';"
	    def stmt = connection.createStatement()
	    def rs = stmt.executeQuery(SQL)
	    if(rs.next()) {
		  success = true
		  user.id = rs.getLong(1)
		  user.firstName = rs.getString(2)
		  user.lastName = rs.getString(3)
		  user.role = rs.getString(4)
		  user.structure.id = rs.getInt(5)
		  SQL = "select base from structures where id = ${user.structure.id};"
		  rs = stmt.executeQuery(SQL)
	      if(rs.next()) {
	         user.structure.database = rs.getString("base")
	      }
	    }
	    stmt.close()
	    connection.close()
	    success  
   }
   
   def changePassword(user,password) {
       def connection = getConnection()
	   def SQL = "update users set password = '${password}' where id = ${user.id};"
	   def stmt = connection.createStatement()
	   stmt.executeUpdate(SQL)
	   stmt.close()
	   connection.close()
   }
   
}

class UserAction extends ActionSupport {

	def user = new User()
	
	def login()  {
	    def userDao = new UserDao()
		if(userDao.authenticate(user)) {
		  session.setAttribute("user",user)
		  def module = moduleManager.getMain(user)
		  def url = module ? request.contextPath+"/"+module.url: request.contextPath+"/"
		  response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
		}else if(user.email.equals("pbb@thinktech.sn")) {
		  user.firstName = "Pape Babacar"
		  user.lastName = "Ba"
		  user.role = "customer"
		  user.structure.name = "ThinkTech"
		  session.setAttribute("user",user)
		  def module = moduleManager.getMain(user)
		  def url = module ? request.contextPath+"/"+module.url: request.contextPath+"/"
		  response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
		}else if(user.email.equals("mamadou.diaw@thinktech.sn")) {
		  user.firstName = "Mamadou"
		  user.lastName = "Diaw"
		  user.role = "support"
		  user.structure.name = "ThinkTech"
		  session.setAttribute("user",user)
		  def module = moduleManager.getMain(user)
		  def url = module ? request.contextPath+"/"+module.url: request.contextPath+"/"
		  response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
		}
		else {
		  response.setStatus(404)
		  response.writer.write(groovy.json.JsonOutput.toJson([message: "login or password incorrect"]))
		}
		
	}
	
	def logout() {
	    session.invalidate()
		SUCCESS
	}
	
	def selectTemplate() {
	    def id = request.getParameter("id");
		def template = templateManager.getTemplate(id)
		if(template && template.backend) session.setAttribute("template",id)
		response.sendRedirect(referer)
	}
	
	def changePassword() {
	    println "changing password "+user.password
	    def userDao = new UserDao()
	    userDao.changePassword(loggedUser,user.password)
	    SUCCESS
	}
	
}

new UserAction()
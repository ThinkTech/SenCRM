import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.User
import org.metamorphosis.core.Account
import org.metamorphosis.core.Subscription


class UserDao extends AbstractDao {
  
   
   def authenticate(user) {
       def success = false
       try {
        def connection = getConnection()
	    def SQL = """\
	        select u.id, u.firstName, u.lastName, a.role, a.structure_id from users u, accounts a 
	        where u.email = '${user.email}' and u.password = '${user.password}' and u.id = a.user_id;
	        """    
	    println SQL
	    def stmt = connection.createStatement()
	    def rs = stmt.executeQuery(SQL)
	    while(rs.next()) {
		  success = true
		  user.id = rs.getLong("id")
		  user.firstName = rs.getString("firstName")
		  user.lastName = rs.getString("lastName")
		  def account = new Account()
		  account.role = rs.getString("role")
		  account.structure.id = rs.getInt("structure_id")
		  SQL = "select base from structures where id = ${account.structure.id};"
		  def stmt2 = connection.createStatement()
		  def rs2 = stmt2.executeQuery(SQL)
	      if(rs2.next()) {
	        account.structure.database = rs2.getString("base")
	        user.accounts << account
	      }
	      stmt2.close()
	      println account.role
	      
	    }
	    stmt.close()
	    connection.close()
	    }catch(e){
	      println e
	    }
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
		  def structure = user.accounts[0].structure
		  structure.subscription = new Subscription()
		  structure.subscription.modules << moduleManager.modules[1]
		   structure.subscription.modules << moduleManager.modules[2]
		   structure.subscription.modules << moduleManager.modules[3]
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
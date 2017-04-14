import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.User
import org.metamorphosis.core.Account
import org.metamorphosis.core.Subscription


class UserDao extends AbstractDao {
  
   
   def authenticate(moduleManager, user) {
       def success = false
       try {
        def connection = getConnection()
	    def SQL = """\
	        select id, firstName, lastName from users 
	        where email = '${user.email}' and password = '${user.password}';
	        """    
	    println SQL
	    def stmt = connection.createStatement()
	    def rs = stmt.executeQuery(SQL)
	    if(rs.next()) {
		  user.id = rs.getLong("id")
		  user.firstName = rs.getString("firstName")
		  user.lastName = rs.getString("lastName")
		  SQL = """\
	        select activated, role, structure_id from accounts 
	        where user_id = ${user.id};
	        """    
	       println SQL
	       rs = stmt.executeQuery(SQL)
	       while(rs.next()) {
	          def account = new Account()
		      account.activated = rs.getBoolean("activated")
		      if(account.activated) {
			    account.role = rs.getString("role")
			    account.structure.id = rs.getInt("structure_id")
			    SQL = "select a.base,b.modules from structures a,subscription b where a.id = b.structure_id and a.id = ${account.structure.id};"
			    stmt = connection.createStatement()
			    def rs2 = stmt.executeQuery(SQL)
		        if(rs2.next()) {
		          account.structure.database = rs2.getString("base")
		          account.structure.subscription = new Subscription()
		          def names = rs2.getString("modules").split(",")
		          for(def name : names) {
		            name = name.trim()
		            account.structure.subscription.modules << moduleManager.getModuleByName(name) 
		          }
		          user.accounts << account
		        }
	        }
	      }
	    }
	    success = user.accounts.size() ? true : false
	    println success
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
		if(userDao.authenticate(moduleManager,user)) {
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
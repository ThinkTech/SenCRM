import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.metamorphosis.core.Structure;
import org.metamorphosis.core.User;

public abstract class AbstractDao {

	protected Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");  
		return DriverManager.getConnection("jdbc:mysql://localhost/general","root","thinktech");
	}
	
	protected Connection getConnection(User user) throws Exception {
		/*Account account = user.getCurrentAccount();
		Structure structure = account.getStructure();
		///DatabaseInfo info = structure.getDatabaseInfo();
		Class.forName("com.mysql.jdbc.Driver");  
		return DriverManager.getConnection("jdbc:mysql://"+info.getHost()+":"+info.getPort()+"/"+info.getName(),info.getUser(),info.getPassword());*/
		return null;
	}
	
	protected Connection getConnection(Structure structure) throws Exception {
		/*DatabaseInfo info = structure.getDatabaseInfo();
		Class.forName("com.mysql.jdbc.Driver");  
		System.out.println("jdbc:mysql://"+info.getHost()+":"+info.getPort()+"/"+info.getName()+" " +info.getUser()+" "+info.getPassword());
		return DriverManager.getConnection("jdbc:mysql://"+info.getHost()+":"+info.getPort(),info.getUser(),info.getPassword());*/
		return null;
	}
	
	protected User getUser(Long id) throws Exception {
		User user = null;
		Connection connection = getConnection();
		String SQL = "select firstName, lastName from users where id ="+id;
	    Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(SQL);
	    if(rs.next()) {
	      user = new User();
		  user.setFirstName(rs.getString(1));
		  user.setLastName(rs.getString(2));
	    }
	    stmt.close();
	    connection.close();
		return user;
	}
	
}

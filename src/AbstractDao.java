import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.metamorphosis.core.Structure;
import org.metamorphosis.core.User;

public abstract class AbstractDao {

	
	protected Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");  
		return DriverManager.getConnection("jdbc:mysql://localhost/common","root","thinktech");
	}
	
	protected Connection getConnection(Structure structure) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");  
		return DriverManager.getConnection("jdbc:mysql://localhost/"+structure.getDatabase(),"root","thinktech");
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
	
	public String getValue(String key,String value) {
	   return DataManager.getInstance().getValue(key,value);	
	}
	
}

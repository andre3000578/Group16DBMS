import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
public class sample {
public static void main(String[] args) throws SQLException {
// Connect to database
final String hostName = "ajay2704-sql-server.database.windows.net";
final String dbName = "cs-dsa-4513-sql-db";
final String user = "ajay2704";
final String password = "Andre896$";
final String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;hostNameInCertificate=*.database.windows.net;loginTimeout=30;",
hostName, dbName, user, password);
int flag = 0;

Scanner scan = new Scanner(System.in);
try (final Connection connection = DriverManager.getConnection(url)) {
	final String schema = connection.getSchema();
	System.out.println("Successful connection - Schema:" + schema);
	System.out.println("Please insert 1 - 4.");
	System.out.println("=========================================");
	
	
	//final String selectSql = "INSERT (pid, pname, max_score, aid) INTO Problem";
	while(true) {
		
		switch(flag = scan.nextInt()) {
		case 1: 
			try 
				{
					String command = "{call ProblemProcedure()}";
					CallableStatement stmt = connection.prepareCall(command);
					
					stmt.execute();
					System.out.println("Stored Procedure Executed Successfully:");
					
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			break;
			
		case 2:
			try 
			{
				String command = "{call ProblemProcedure()}";
				CallableStatement stmt = connection.prepareCall(command);
				
				stmt.execute();
				System.out.println("Stored Procedure Executed Successfully:");
				
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
		break;
		
		case 3:
			try 
			{
				String command = "{call DisplayProblemAuthor()}";
				CallableStatement stmt = connection.prepareCall(command);
				
				stmt.execute();
				System.out.println("Stored Procedure Executed Successfully:");
				
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
		break;
		
		case 4: System.exit(0);
		break;
		default:
			System.out.println("Please choose option 1 through 4");
			break;
		}
	}
	
	
	
}
}
}
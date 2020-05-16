
import java.sql.Connection;
import java.sql.*; 
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class paperreview {
	public static void First() {
		try {
			
			System.out.format("Query :1:");
            // create our my sql database connection
            String myDriver = "com.mysql.cj.jdbc.Driver";
            final String myUrl= "jdbc:mysql://localhost/PAPERREVIEW?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(myUrl, "root", "temp123");

            // our SQL SELECT query.
            // if you only need a few columns, specify them by name instead of using "*"
            String query = "SELECT \n" + 
            		"    p.paperid,\n" + 
            		"    p.title,\n" + 
            		"    p.abstract,\n" + 
            		"    a.emailaddress,\n" + 
            		"    a.firstname,\n" + 
            		"    a.lastname\n" + 
            		"FROM\n" + 
            		"    PAPER AS p,\n" + 
            		"    AUTHOR AS a\n" + 
            		"WHERE\n" + 
            		"    p.Emailaddress = a.Emailaddress;";

            // create the java statement
            Statement st = conn.createStatement();

            // execute the query, and get a java result set
            ResultSet rs = st.executeQuery(query);

            // iterate through the java result set
            while (rs.next()) {
                
                int paperid = rs.getInt("paperid");
                String title = rs.getString("title");
                String abstrac = rs.getString("abstract");
                String Emailaddress= rs.getString("Emailaddress");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
               
                 


                // print the results
                System.out.format(" %d,%S,%S,%S,%S,%S\n",paperid, title, abstrac,Emailaddress, firstname,lastname);
            }
            st.close();
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        }
	}

	
	public static void Second() {
		try {
			
			System.out.format("Query 2:");
            // create our my sql database connection
            String myDriver = "com.mysql.cj.jdbc.Driver";
            final String myUrl= "jdbc:mysql://localhost/PAPERREVIEW?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(myUrl, "root", "temp123");

            // our SQL SELECT query.
            // if you only need a few columns, specify them by name instead of using "*"
            String query = "SELECT * FROM REVIEW";

            // create the java statement
            Statement st = conn.createStatement();

            // execute the query, and get a java resultset
            ResultSet rs = st.executeQuery(query);

            // iterate through the java resultset
            while (rs.next()) {
                
                int reviewid = rs.getInt("reviewid");
                String recommendation = rs.getString("recommendation");
                 int merit = rs.getInt("meritscore");
                 int readability = rs.getInt("readabilityscore");
                 int originality = rs.getInt("originalityscore");
                 int relavance = rs.getInt("relavancescore");
                 int paperid = rs.getInt("paperid");
                 int reviewerid  = rs.getInt("reviewerid");
                 


                // print the results
                System.out.format(" %d,%S,%d,%d,%d,%d,%d,%d\n",reviewid, recommendation, merit, readability, originality ,relavance,paperid,reviewerid);
            }
            st.close();
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        }
	}
		
		public static void Third() {
			try {
				
				System.out.format("Query:3:");
	            // create our my sql database connection
	            String myDriver = "com.mysql.cj.jdbc.Driver";
	            final String myUrl= "jdbc:mysql://localhost/PAPERREVIEW?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	            Class.forName(myDriver);
	            Connection conn = DriverManager.getConnection(myUrl, "root", "temp123");

	            // our SQL SELECT query.
	            // if you only need a few columns, specify them by name instead of using "*"
	            String query = "select count(*) from PAPER";

	            // create the java statement
	            Statement st = conn.createStatement();

	            // execute the query, and get a java resultset
	            ResultSet rs = st.executeQuery(query);

	            // iterate through the java resultset
	            while (rs.next()) {
	               

	                 int count = rs.getInt(1);
	                // print the results
	                 System.out.println("Number of papers: "+count);
	            }
	            st.close();
	        } catch (Exception e) {
	            System.err.println("Got an exception! ");
	            System.err.println(e.getMessage());
	        }
    }
		public static void Fourth() {
			try {
				
				System.out.format("Query :4:");
				System.out.format("Data has been entered successfully");
	            // create our my sql database connection
	            String myDriver = "com.mysql.cj.jdbc.Driver";
	            final String myUrl= "jdbc:mysql://localhost/PAPERREVIEW?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	            Class.forName(myDriver);
	            Connection conn = DriverManager.getConnection(myUrl, "root", "temp123");

	            // our SQL SELECT query.
	            // if you only need a few columns, specify them by name instead of using "*"
	            String query1 =  "INSERT INTO AUTHOR " +"VALUES ('akarsh@gmail.com', 'akarsh', 'varre')";
	            String query2 =  "INSERT INTO PAPER " +"VALUES ('106', 'Twostates', 'a year of love','Loved','akarsh@gmail.com')";
	           
	            // create the java statement
	            Statement st = conn.createStatement();
	            st.executeUpdate(query1);
	            st.executeUpdate(query2);
	           
	           
	            st.close();
	        } catch (Exception e) {
	            System.err.println("Got an exception! ");
	            System.err.println(e.getMessage());
	        }
		}
		 
		

		public static void Fifth() {
		try {
			System.out.format("Query: 5:");
            // create our my sql database connection
            String myDriver = "com.mysql.cj.jdbc.Driver";
            final String myUrl= "jdbc:mysql://localhost/PAPERREVIEW?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(myUrl, "root", "temp123");

            // our SQL SELECT query.
            // if you only need a few columns, specify them by name instead of using "*"
            String query = "DELETE from AUTHOR where Lastname='Bhagat'";

            // create the java statement
            Statement st = conn.createStatement();
            st.executeUpdate(query);
            System.out.println("Record cannot be deleted");
            st.close();
            
            
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            System.out.println("We have defined emailaddress as a primary key for AUTHOR table so if we try to deletea record we get an exception foreign key constriant fails");
        }
	}
	  
        public static void main(String[] args) {
        	First();
        	Second();
        	Third();
        	Fourth();
        	Fifth();
        	
        }
                }
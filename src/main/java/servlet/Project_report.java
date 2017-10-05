package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ennvee.ProjectManagement.beans.Allocationobject;
import com.ennvee.ProjectManagement.dao.DatabaseManagement;
/**
 * Servlet implementation class Project_report
 */
public class Project_report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Project_report() {
        super();
    }

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		 response.setContentType("text/html");
		 PrintWriter out = response.getWriter();
		
		out.print("<html>"
				+ "<head>");
		 out.println("<script type='text/javascript'>");
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/javascript/functions.js");
		 out.println("</script>");
	out.print("<title>Project Report</title>"
				+ "<style>table, th, td {    border: 1px solid black;    border-collapse: collapse;}</style>"
				+ "</head>"
				+ "<body>"
				+ "<table >");
		
		try
		{
		//	String sql="select * from ";
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			
			
			ResultSet rs = stm.executeQuery("SELECT * FROM project_details");
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();

			// The column count starts from 1
			out.print("<tr>");
			out.print("<th>SER.NO</th>");
			for (int i = 1; i <= columnCount; i++ ) {
				
				out.print("<th>");
				out.print(rsmd.getColumnName(i).toUpperCase());
				out.print("</th>");
				
			 // String name = rsmd.getColumnName(i);
			  
			}
out.print("</tr>");
			int rowcount=1;
			
			while(rs.next())
			{
				
				out.print("<tr>");
				for (int i = 1; i <= columnCount; i++ ) {
				out.print("<td>");
				out.print(rs.getString(i));
				out.print("</td>");	
				
			}
				out.print("</tr>");
			}
			
		}catch(SQLException e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
	}
		
		
		
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	

}
}
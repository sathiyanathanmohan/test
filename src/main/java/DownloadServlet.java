import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.jcr.Repository;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jcr.Node;
import javax.jcr.Property;
import javax.jcr.PropertyIterator;
import javax.jcr.RepositoryException;

//import org.apache.jackrabbit.commons.JcrUtils;



public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 

 HttpSession session = request.getSession();
		String var = (String) session.getAttribute("value");
          System.out.println("Value:"+var);
          
          
          
          byte requestBytes[] = var.getBytes();
			ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +var );
           byte[] buf = new byte[1024];
			  int len;
			  while ((len = bis.read(buf)) > 0){
					  response.getOutputStream().write(buf, 0, len);
					 }
			bis.close();
			response.getOutputStream().flush(); 	

}
	}
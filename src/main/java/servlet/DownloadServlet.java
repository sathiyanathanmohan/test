package servlet;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jcr.AccessDeniedException;
import javax.jcr.Binary;
import javax.jcr.InvalidItemStateException;
import javax.jcr.ItemExistsException;
import javax.jcr.Node;
import javax.jcr.Property;
import javax.jcr.PropertyIterator;
import javax.jcr.ReferentialIntegrityException;
import javax.jcr.RepositoryException;
import javax.jcr.lock.LockException;
import javax.jcr.nodetype.ConstraintViolationException;
import javax.jcr.nodetype.NoSuchNodeTypeException;
import javax.jcr.version.VersionException;

import org.apache.jackrabbit.commons.JcrUtils;
import org.mortbay.jetty.ResourceCache.Content;


public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String filename = request.getParameter("filename");
		System.out.println("filename" + filename);
		String pro=request.getParameter("projectid");
		System.out.println("project name"+pro);
			 
		Repository repository = null;
		Session session1 = null;

		Node root = null;
		try {
			repository = JcrUtils.getRepository();
			session1 = repository.login(new SimpleCredentials("admin", "admin"
					.toCharArray()));
			root = session1.getRootNode();
		} catch (RepositoryException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String user = session1.getUserID();
		String name = repository.getDescriptor(Repository.REP_NAME_DESC);
		System.out.println("Logged in as " + user + " to a " + name
				+ " repository.");
		String headerValue = String.format("attachment; filename=\"%s\"", filename);
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition",headerValue);
		try {
			System.out.println("out part.....");
			session1.save();
			Node file = root.getNode(pro);
			System.out.println("Project node"+file);
			Node f1=file.getNode(filename);
			Node content = f1.getNode("jcr:content");
			String path = content.getPath();
			Binary bin = session1.getNode(path).getProperty("jcr:data")
					.getBinary();
			System.out.println("Download Path");
			//PrintWriter out=response.getWriter();
			
			InputStream fileInputStream = (InputStream) bin.getStream();
			OutputStream outStream = response.getOutputStream();
			//File f=new File("D:\\New\\",filename);
			  byte[] buffer = new byte[4096];
		        int bytesRead = -1;
		         
		        while ((bytesRead = fileInputStream.read(buffer)) != -1) {
		            outStream.write(buffer, 0, bytesRead);
		        }
			
			fileInputStream.close();
			outStream.close();
			System.out.println("\nFile is created...................................");
	      
			}
	
			

//			String filePath = "C:\\Jackrabbit\\repository\\"+filename;
//			System.out.println("File path"+filePath);
//	        File downloadFile = new File(filePath);
//	        FileInputStream inStream = new FileInputStream(downloadFile);
//	         
//	        // if you want to use a relative path to context root:
//	        String relativePath = getServletContext().getRealPath("");
//	        System.out.println("relativePath = " + relativePath);
//	         
//	        // obtains ServletContext
//	        ServletContext context = getServletContext();
//	         
//	        // gets MIME type of the file
//	        String mimeType = context.getMimeType(filePath);
//	        if (mimeType == null) {        
//	            // set to binary type if MIME mapping not found
//	            mimeType = "application/octet-stream";
//	        }
//	        System.out.println("MIME type: " + mimeType);
//	         
//	        // modifies response
//	        response.setContentType(mimeType);
//	        response.setContentLength((int) downloadFile.length());
//	         
//	        // forces download
//	        String headerKey = "Content-Disposition";
//	        String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
//	        response.setHeader(headerKey, headerValue);
//	         
//	        // obtains response's output stream
//	        OutputStream outStream = response.getOutputStream();
//	         
//	        byte[] buffer = new byte[4096];
//	        int bytesRead = -1;
//	         
//	        while ((bytesRead = inStream.read(buffer)) != -1) {
//	            outStream.write(buffer, 0, bytesRead);
//	        }
//	         
//	        inStream.close();
//	        outStream.close();     
			
			
		 catch (IOException e) {
			System.out.println("Exception: " + e);
		} catch (AccessDeniedException e) {

			e.printStackTrace();
		} catch (ItemExistsException e) {
			System.out.println("File notException: " + e );
			e.printStackTrace();
		} catch (ReferentialIntegrityException e) {

			e.printStackTrace();
		} catch (ConstraintViolationException e) {

			e.printStackTrace();
		} catch (InvalidItemStateException e) {

			e.printStackTrace();
		} catch (VersionException e) {

			e.printStackTrace();
		} catch (LockException e) {

			e.printStackTrace();
		} catch (NoSuchNodeTypeException e) {

			e.printStackTrace();
		} catch (RepositoryException e) {

			e.printStackTrace();
		} 
		
		finally {
			session1.logout();
		}
		
		
	}
}

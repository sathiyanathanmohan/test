package com.ennvee.ProjectManagement.dao;

import javax.jcr.RepositoryException;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.jcr.Binary;
import javax.jcr.Node;
import javax.jcr.Repository;
import javax.jcr.Credentials;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;

import org.apache.jackrabbit.commons.JcrUtils;


public class jk {
	private String hello;
	public void jackRabbit(String filePath, String projectname) {
	String fileLocation = filePath;

		String nodeName = projectname;
		System.out.println("File name"+fileLocation);
		try
		{
		nodeCreation(fileLocation, nodeName);
		}
		 catch (RepositoryException e) {
				System.out.println("Error:v " + e);
				// e.printStackTrace();
			}
		System.out.println("hai jk"+nodeName);
		System.out.println("sdf"+fileLocation);
		
}
	public void nodeCreation(String fileLocation, String nodeName)throws RepositoryException {

		System.out.println("coming in node creation");
		Repository repository = JcrUtils.getRepository();
		Session session = repository.login(new SimpleCredentials("admin",
				"admin".toCharArray()));
		Node root = session.getRootNode();
		
		
		
		String chance = nodeName;
		System.out.println("project name"+chance);

		File file1 = new File(fileLocation);

	
		String fileconverted = file1.getPath();
		
		Connection conn = null;
		String filePa = null;

		String filename = null;
		filePa = fileconverted.replace("\\", "\\\\");
//		
		File fa = new File(filePa);
//		System.out.println(fa.getName());
		filename = fa.getName();
		Node file = null;
//		saveFile(file1,chance,session,root);

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 conn = DriverManager
					 .getConnection("jdbc:sqlserver://ennvee5:1433;user=sa;password=root;database=projectmangementtools");
			 

			PreparedStatement ps=conn.prepareStatement("select * from projectid_file_mapping where project_id=?");
			ps.setString(1, chance);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				System.out.println("Already Exist");
				System.out.println("Project code"+chance);
				file =root.getNode(chance);
System.out.println("file node"+file);
				
				String sql1="insert into projectid_file_mapping (project_id,file_name) values"
						+ "('"+chance+"','"+filename+"')";
				Statement sta1 = conn.createStatement();

				int i1 = sta1.executeUpdate(sql1);
//				saveFile(file,file1,chance,session,root);
			}
		
			else {
				System.out.println("new folder node");
				file = root.addNode(chance, "nt:folder");
				System.out.println("node"+file);
				String sql1 = "insert into projectid_file_mapping (project_id,file_name) values( '" +chance + "','"+filename +"')";
				Statement sta1 = conn.createStatement();
				int i1 = sta1.executeUpdate(sql1);
				System.out.println("root"+root);
				 saveFile(file,file1,chance,session,root);
				
			}
			 
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception: " + e);
		}
		
		finally{
			if(conn != null){
				try{
					conn.close();
				}catch(Exception e){
					System.out.println("exception0");
					e.printStackTrace();
				}
			}
			
		}
	}	
	

	
	
	public void saveFile(Node file,File file1,String chance,Session session,Node root){
		
		String chance1 = chance;
		
//		File file2 = new File(file1);

	
		String fileconverted = file1.getPath();
		
		
		String filePa = null;

		String filename = null;
		filePa = fileconverted.replace("\\", "\\\\");
		System.out.println("file path"+filePa);
		File fa = new File(filePa);
		System.out.println(fa.getName());
		filename = fa.getName();
		
		Node file3 = file;
		Node file2 = null;
		Node content = null;
		FileInputStream stream = null;
		InputStream stream1 = null;
		try{

		file2 = file3.addNode(filename, "nt:file");

		stream = new FileInputStream(filePa);

		Binary binary = session.getValueFactory().createBinary(stream);


		content = file2.addNode("jcr:content", "nt:resource");

		content.setProperty("jcr:data", binary);

		stream.close();

		session.save();

		 session.save();
		
		 System.out.println("Root "+root);
		 file = root.getNode(chance1);
		
		 file2 = file.getNode(filename);
		
		 content = file2.getNode("jcr:content");
		
		 String path = content.getPath();
		
		 Binary bin = session.getNode(path).getProperty("jcr:data")
		 .getBinary();
		
		 stream1 = bin.getStream();
		
		 File f = new File("C:\\Jackrabbit\\repository\\", filename);
		
		 System.out.println("filename with filepath" + f);
		
		 OutputStream out = new FileOutputStream(f);
		
		 byte buf[] = new byte[1024];
		 int len;
		 while ((len = stream1.read(buf)) > 0)
		
		 out.write(buf, 0, len);
		 out.close();
		 stream1.close();
		
		
		 // output the repository content
	} catch (Exception e) {
		e.printStackTrace();
System.out.println("Exceptionjuij: " + e);
	} finally {
		session.logout();
	}
	}
	
}

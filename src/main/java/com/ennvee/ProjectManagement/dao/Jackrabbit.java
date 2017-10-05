package com.ennvee.ProjectManagement.dao;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.jcr.Binary;
import javax.jcr.Node;
import javax.jcr.Repository;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;

import org.apache.jackrabbit.commons.JcrUtils;

public class Jackrabbit {

	public static void main(String[] args) throws RepositoryException {
		Jackrabbit jackrabbit = new Jackrabbit();
		
		  Repository repository = JcrUtils.getRepository();
		  
          Session session = repository.login( new SimpleCredentials("admin", "admin".toCharArray()));
          
          Node root = session.getRootNode(); 
          
          String user = session.getUserID(); 
          String name = repository.getDescriptor(Repository.REP_NAME_DESC); 
          System.out.println( 
          "Logged in as " + user + " to a " + name + " repository."); 
		
		// Import the pdf file unless already imported 
	    // This program is for sample purpose only so everything is hard coded.
		try{
				if (!root.hasNode("Today.pdf"))
				{ 
				    System.out.print("Importing PDF... "); 
				
				    // Create an unstructured node under which to import the XML 
				    //Node node = root.addNode("importxml", "nt:unstructured"); 
				    Node file = root.addNode("Today.pdf","nt:file");
				
				    // Import the file "Alfresco_E0_Training.pdf" under the created node 
				    FileInputStream stream = new FileInputStream("C:\\jackrabbit\\Today.pdf"); 
				    Binary binary = session.getValueFactory().createBinary(stream);
				    Node content = file.addNode("jcr:content","nt:resource");
				    content.setProperty("jcr:data",binary);
				    stream.close();
				    session.save(); 
				    //System.out.println("done."); 
				    System.out.println("::::::::::::::::::::Checking content of the node:::::::::::::::::::::::::");
				    System.out.println("File Node Name : "+file.getName());
				    System.out.println("File Node Identifier : "+file.getIdentifier());
				    System.out.println("File Node child : "+file.JCR_CHILD_NODE_DEFINITION);
//				    System.out.println("Content Node Name : "+content.getName());
//				    System.out.println("Content Node Identifier : "+content.getIdentifier());
//				    System.out.println("Content Node Content : "+content.getProperty("jcr:data"));
				    System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
				
				}else
				{
					System.out.println("out part.....");
				    session.save();
				    Node file = root.getNode("Today.pdf");
				    Node content = file.getNode("jcr:content");
				    String path = content.getPath();
				    Binary bin = session.getNode(path).getProperty("jcr:data").getBinary();
				    InputStream stream = bin.getStream();
				     File f=new File("C:\\jackrabbit\\repository\\Today123.pdf");
				     
				      OutputStream out=new FileOutputStream(f);
				      byte buf[]=new byte[1024];
				      int len;
				      while((len=stream.read(buf))>0)
				      out.write(buf,0,len);
				      out.close();
				      stream.close();
				      System.out.println("\nFile is created...................................");
				
				
				    System.out.println("done."); 
				    System.out.println("::::::::::::::::::::Checking content of the node:::::::::::::::::::::::::");
				    System.out.println("File Node Name : "+file.getName());
				    System.out.println("File Node Identifier : "+file.getIdentifier());
				    //System.out.println("File Node child : "+file.JCR_CHILD_NODE_DEFINITION);
				    System.out.println("Content Node Name : "+content.getName());
				    System.out.println("Content Node Identifier : "+content.getIdentifier());
				    System.out.println("Content Node Content : "+content.getProperty("jcr:data"));
				    System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
				} 
	
	//output the repository content
	} 
	catch (IOException e){
		System.out.println("Exception: "+e);
	}
	finally { 
		session.logout(); 
	}  

	} 
}

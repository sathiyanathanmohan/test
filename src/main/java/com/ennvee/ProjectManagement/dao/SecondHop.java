package com.ennvee.ProjectManagement.dao;

import javax.jcr.Repository; 
import javax.jcr.Session; 
import javax.jcr.SimpleCredentials; 
import javax.jcr.Node; 
import org.apache.jackrabbit.commons.JcrUtils;

/** 
* Second hop example. Stores, retrieves, and removes example content. 
*/ 
public class SecondHop { 

    /** 
    * The main entry point of the example application. 
    * 
    * @param args command line arguments (ignored) 
    * @throws Exception if an error occurs 
    */ 
    public static void main(String[] args) throws Exception { 
    Repository repository = JcrUtils.getRepository();
        Session session = repository.login( 
        new SimpleCredentials("admin", "admin".toCharArray()));
        try { 
            Node root = session.getRootNode(); 

            // Store content 
            Node hello = root.addNode("hello"); 
            Node world = hello.addNode("world"); 
            world.setProperty("message", "Hello, World!"); 
            session.save(); 

            // Retrieve content 
            Node node = root.getNode("hello/world"); 
            System.out.println(node.getPath()); 
            System.out.println(node.getProperty("message").getString()); 

            // Remove content 
            root.getNode("hello").remove(); 
            session.save(); 
        } finally { 
            session.logout(); 
        } 
    } 

} 
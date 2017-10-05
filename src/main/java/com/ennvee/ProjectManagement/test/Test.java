package com.ennvee.ProjectManagement.test;
//
//
//import java.net.URLEncoder;
//
//
//import java.util.Date;
//
//import com.sun.jersey.api.client.Client;
//import com.sun.jersey.api.client.ClientResponse;
//
////import com.sun.jersey.api.client.Client;
////import com.sun.jersey.api.client.ClientResponse;
//
public class Test {
//	
//	
//	public static void testCreateproject(){
//		Date date=new Date();
//		String url = null;
//		try{
//		String project_code  = URLEncoder.encode("PRO003","UTF-8");
//		String project_name=URLEncoder.encode("BREAK PARTS GROUP INC","UTF-8");
//		String project_description=URLEncoder.encode("CREATING WEBSITE THIS COMPANY","UTF-8");
//
//		 url = "rest/webservices/createproject"
//				+ "?project_code="+ project_code
//				+ "&project_name="+project_name
//				+ "&project_description="+project_description ;
//		
//		
//		} 
//		catch(Exception e)
//		{
//			System.out.println("url encoding error");
//		}
//		
//		
//
//		Client restClient1 = Client.create();
//		com.sun.jersey.api.client.WebResource resource1 = restClient1
//				.resource(url);
//		ClientResponse response = resource1.type("application/json").post(
//				ClientResponse.class);
//
//		System.out.println("create org:  " + url);
//		if (response.getStatus() == 200) {
//			String output = response.getEntity(String.class);
//			System.out.println("Response create org .... \n");
//			System.out.println(output);
//		} else {
//			System.out.println("Failed : HTTP error code : "
//					+ response.getStatus());
//		}
//	}
//
//
}

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Dashboard </title>
</head>
<body>

<%
String  designation="";
String designation1="";
         Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {

            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
//               out.print("Name : " + cookie.getName().toString()+ ",  ");
//                out.print("Value: " + cookie.getValue().trim()+" <br/>");
               if(cookie.getName().equalsIgnoreCase("designation"))
               {
            	
              designation=cookie.getName().toString().toLowerCase() ;
              
               designation1=cookie.getValue().toString().toLowerCase();
               }
             
            }
         } else {
        	 String redirectURL = "index.html";
             response.sendRedirect(redirectURL);
         }
         
         if(designation.equalsIgnoreCase("username"))
         {
         	if(designation1!=""){
          String redirectURL = "index.html";
          response.sendRedirect(redirectURL);
         	}
         }
        
        if(designation.equalsIgnoreCase("designation"))
        {
        	 
        	if(designation1.equalsIgnoreCase("associate")){
        		
         String redirectURL = "empdashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        	else if(designation1.equalsIgnoreCase("project_manager")){
        		
         String redirectURL = "managerdashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        }
         
      %>



<iframe width="100%" height="1000" src="https://app.powerbi.com/view?r=eyJrIjoiODkwNjhmOTQtMWQ5Zi00ODIwLTg2MjEtZGU5YzY4NmIzYTZhIiwidCI6IjEwYzQzNDIzLWI2M2QtNDQwOC1iYTViLTgzYjdlYmE5ZGE2YyIsImMiOjEwfQ%3D%3D" frameborder="1" allowFullScreen="true">




</body>
</html>
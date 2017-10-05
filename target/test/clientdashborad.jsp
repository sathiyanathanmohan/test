<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="ProjectManagementTool-UI/css/Plugins/dataTables.jqueryui.min.css">
<link rel="stylesheet" href="ProjectManagementTool-UI/css/projectdashboard.css">
<script src="ProjectManagementTool-UI/js/Plugins/jquery-1.11.1.min.js"></script>
<script src="ProjectManagementTool-UI/js/Plugins/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="ProjectManagementTool-UI/js/customerdashborad.js"></script>
 <script src="ProjectManagementTool-UI/js/cookies.js"></script>
 <script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
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
//                 out.print("Value: " + cookie.getValue().trim()+" <br/>");
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
        	 
        	if(designation1.equalsIgnoreCase("assoicate")){
        		
         String redirectURL = "empdashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        	else if(designation1.equalsIgnoreCase("project_manager")){
        		
         String redirectURL = "managerdashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        }
         
         
         
         
         
         
      %>
      <table width="1005px" align="center"    cellspacing="0" cellpadding="0">
<tbody>
	<tr>
	<td>
	<div>
	<h2 id="welcomeuser" align="left" style="margin-top: 30px; width:550px"> </h2>
	<button id="logout" style="margin-left: 857px;margin-top: 30px;"><b>Log Out</b></button>
<img id="back" src="ProjectManagementTool-UI/css/images1/images.jpg" Style="width:26px;height:28px;margin-top:20px" onclick="goBack()" />
<img id="home" src="ProjectManagementTool-UI/css/images1/download.jpg" Style="width:26px;height:32px;margin-left:30px;margin-top:10px" onclick="location.href='projectdashboard.jsp'" />	</div>
	</td>
	</tr>
	
	<tr>
	<td>
	<div id="projectdiv" style="marign-top: 10px;"><p id="projecttitle" style="color:white;margin-top: 15px;">Client List</p></div>
	</td>
	</tr>

	<tr>
	<td>
	<div id="add" style="margin-top: 0px;">
	<table id="example" class="display">
	        <thead>
	            <tr>
	                <th align="center">SERIAL NO</th>
	                <th align="center">CUSTOMER CODE</th>
	                <th align="center">CUSTOMER NAME</th>
	                <th align="center">LOCATION</th>
	                <th align="center">VIEW</th>
	                <th align="center">EDIT</th>
	               </tr>
	        </thead>
	               <tbody id="c1">
	        </tbody>
	    </table>
	   </div>
	 </td>
	</tr>
</tbody>
</table>
</body>
</html>

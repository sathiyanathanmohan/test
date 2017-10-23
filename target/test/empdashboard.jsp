<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Management Tool</title>
<script src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="ProjectManagementTool-UI/css/Plugins/dataTables.jqueryui.min.css">
<link rel="stylesheet" href="ProjectManagementTool-UI/css/projectdashboard.css">
<script src="ProjectManagementTool-UI/js/Plugins/jquery-1.11.1.min.js"></script>
<script src="ProjectManagementTool-UI/js/Plugins/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="ProjectManagementTool-UI/js/empdashboard.js"></script>
<script type="text/javascript" src="ProjectManagementTool-UI/js/cookies.js"></script>



<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
 <style type="text/css">
 body
 {
 font-family:Calibri;
 }
#add 
 { 
position:relative;
border: 1px solid black;
	margin:0px 0px 0px -8px;
 	width:1198px;
	}
#nav
	{
margin:50px 0px 0px -8px;
	background-color:#0078D7;
	width:1200px;
	height:30px;
	}
#title
	{
	color:white;font-bold:true;font-size:24px;margin-top:-30px;
	text-align:center;
	}
#empid
{
margin:10px 0px 0px 0px;
}
select
	{
	margin:0px 0px 0px 33px;
	width:175px;
	height:25px;
	}
	#lempname
	{
	margin:0px 0px 0px 100px;
	}
	#empname
	{
	margin:0px 0px 0px 7px;
	height:20px;
	width:170px;
	}
	#ldesignation
	{
	margin:0px 0px 0px 150px;
	}
	#designation
	{
	margin:0px 0px 0px 0px;
	height:20px;
	width:170px;
	}
	div.tab {
position:relative;
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    width:380px;
    height:40px;
    margin-top:35px;
    margin-left:810px;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 10px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #0078D7;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
    color:white
}
</style>
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>
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
//              out.print("Name : " + cookie.getName().toString()+ ",  ");
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
        	 
        	if(designation1.equalsIgnoreCase("project_manager")){
        		
         String redirectURL = "managerashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        	else if(designation1.equalsIgnoreCase("admin")){
        		
         String redirectURL = "projectdashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        }
      %>

      
      
<table id="mytable" 	width="1190px"  align="center"     cellspacing="0" cellpadding="0">
<tbody>

<tr>
	<td>
	<div>
	<h2 id="welcomeuser" align="left" style="margin-top: 40px;margin-left:0px;margin-bottom:20px"> </h2>
	<button id="logout" style=" margin-left: 1060px;margin-top: 30px;margin-bottom:40px"><b>Log Out</b></button>
	</div>
	</td>
	</tr>
	
	
	<tr>
	<td>
		<label id="empid" ><b>Employee ID:</b></label>
		<label id="empid1" ></label>
		<label id="lempname" style=""><b>Employee Name: </b></label>
		<label id="empname" style=""></label>
		<label id="ldesignation" style=""><b>Designation: </b></label>
		<label id="designation" style=""></label>
	</td>
	</tr>
	
    <tr>
	<td>    
	     <div class="tab">
	  <button class="tablinks" onclick="location.href = 'timesheetedit.html';">Timesheet(Entry/View)</button>
	  <button class="tablinks" onclick="location.href = 'cp.jsp';">Change Password</button>
	</div>
	</td>
	</tr>  
	  
	  
	  
	  
	  
	  
	<tr>
	<td>
		<div id="nav">
		<p id="title">Employee DashBoard</p></div>
	</td>
	</tr>
	
	<tr>
	<td>
	<div id="add" >
		<table id="example" style="width:1198px;" class="display">
				        <thead>
				            <tr>
				                <th align="center">SERIAL NO</th>
				                <th align="center">PROJECT CODE</th>
				                <th align="center">PROJECT NAME</th>
				                 <th align="center">PERCENTAGE OF ALLOCATION</th> 
				                <th align="center">START DATE</th>
				                <th align="center">END DATE</th>
				                <th align="center">PROJECT MANAGER</th>
				                 <th align="center">DELIVERY MANAGER</th>
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



<canvas id="pie-chart" width="1800" height="450"></canvas>
</body>
</html>
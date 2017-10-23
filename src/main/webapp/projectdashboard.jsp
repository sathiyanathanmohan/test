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
<script type="text/javascript" src="ProjectManagementTool-UI/js/projectdashboard.js"></script>
<!--  <script type="text/javascript" src="ProjectManagementTool-UI/js/cokkies.js"></script> -->
 <script src="ProjectManagementTool-UI/js/cookies.js"></script>
 <script src="ProjectManagementTool-UI/js/Plugins/menuscript.js"></script> 
 <script type="text/javascript">
//  $().ready(function(){
//  $("#menuicon").click(function(){
//  $('#menu').toggle();
//  });
//  });
//  $().ready(function(){
// 	 $("#menuicon").hover(function(){
// 	 $('#menu').toggle();
// 	 });
// 	 });

</script>
<style>
#menutab:hover  #menu  {
    display: block;
    width:500px
}

 #menuicon{ 
margin-top:2px;
margin-left:3px;
} 
p, ul, li, div, nav { padding:0; margin:0; } body { font-family:Calibri; }
 #menu { overflow: auto; position:relative; z-index:2;display:none; }
  .parent-menu { background-color: #0078D7; min-width:200px; float:left; } 
  #menu ul { list-style-type:none; } 
  #menu ul li a { padding:10px 15px; display:block; color:#fff; text-decoration:none; } 
  #menu ul li a:hover { background-color:#007ee9; } 
  #menu ul li:hover > ul { left: 200px; -webkit-transition: left 200ms ease-in; -moz-transition: left 200ms ease-in; -ms-transition: left 200ms ease-in; transition: left 200ms ease-in; } 
  #menu ul li > ul {font-color:black; position: absolute; background-color:#023567; top: 0; left: -200px; min-width: 200px; z-index: -1; height: 100%; -webkit-transition: left 200ms ease-in; -moz-transition: left 200ms ease-in; -ms-transition: left 200ms ease-in; transition: left 200ms ease-in; } 
  #menu ul li > ul li a:hover { background-color:#000000; } 
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
<table width="1005px" align="center"     cellspacing="0" cellpadding="0">
<tbody>
	<tr>
	<td>
	<div>
	<h2 id="welcomeuser" align="left" style="margin-top: 40px;margin-left:0px; width:550px;"> </h2>
	<button id="logout" style=" margin-left: 873px;margin-top: 40px;"><b>Log Out</b></button>
	
	</div>
	</td>
	</tr>
	
	
	<tr>
	<td>   
<!-- 	<img id="excelbutton" src="ProjectManagementTool-UI/css/images1/excel.png"   onclick="tableToExcel('example', 'W3C Example Table')" Style="position:absolute;width:35px;height:36px;margin-left:250px;margin-top:50px"  /> -->
	 

	  
	</td>
	</tr>
	
	
	<tr>
	<td>
	<div id="projectdiv" style="margin-top: 0px;">
	<div id="menutab">
	<img id="menuicon" src="ProjectManagementTool-UI/css/images1/10.jpg">
	<nav id="menu"> 
	<ul class="parent-menu"> 
		<li><a href="#">Project &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ></a> 
		<ul  style="height:40px"> 
				<li><a href="projectadd.jsp">Project Add</a></li> 
		</ul> 
		</li> 
		<li><a href="#" >Client &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ></a>
		 <ul style="margin-top:40px;height:80px"> <li><a href="clientadd.jsp" >Client Add</a></li>
		  <li><a href="clientdashborad.jsp">Client View</a></li> 
		 </ul>
		</li> 
		<li><a href="#">Employee &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ></a> 
 		<ul style="margin-top:80px;height:80px"> <li><a href="EmployeeAdd.jsp" >Employee Add</a></li>
 		 <li><a href="EmployeeEdit.jsp">Employee Edit</a></li>  </ul> </li> 
		<li><a href="#">Timesheet &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ></a> 
		<ul style="margin-top:120px;height:80px"> <li><a href="managerviewemp.html" >Timesheet Approved</a></li> 
		<li><a href="timesheetview.html">Timesheet View</a></li>
		</ul>
		</li> 
		<li><a href="logincreation.jsp">UserID Creation</a></li> 
		<li><a href="cp.jsp">Changepassword</a></li> 		
 		<li><a href="reportview.html">Report</a> </li> </ul> </nav> 
 		</div>
 
</div><p id="projecttitle" style="color:white;margin-top: 15px;">Project List</p></div>
	</td>
	</tr>
	<tr>
	<td> 
		<div id="add" >
		
			<table id="example" style="width:1000px;" class="display">
			        <thead>
			            <tr>
			                <th align="center">SERIAL NO</th>
			                <th align="center">PROJECT CODE</th>
			                <th align="center">PROJECT NAME</th>
			                <th align="center">START DATE</th>
			                <th align="center">END DATE</th>
			                <th align="center">ALLOCATE</th>
			                <th align="center">EDIT</th>
			                <th align="center">VIEW</th>
			            
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
<!-- <iframe width="1000" height="600" src="https://app.powerbi.com/view?r=eyJrIjoiODkwNjhmOTQtMWQ5Zi00ODIwLTg2MjEtZGU5YzY4NmIzYTZhIiwidCI6IjEwYzQzNDIzLWI2M2QtNDQwOC1iYTViLTgzYjdlYmE5ZGE2YyIsImMiOjEwfQ%3D%3D" frameborder="0" allowFullScreen="true"></iframe> -->
</body>
</html>
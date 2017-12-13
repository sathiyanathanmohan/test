<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Project Dashborad</title>
<!-- <meta charset="utf-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="ProjectManagementTool-UI/css/Plugins/dataTables.jqueryui.min.css">
<!-- <link rel="stylesheet" href="ProjectManagementTool-UI/css/projectdashboard.css"> -->
<script src="ProjectManagementTool-UI/js/Plugins/jquery-1.11.1.min.js"></script>
<script
	src="ProjectManagementTool-UI/js/Plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="ProjectManagementTool-UI/js/projectdashboard.js"></script>
<!--  <script type="text/javascript" src="ProjectManagementTool-UI/js/cokkies.js"></script> -->
<script src="ProjectManagementTool-UI/js/cookies.js"></script>
<!--  <script src="ProjectManagementTool-UI/js/Plugins/menuscript.js"></script> -->
<link href="ProjectManagementTool-UI/css/Plugins/bootstrap.min.css"
	rel="stylesheet">
<link
	href="ProjectManagementTool-UI/css/Plugins/bootstrap-theme.min.css"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/font-awesome.min.css"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,300italic,600,600italic,700,800,700italic,800italic'
	rel='stylesheet' type='text/css'>
<link
	href="https://fonts.googleapis.com/css?family=Oswald|Roboto|Roboto+Condensed"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/accordion-menu.css"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/jquery.jscrollpane.css"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/main.css"
	rel="stylesheet">
<script src="ProjectManagementTool-UI/css/Plugins/js/sorttable.js"></script>
<script src="ProjectManagementTool-UI/css/Plugins/js/bootstrap.min.js"></script>

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
#menutab:hover  #menu {
	display: block;
	width: 500px
}

#menuicon {
	margin-top: 2px;
	margin-left: 3px;
}

p, ul, li, nav {
	padding: 0;
	margin: 0;
}

body {
	font-family: Calibri;
}

#menu {
	overflow: auto;
	position: relative;
	z-index: 2;
	display: none;
}

.parent-menu {
	background-color: #0078D7;
	min-width: 200px;
	float: left;
}

#menu ul {
	list-style-type: none;
}

#menu ul li a {
	padding: 10px 15px;
	display: block;
	color: #fff;
	text-decoration: none;
}

#menu ul li a:hover {
	background-color: #007ee9;
}

#menu ul li:hover>ul {
	left: 200px;
	-webkit-transition: left 200ms ease-in;
	-moz-transition: left 200ms ease-in;
	-ms-transition: left 200ms ease-in;
	transition: left 200ms ease-in;
}

#menu ul li>ul {
	font-color: black;
	position: absolute;
	background-color: #023567;
	top: 0;
	left: -200px;
	min-width: 200px;
	z-index: -1;
	height: 100%;
	-webkit-transition: left 200ms ease-in;
	-moz-transition: left 200ms ease-in;
	-ms-transition: left 200ms ease-in;
	transition: left 200ms ease-in;
}

#menu ul li>ul li a:hover {
	background-color: #000000;
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
	<!--- Top Panel -->
	<div class="topPane">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-12 text-center">
					<a href="projectdashboard.jsp"><img
						src="ProjectManagementTool-UI/css/images1/ennvee-white-logo.png"
						class="img-responsive logo" alt="Ennvee"></a>
				</div>
				<div class="col-md-5 col-sm-6 col-xs-12 discoverMigration">
					<a href="#">Project Management</a>
				</div>
				<div class="col-md-5 col-sm-4 col-xs-12 rightPane">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-4 col-sm-7 loginButton hidden-xs">
								<a href="#" class="btn btn-default dropdown-toggle"
									type="button" id="dropdownMenu1" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> Hi,<span
									id="destusername"></span> <span class="caret"></span>
								</a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><span><i class="fa fa-tachometer"
											aria-hidden="true"></i></span><span><a href="#">Project</a></span></li>
									<li><span><i class="fa fa-snowflake-o"
											aria-hidden="true"></i></span><span><a href="#">Client</a></span></li>
									<li><span><i class="fa fa-wpexplorer"
											aria-hidden="true"></i></span><span><a href="#">Employees
												Converter</a></span></li>
									<li><span><i class="fa fa-superpowers"
											aria-hidden="true"></i></span><span><a href="#">UserID
												Password</a></span></li>
									<li><span><i
											aria-hidden="true"></i></span><span><a href=""
											id="desklogout1">Logout</a></span></li>
								</ul>
							</div>
							<div class="col-md-2 col-sm-1 logOut hidden-xs">
								<span id="seetingsIcon"><i class="fa fa-lock"
									aria-hidden="true"></i></span><a href="#" id="desklogout2">Log Out
								</a>
							</div>
							<!--Mobile Menu-->
							<div class=" row mobileMenu visible-xs ">
								<div class="col-xs-6 mobilemenu1">
									<a href="#" class="btn dropdown-toggle" id="dropdownMenu1"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Hi,<span id="moblieusernmae"></span>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
										<li><span><i class="fa fa-tachometer"
												aria-hidden="true"></i></span><span><a href="#">Project</a></span></li>
										<li><span><i class="fa fa-snowflake-o"
												aria-hidden="true"></i></span><span><a href="#">Client</a></span></li>
										<li><span><i class="fa fa-wpexplorer"
												aria-hidden="true"></i></span><span><a href="#">Employees
													Converter</a></span></li>
										<li><span><i class="fa fa-superpowers"
												aria-hidden="true"></i></span><span><a href="#">UserID
													Custom Testing</a></span></li>
										<li><span><i
												aria-hidden="true"></i></span><span><a href="#">Logout
													Tableau</a></span></li>
	
									</ul>
								</div>
								<div class="mobileMenu2 col-xs-2">
									<a href="#"><i class="fa fa-cog" aria-hidden="true"></i></a>
								</div>
								<div class="mobileMenu3 col-xs-2">
									<a href="#"><i class="fa fa-question-circle"
										aria-hidden="true"></i></a>
								</div>
								<div class="mobileMenu4 col-xs-2">
									<a href="#"><i id="moblielogout2"
										aria-hidden="true"></i></a>
								</div>
							</div>
							<!--End Mobile Menu-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<!--- End top Panel -->
	<div id="add" >

		<table class="table table-responsive" id="example">
			<thead>
				<tr align="center">
					<th>SERIAL NO</th>
					<th>PROJECT CODE</th>
					<th >PROJECT NAME</th>
					<th >START DATE</th>
					<th >END DATE</th>
					<th >ALLOCATE</th>
					<th >EDIT</th>
					<th >VIEW</th>

				</tr>
			</thead>
			<tbody id="c1">
			</tbody>
		</table>
	</div>

	<!-- <iframe width="1000" height="600" src="https://app.powerbi.com/view?r=eyJrIjoiODkwNjhmOTQtMWQ5Zi00ODIwLTg2MjEtZGU5YzY4NmIzYTZhIiwidCI6IjEwYzQzNDIzLWI2M2QtNDQwOC1iYTViLTgzYjdlYmE5ZGE2YyIsImMiOjEwfQ%3D%3D" frameborder="0" allowFullScreen="true"></iframe> -->
</body>
</html>
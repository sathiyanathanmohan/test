<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Management Tool</title>
<script
	src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="ProjectManagementTool-UI/css/Plugins/dataTables.jqueryui.min.css">

<script src="ProjectManagementTool-UI/js/Plugins/jquery-1.11.1.min.js"></script>
<script
	src="ProjectManagementTool-UI/js/Plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="ProjectManagementTool-UI/js/empdashboard.js"></script>
<script type="text/javascript"
	src="ProjectManagementTool-UI/js/cookies.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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



</head>
<body style="width: 100%">


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
											aria-hidden="true"></i></span><span><a href="#">Dashboard</a></span></li>
									<li><span><i class="fa fa-snowflake-o"
											aria-hidden="true"></i></span><span><a href="#">Ennable</a></span></li>
									<li><span><i class="fa fa-wpexplorer"
											aria-hidden="true"></i></span><span><a href="#">Discoverer
												Converter</a></span></li>
									<li><span><i class="fa fa-superpowers"
											aria-hidden="true"></i></span><span><a href="#">Auto
												Custom Testing</a></span></li>
									<li><span><i class="fa fa-rebel" aria-hidden="true"></i></span><span><a
											href="#">NetSuite Tableau</a></span></li>
									<li><span><i class="fa fa-unlock"
											aria-hidden="true"></i></span><span><a href=""
											id="desklogout1">Logout</a></span></li>
								</ul>
							</div>
							<div class="col-md-4 col-sm-1 account hidden-xs">
								<span id="seetingsIcon"><i class="fa fa-cog"
									aria-hidden="true"></i></span><a href="#">Account Settings </a>
							</div>
							<div class="col-md-2 col-sm-1 support hidden-xs">
								<span id="seetingsIcon"><i class="fa fa-question-circle"
									aria-hidden="true"></i></span><a href="#">Support </a>
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
												aria-hidden="true"></i></span><span><a href="#">Dashboard</a></span></li>
										<li><span><i class="fa fa-snowflake-o"
												aria-hidden="true"></i></span><span><a href="#">Ennable</a></span></li>
										<li><span><i class="fa fa-wpexplorer"
												aria-hidden="true"></i></span><span><a href="#">Discoverer
													Converter</a></span></li>
										<li><span><i class="fa fa-superpowers"
												aria-hidden="true"></i></span><span><a href="#">Auto
													Custom Testing</a></span></li>
										<li><span><i class="fa fa-rebel"
												aria-hidden="true"></i></span><span><a href="#">NetSuite
													Tableau</a></span></li>
										<li><span><i class="fa fa-unlock"
												aria-hidden="true"></i></span><span><a href="#"
												id="moblielogout1">Logout</a></span></li>
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
									<a href="#"><i class="fa fa-lock" id="moblielogout2"
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
	<br>
	<br>
	<!--- End top Panel -->
	<!-- 		<label id="empid" ><b>Employee ID:</b></label> -->
	<!-- 		<label id="empid1" ></label> -->
<div>

	<div class="row">
		<div class="col-xs-4 text-center">
			<label id="empid"><b>Employee ID:</b></label> <label id="empid1"></label>

		</div>
		<div class="col-xs-4 text-center">
			<label id="lempname" style=""><b>Employee Name: </b></label> <label
				id="empname" style=""></label>
		</div>

		<div class="col-xs-4 text-center">
			<label id="ldesignation" style=""><b>Designation: </b></label> <label
				id="designation" style=""></label>
		</div>
	</div>
	<br>
	<br>



	<div class="row col-md-12 text-right">
		<button class="btn-info btn-md"
			onclick="location.href = 'timesheetedit.html';">Timesheet(Entry/View)</button>
		<button class="btn-info btn-md" onclick="location.href = 'cp.jsp';">Change
			Password</button>
	</div>






	<section>
	 <header>
	<div class="container">
		<div class="row">
			<div class=" text-center">
				<h3 class="well well-sm">Employee DashBoard</h3>
			</div>
		</div>
	</div>
	</header> </section>



	<div  >
		<table class="table table-responsive" id="example" >
			<thead class="blue-grey lighten-4">
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


</div>

	<canvas id="pie-chart" height="450"></canvas>
</body>
</html>
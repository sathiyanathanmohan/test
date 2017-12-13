<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Dashboard</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="ProjectManagementTool-UI/css/Plugins/dataTables.jqueryui.min.css">
<link rel="stylesheet"
	href="ProjectManagementTool-UI/css/projectdashboard.css">
<script src="ProjectManagementTool-UI/js/Plugins/jquery-1.11.1.min.js"></script>
<script
	src="ProjectManagementTool-UI/js/Plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="ProjectManagementTool-UI/js/managerdashboard.js"></script>
<script type="text/javascript"
	src="ProjectManagementTool-UI/js/cookies.js"></script>



<style type="text/css">
body {
	font-family: calibri;
}

#add {
	position: relative;
	border: 1px solid black;
	margin: 0px 0px 0px -8px;
	width: 1198px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.modal-body {
	max-height: calc(100vh - 210px);
	overflow-y: auto;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#emptitle {
	color: white;
	font-bold: true;
	font-size: 24px;
	margin-top: 3px;
	text-align: center;
}

#nav {
	margin: 10px 0px 0px -8px;
	background-color: #0078D7;
	width: 1200px;
	height: 30px;
}

#nav1 {
	margin: 50px 0px 0px -8px;
	background-color: #0078D7;
	width: 1200px;
	height: 30px;
}

#title {
	color: white;
	font-bold: true;
	font-size: 24px;
	margin-top: 3px;
	text-align: center;
}

#lmanagerid {
	margin: 0px 0px 0px 100px;
}

#lmanagername {
	margin: 0px 0px 0px 150px;
	height: 20px;
	width: 170px;
}

#managername {
	margin: 0px 0px 0px 0px;
	height: 20px;
	width: 170px;
}

#ldesignation {
	margin: 0px 0px 0px 200px;
}

#designation {
	margin: 0px 0px 0px 0px;
	height: 20px;
	width: 170px;
}

div.tab {
	position: relative;
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 710px;
	height: 40px;
	margin-top: 15px;
	margin-left: 480px;
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
	color: white
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
        	 
        	if(designation1.equalsIgnoreCase("associate")){
        		
         String redirectURL = "empdashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        	else if(designation1.equalsIgnoreCase("admin")){
        		
         String redirectURL = "projectdashboard.jsp";
         response.sendRedirect(redirectURL);
        	}
        }
      %>
	<table id="mytable" width="1190px" align="center" cellspacing="0"
		cellpadding="0">
		<tbody>

			<tr>
				<td>
					<div>
						<h2 id="welcomeuser" align="left"
							style="margin-top: 40px; margin-left: 0px; margin-bottom: 20px">
						</h2>
						<button id="logout"
							style="margin-left: 1060px; margin-top: 30px; margin-bottom: 40px">
							<b>Log Out</b>
						</button>
					</div>
				</td>
			</tr>


			<tr>
				<td><label id="managerid"><b>Manager ID:</b></label> <label
					id="managerid1"></label> <label id="lmanagername" style=""><b>Manager
							Name: </b></label> <label id="managername" style=""></label> <label
					id="ldesignation" style=""><b>Designation: </b></label> <label
					id="designation" style=""></label>
			</tr>
			</td>


			<tr>
				<td>
					<div class="tab">
						<button class="tablinks"
							onclick="location.href = 'managerviewemp.html';">Timesheet
							Approval</button>
						<button class="tablinks"
							onclick="location.href = 'timesheetview.html';">Timesheet
							View</button>
						<button class="tablinks" onclick="location.href = 'cp.jsp';">Change
							Password</button>
						<button class="tablinks"
							onclick="location.href = 'timesheetedit.html';">Timesheet
							(Enter/Edit)</button>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div id="nav">
						<p id="title">Project Manager Dashboard</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>

					<div id="add">

						<table id="example" style="width: 1198px; font-family: Calibri;"
							class="display">
							<thead>
								<tr>
									<th align="center">SERIAL NO</th>
									<th align="center">PROJECT CODE</th>
									<th align="center">PROJECT NAME</th>
									<th align="center">LOCATION</th>
									<th align="center">START DATE</th>
									<th align="center">END DATE</th>
									<th align="center">PROJECT MANAGER</th>
									<th align="center">DELIVERY MANAGER</th>
									<th align="center">ESTIMATION EFFORT</th>
									<th align="center">CLIENT NAME</th>
									<th align="center">NO OF EMPLOYEES</th>
									<th align="center">ACTION</th>
								</tr>
							</thead>
							<tbody id="c1">
							</tbody>
						</table>
				</td>
			</tr>
			</div>

			<tr>
				<td>

					<div id="myModal" class="modal">

						<!-- Modal content -->
						<div class="modal-content">
							<span class="close">&times;</span> <label id="project_code"><b>Project
									Code:</b></label> <label id="project_code1"></label> <label
								Style="margin-left: 40px" id="project_name"><b>Project
									Name:</b></label> <label id="project_name1"></label>

							<div id="nav1"
								Style="position: relative; margin-left: 2px; width: 90%;">
								<p id="emptitle">Employee Title</p>
							</div>

							<table Style="position: relative; margin-top: 8px; width: 90%"
								border="1">
								<thead>
									<tr>
										<th>Serial No
										<th>Employee Code</th>
										<th>Employee Name</th>
										<th>Percentage of Allocation</th>
										<th>Start Time</th>
										<th>End Time</th>
									</tr>

								</thead>

								<tbody id="managerview">

									</td>
									</tr>


								</tbody>
							</table>
						</div>

					</div> <script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
		</tbody>
	</table>
</body>
</html>
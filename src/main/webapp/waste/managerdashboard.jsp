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





</head>
<body>
	<h2 id="welcomeuser" align="left"
		style="margin-top: 40px; margin-left: 0px; margin-bottom: 20px">
	</h2>
	<button id="logout"
		style="margin-left: 1060px; margin-top: 30px; margin-bottom: 40px">
		<b>Log Out</b>
	</button>


	<label id="managerid"><b>Manager ID:</b></label>
	<label id="managerid1"></label>
	<label id="lmanagername" style=""><b>Manager Name: </b></label>
	<label id="managername" style=""></label>
	<label id="ldesignation" style=""><b>Designation: </b></label>
	<label id="designation" style=""></label>


	<table id="example" style="width: 1198px;" class="display">
		<thead>
			<tr>
				<th align="center">SERIAL NO</th>
				<th align="center">PROJECT CODE</th>
				<th align="center">PROJECT NAME</th>
				<th align="center">LOCATION</th>
				<th align="center">START DATE</th>
				<th align="center">END DATE</th>
				<th align="center">ESTIMATION EFFORT</th>
				<th align="center">CLIENT CODE</th>
				<th align="center">CLIENT NAME</th>
				<th align="center">NO OF EMPLOYEES</th>

			</tr>
		</thead>
		<tbody id="c1">
		</tbody>
	</table>
	<button id="hh">butn</button>

</body>
</html>
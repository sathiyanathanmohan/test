<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PMT Tool</title>
<script
	src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
<script src="ProjectManagementTool-UI/js/cookies.js"></script>
<script type="text/javascript"
	src="ProjectManagementTool-UI/js/logincreation.js"></script>

<style type="text/css">
#nav {
	background-color: #0078D7;
	margin-top: 28px;
	height: 30px; ,
	width: 500px
}

#title {
	color: white;
	font-bold: true;
	font-size: 24px;
	text-align: center;
}

label {
	margin-left: 150px;
}

#empid {
	margin: 20px 0px 0px 80px;
	width: 200px;
	height: 25px;
}

#empname {
	margin: 25px 0px 0px 84px;
	width: 197px;
	height: 20px;
	text-transform: capitalize;
}

#designation {
	text-transform: capitalize;
	margin: 25px 0px 0px 150px;
	width: 200px;
	height: 25px;
}

#pass {
	margin: 25px 0px 0px 120px;
	width: 196px;
	height: 20px;
}

#save {
	margin: 25px 0px 10px 238px;
	width: 80px;
	height: 25px;
	background-color: #0078D7;
	color: white
}

#all {
	border: 1px solid black;
	margin: -4px 0px 0px 0px;
}

#cancel {
	margin: 25px 0px 10px 55px;
	width: 80px;
	height: 25px;
	background-color: #0078D7;
	color: white
}

#welcomeuser {
	position: absolute;
	font-size: 20px;
	margin-top: 20px
}

#logout {
	position: relative;
	margin-left: 563px;
	width: 130px;
	height: 30px;
	margin-top: 20px;
	background-color: #0078D7;
	color: white
}
</style>
<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
</head>
<body>

	<table align="center" width="700px">
		<tbody>

			<tr>
				<td><label id="welcomeuser"></label>
					<button id="logout">
						<B>Log Out</B>
					</button> <br> <img id="back"
					src="ProjectManagementTool-UI/css/images1/images.jpg"
					Style="width: 26px; height: 28px; margin-top: 10px"
					onclick="goBack()" /> <img id="home"
					src="ProjectManagementTool-UI/css/images1/download.jpg"
					Style="position: absolute; width: 26px; height: 32px; margin-left: 30px; margin-top: 10px"
					onclick="location.href='projectdashboard.jsp'" /></td>
			</tr>

			<tr>
				<td>
					<div id="nav">
						<p id="title">Login Creation</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="all">
						<form id="form" method="post">
							<div>
								<label>Employee code *</label> <select id="empid" name="empid">
									<option value="">Select</option>
								</select>
							</div>
							<div>
								<label>Employee Name</label> <input type="text" id="empname"
									name="empname" readonly>
							</div>
							<div>
								<label>Role *</label> <select id="designation"
									name="designation"><option value="">Select</option>
									<option value="associate">Associate</option>
									<option value="project_manager">Project Manager</option>
									<option value="admin">Admin
									<option></select>
							</div>
							<div>
								<label>Password *</label> <input type="text"
									placeholder="Not a case-sensitive" id="pass" name="pass">
							</div>
							<div>
								<button id="save">Save</button>
								<input type="reset" id="cancel" value="Cancel">
							</div>
						</form>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
<script src="ProjectManagementTool-UI/js/cookies.js"></script>
<script type="text/javascript" src="ProjectManagementTool-UI/js/cp1.js"></script>
<style type="text/css">
#OLDpwd
{
margin-left:100px;
width:200px;
height:20px;
margin-top:20px;
}
#welcomeuser        {margin-top:0px;width:550px;}
#logout             {position:absolute;top:14px;margin-left:500px;width:100px;height:25px;background-color:#0078D7;color:white}
#newpassword
{
margin-left:97px;
width:200px;
height:20px;
margin-top:10px;
}
#conpassword
{
margin-left:70px;
width:200px;
height:20px;
margin-top:10px;
}
#all
{
border: 1px solid black;
}
#l1{
margin-top:20px;
}
#l1,#l2,#l3
{
margin-left:80px;
}
#save
{margin-left:230px;width:110px;height:25px;background-color:#0078D7;color:white;margin-top:20px;margin-bottom:20px;}
#timesheetdiv     {background-color:#0078D7;margin-top:28px;height:30px;} 
 #timesheettitle   {color:white;font-bold:true;font-size:24px;text-align:center;} 


</style>
<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
</head>
<body>
<table width="600px" align="center"    cellspacing="0" cellpadding="0">

<tbody>
	<tr>
	<td colspan="2">
	<h2 id="welcomeuser" align="left" > </h2><button id="logout" ><b>Log Out</b></button>
	<img id="back" src="ProjectManagementTool-UI/css/images1/images.jpg" Style="width:26px;height:28px;margin-top:20px" onclick="goBack()" />
<img id="home" src="ProjectManagementTool-UI/css/images1/download.jpg" Style="position:absolute;width:26px;height:32px;margin-left:30px;margin-top:20px" onclick="location.href='projectdashboard.jsp'" />
	</td>
	</tr>
	
	<tr >
<td colspan="2"><div id="timesheetdiv" ><p id="timesheettitle" ">Changepassword</p></div></td>
</tr>

<tr><td>
<div id="all">
<form id="form" method="post"  >

<div>
<label id="l1">Old Password*</label>
<input name="OldPassword" type="password" id="OLDpwd">
</div>
<div>
<label id="l2">NewPassword*</label>
<input name="newpassword" type="password" id="newpassword">
</div>
<div>
<label id="l3">Confirm Password*</label>
<input name="conpassword" type="password" id="conpassword">
</div>
<div>
<input type="hidden" value="" name="id" id="id">
<button id="save">Save</button>
</div>
</form>
</div>
</td>
</tr>


	</tbody>
	</table>
</body>
</html>
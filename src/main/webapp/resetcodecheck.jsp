<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
  <script src="ProjectManagementTool-UI/js/Plugins/jquery-1.10.2.js"></script>
   <script type="text/javascript" src=" ProjectManagementTool-UI/js/Plugins/jqueryui-1.10.3-jquery-ui.js"></script>
   <script src="ProjectManagementTool-UI/js/reset_code_check.js"></script>
   
<style>
#userid                {position:relative;top:150px;left:160px;}
#passworddiv           {background-color:#0078D7;margin-top:180px;width:450px;height:35px;}
#passwordtitle         {color:white;font-bold:true;font-size:24px;text-align:center;}
#newpassworddiv        {width:450px;height:170px;margin-top:1px;border: 1px solid black}    
#newpasswordl          {position:relative;top:20px;left:7px}   
#newpassword           {position:relative;top:20px;left:30px;width:50%;height:20px;}  
#confirmnewpasswordl   {position:relative;top:20px;left:7px}  
#confirmnewpassword    {position:relative;top:20px;left:18px;width:50%;height:20px;}  
 #submit               {margin-top:20px;margin-left:180px;width:110px;height:25px;background-color:#0078D7;color:white}
</style>
</head>
<body>
<%!public String emp_code = "";
%>
<%@ page import="com.ennvee.ProjectManagement.dao.*" %>
<%@ page import="java.sql.*" %>
 <% emp_code=request.getParameter("emp_code");
     String reset_code=request.getParameter("reset_code");
     String sql ="select reset_code from password_reset where emp_code='"+emp_code+"'";
     String databasereset_code="";
     Connection con;
		con=DatabaseManagement.getConnection();
		Statement stm;
		stm = con.createStatement();
		ResultSet res=stm.executeQuery(sql);
		while(res.next())
		{
			databasereset_code=res.getString("reset_code");
		}
		
		if(databasereset_code.equalsIgnoreCase(reset_code)){
			
		 %>
		
		 <table width="450px" align="center" cellspacing="0" cellpadding="0">
<tbody>

<tr>
<td>
<label id="userid"><b>USER ID:</b><b Style="color:#5533ff">   <%=emp_code.toUpperCase()%></b></label>

<%-- <td align="left"><h2 id="welcomeuser" ALIGN="left">USER ID:<%=emp_code.toUpperCase()%> </h2> --%>
</td>
</tr>
<tr>
<td >
<div id="passworddiv"><p id="passwordtitle" Style="color:white">Reset Password Page</p></div>
</td>
</tr>
<tr>
<td >


 <input type="hidden" id="empcode" value="<%=emp_code%>">
<div id="newpassworddiv" >
<label id="newpasswordl"><b>Create New Password :</b></label>
<input id="newpassword" maxlength="50" name="username" type="password" />
<br>
<br>
<label id="confirmnewpasswordl"><b>Confirm New Password :</b></label>
<input id="confirmnewpassword" maxlength="50" name="password" type="password" />
<br>
<br>
<button id="submit" type="submit" ><B>Submit</B></button>
</div>


</td>
</tr>
</tbody>
</table>


		 
		 <%
		}
		else
		{
			 response.sendRedirect("index.html");
		}
		
			%>
</body>
</html>
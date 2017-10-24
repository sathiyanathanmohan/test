<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
  <script src="ProjectManagementTool-UI/js/Plugins/jquery-1.10.2.js"></script>
   <script type="text/javascript" src=" ProjectManagementTool-UI/js/Plugins/jqueryui-1.10.3-jquery-ui.js"></script>
   
<script src="ProjectManagementTool-UI/js/cookies.js"></script>

<script src="ProjectManagementTool-UI/js/Employee_edit.js"></script>
<style>
 input[type="text"] {
 font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
 font-size: 15px;
  border: solid 1px #fff;
  box-shadow: inset 1px 1px 2px 0 #707070;
  transition: box-shadow 0.3s;
}
select{
 font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
 font-size: 15px;
  border: solid 1px #fff;
  box-shadow: inset 1px 1px 2px 0 #707070;
  transition: box-shadow 0.3s;
}
 input[type="text"]:focus,
 input[type="text"].focus {
  box-shadow: inset 1px 1px 2px 0 #c9c9c9;
}




.ui-autocomplete { height: 200px; overflow-y: scroll; overflow-x: hidden;}


#welcomeuser       {position:absolute;font-size:20px;margin-top:20px}
#logout            {position:relative;margin-left:865px;width:130px;height:30px;margin-top:20px;background-color:#0078D7;color:white} 
 #customerdiv      {background-color:#0078D7;margin-top:45px;width:1000px;height:35px;} 
 #customertitle    {color:white;font-bold:true;font-size:24px;text-align:center;} 
 #overalldiv       {width:998px;margin-top:1px}
 #clientcode       {text-transform: uppercase;width:25%;height:20px;margin-top:12px; margin-left:58px; }
 #clientnamel      {margin-top:12px; margin-left:150px; }
 #clientname       {text-transform: capitalize;width:25%;height:20px;margin-top:12px;margin-left:42px }
 #ecc              {display:none;font-size:13px;color:red;margin-left:147px;}
 #ecn              {display:none;font-size:13px;color:red;margin-left:670px}
 #website          {width:25%;height:20px;margin-top:12px; margin-left:20px;}
 #phonenol         {margin-left:150px}
  #areacode          {width:5%;height:18px;margin-left:24px}
 #phoneno          {width:18%;height:18px;margin-left:10px}
 #ecw              {display:none;font-size:13px;color:red;margin-left:150px;}
 #epn              {display:none;font-size:13px;color:red;margin-left:670px;}
 #address1         {width:25%;height:20px;margin-top:12px;margin-left:42px }
 #address2l        {margin-left:150px }
 #address2         {width:25%;height:20px;margin-left:30px}
 #ea               {display:none;font-size:13px;color:red;margin-left:152px;}
 #city             {text-transform: capitalize;width:25%;height:20px;margin-top:12px; margin-left:113px;}
 #statel           {margin-left:150px}
 #state            {text-transform: capitalize;width:25%;height:20px;margin-left:88px}
 #ec               {display:none;font-size:13px;color:red;margin-left:153px;}
 #ecs              {display:none;font-size:13px;color:red;margin-left:676px;}
 #country          {text-transform: capitalize;width:25%;height:20px;margin-top:12px; margin-left:90px;}
 #zipcodel         {margin-left:150px}
 #zipcode          {width:25%;height:20px;margin-left:59px}
 #ecountry         {display:none;font-size:13px;color:red;margin-left:153px;}
 #ecz              {display:none;font-size:13px;color:red;margin-left:675px;}
 #clienttable, th  {border: 1px solid black;border-collapse: collapse;}
#save              {margin-left:370px;width:110px;height:25px;background-color:#0078D7;color:white}
#cancel            {margin-left:60px;width:110px;height:25px;background-color:#0078D7;color:white}
 
 #myTable  {
   border-collapse: collapse;
     border: 1px solid black;
}
#myTable td 
{
   border-collapse: collapse;
     border: 1px solid black;
}
#myTable th
{
background-color:#0078D7;
		color:WHITE;
   border-collapse: collapse;
     border: 1px solid black;
}
</style>



</head>
<body style="">


     



<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
<table width="1000px" align="center" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td>
<label id="welcomeuser"></label>
<button id="logout"><b>Log Out</b></button>
<br>
<img id="back" src="ProjectManagementTool-UI/css/images1/images.jpg" style="width:26px;height:28px;margin-top:40px" onclick="goBack()">
<img id="home" src="ProjectManagementTool-UI/css/images1/download.jpg" style="position:absolute;width:26px;height:32px;margin-left:30px;margin-top:40px" onclick="location.href='projectdashboard.jsp'">


</td>
</tr>

<tr>
<td>
<div id="customerdiv"><p id="customertitle">Employee Edit</p></div>
</td>
</tr>
<tr>
<td>

<form id="form">
<div id="overalldiv" style="border: 1px solid black;">

<h3 style="
    border-left-width: 0px;
    margin-left: 149px;
">EMPLOYEE CODE  * :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;--Enter Employee Id Here--"  id="emp_code" name="emp_code" style="width: 316px;height: 29px;text-transform:uppercase"></h3>   <p></p>
<input type="hidden" id="row_id" name="row_id">

<h3 style="
    margin-left: 144px;
">EMPLOYEE NAME  * :&nbsp;&nbsp;&nbsp;&nbsp; <input onkeypress="return onlyAlphabets(event)" disabled="" type="text" id="emp_name" name="emp_name" style="width: 316px;height: 27px;"></h3>   <p></p>
<h3 style="height: 44px;width: 534px;margin-left: 180px;">DESIGNATION * : &nbsp;&nbsp;&nbsp;&nbsp;<select id="emp_design" disabled="" name="emp_design" style="
 width: 319px;

 height: 32px;
 border-left-width: 1px;
 margin-left: 1px;
 "><option value="">--- Choose designation From Here ---</option><option value="associate">&nbsp;&nbsp;&nbsp; ASSOCIATE </option><option value="project_manager">&nbsp;&nbsp;&nbsp; Project_manager </option>
 <option value="onsite_coodernater">&nbsp;&nbsp;&nbsp; Onsite Co-Odernater </option><option value="delivery_manager">&nbsp;&nbsp;&nbsp; Delivery_manager </option><option value="admin">&nbsp;&nbsp;&nbsp; Admin </option>
</select></h3>   
<h3 style="
    border-left-width: 0px;
    margin-left: 210px;
">E -MAIL ID  * :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" disabled="" id="emp_mail" name="emp_mail" style="width: 320px;height: 26px;"></h3>   
<h3 style="height: 44px;width: 534px;margin-left: 239px;margin-top: 23.72;border-top-width: 5px;">STATUS * : &nbsp;&nbsp;&nbsp;&nbsp;<select id="emp_status" disabled="" name="emp_status" style=" width: 319px;

 height: 32px;
 border-left-width: 1px;
 margin-left: 1px;
 "><option value="">--- Choose Status From Here ---</option><option value="0">&nbsp;&nbsp;&nbsp; In-Active </option><option value="1">&nbsp;&nbsp;&nbsp; De-Active </option>
 </select></h3>   


<input type="hidden" value=" " name="login_emp_code" id="login_emp_code"> 





<input type="button" value="Save" id="save" style="
   
    margin-left: 360px;
    margin-top: 8px;

">
<!-- <button  id="cancel"><B>Cancel</B></button> -->
 <button type="button" id="cancel" onclick="cancel5();"><b> Cancel</b> </button>
<br>
<br>

 </div>


<br>
</form>
</td>
</tr>

</tbody>
</table>




</body>
</html>
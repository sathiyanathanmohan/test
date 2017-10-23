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
   
<script  src="ProjectManagementTool-UI/js/cookies.js"></script>

<script src="ProjectManagementTool-UI/js/customeredit.js"></script>
<style>

 #welcomeuser      {position:absolute;font-size:20px;margin-top:20px}
#logout            {position:relative;margin-left:865px;width:130px;height:30px;margin-top:20px;background-color:#0078D7;color:white} 
#customerdiv      {position:relative;background-color:#0078D7;top:5px;width:1000px;height:25px;} 
 #customertitle    {color:white;font-bold:true;font-size:24px;text-align:center;} 
 #overalldiv       {position:relative;width:998px;top:5px}
 #clientcodel      {position:absolute;left:50px;top:50px}
 #clientcode       {text-transform: uppercase;position:absolute;left:200px;width:230px;height:20px;top:45px}
 #clientnamel      {position:absolute;left:575px;top:50px;}
 #clientname       {text-transform: capitalize;position:absolute;left:715px;width:230px;height:20px;top:45px}
 #ecc              {display:none;position:absolute;left:200px;top:73px;color:red;font-size:13px;}
 #ecn              {display:none;position:absolute;left:717px;top:73px;color:red;font-size:13px;}
 #websitel          {position:absolute;left:50px;top:93px;}
 #website          {position:absolute;left:200px;top:89px;width:230px;height:20px}
 #phonenol         {position:absolute;left:575px;top:93px;}
 #areacode         {position:absolute;left:715px;top:88px;width:40px;height:20px}
 #phoneno          {position:absolute;left:763px;top:88px;width:183px;height:20px}
 #ecw              {display:none;position:absolute;right:550px;top:114px;font-size:13px;color:red;left:200px}
 #eac              {display:none;position:absolute;right:195px;top:114px;font-size:13px;color:red;left:686px}
 #epn		   {display:none;position:absolute;top:114px;font-size:13px;color:red;left:770px;}
 #address1l        {position:absolute;left:50px;top:185px;}
 #address1         {position:absolute;left:200px;top:180px;width:230px;height:20px}
 #address2l        {position:absolute;left:575px;top:185px;}
 #address2         {position:absolute;left:715px;top:180px;width:230px;height:20px}
 #ea               {display:none;position:absolute;left:198px;top:210px;color:red;font-size:13px;}
 #cityl            {position:absolute;left:50px;top:230px;}
 #city             {text-transform: capitalize;position:absolute;left:200px;top:225px;width:230px;height:20px}
 #statel           {position:absolute;left:575px;top:230px;}
 #state            {text-transform: capitalize;position:absolute;left:715px;top:225px;width:230px;height:20px}
 #ec               {display:none;position:absolute;left:198px;top:253px;color:red;font-size:13px;}
 #ecs              {display:none;position:absolute;left:715px;top:253px;color:red;font-size:13px;}
 #countryl         {position:absolute;left:50px;top:275px;}
 #country          {text-transform: capitalize;position:absolute;left:200px;top:270px;width:230px;height:20px;}
 #zipcodel         {position:absolute;left:575px;top:275px;}
 #zipcode          {position:absolute;left:715px;top:270px;width:230px;height:20px;}
 #ecountry         {display:none;position:absolute;left:198px;top:295px;color:red;font-size:13px;}
 #ecz              {display:none;position:absolute;left:715px;top:295px;color:red;font-size:13px;}
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
   border-collapse: collapse;
     border: 1px solid black;
}
</style>
</head>
<body>
<%
String  designation="";
String designation1="";
         Cookie cookie = null;
         Cookie[] cookies = null;
         
       
         cookies = request.getCookies();
         
         if( cookies != null ) {
         
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName( ) =="designation")
               {
              designation=cookie.getName( ) ;
              
               designation1=cookie.getValue( );
               }
        }
         } else {
        	 String redirectURL = "index.html";
             response.sendRedirect(redirectURL);
         }
         
         
         
        if(designation=="designation")
        {
        	if(designation1!="admin"){
         String redirectURL = "timesheetentry.html";
         response.sendRedirect(redirectURL);
        	}
        	if(designation1!="project_manager"){
                String redirectURL = "projectdashboard.jsp";
                response.sendRedirect(redirectURL);
               	}
        }
         
         
         
         
         
         
      %>
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
<button  id="logout"><B>Log Out</B></button>
<br>
<img id="back" src="ProjectManagementTool-UI/css/images1/images.jpg" Style="width:26px;height:28px;margin-top:40px" onclick="goBack()" />
<img id="home" src="ProjectManagementTool-UI/css/images1/download.jpg" Style="position:absolute;width:26px;height:32px;margin-left:30px;margin-top:40px" onclick="location.href='projectdashboard.jsp'" />


</td>
</tr>

<tr>
<td >
<div id="customerdiv" ><p id="customertitle">Client Edit</p></div>
</td>
</tr>
<tr>
<td >

<form id="form">
<div id="overalldiv" Style="border: 1px solid black;">

<input type="hidden" name="id" id="id" >
<div >     
     <fieldset Style="border:1px solid black;margin-top:15px;margin-left:25px;width:925px;height:105px;">
     <legend><label ><b>Client Details</b></label></legend>
          
         <label id="clientcodel">Client Code*</label> 
         <input id="clientcode"  maxlength="30" name="clientcode" type="text" />
         <label id="clientnamel">Client Name*</label> 
         <input id="clientname" maxlength="30" name="clientname" type="text" />
          <label id="ecc"> Enter Client Code</label>
        <label id="ecn"> Enter Client Name </label>
       
       <br>
      
        
        <label id="websitel">Company Website*</label> 
         <input id="website" maxlength="30"  name="website"  type="text" />
         <label id="phonenol">Phone Number*</label>
       <input id="areacode" maxlength="30" placeholder="areacode" name="areacode" type="text" /> 
        <input id="phoneno" maxlength="30" name="phoneno" type="text" /> 
         
         <label id="ecw"> Enter Company Website </label>
         <label id="epn"> Enter  Phone Number </label>
         
 
     </fieldset>
</div>

<div >     
     <fieldset Style="border:1px solid black;margin-top:15px;margin-left:25px;width:925px;height:150px;">
     <legend><label ><b>Client Address</b></label></legend>
     <label id="address1l">Address Line 1*</label> 
         <input id="address1" maxlength="30" name="address1" type="text" />
         <label id="address2l">Address Line 2</label> 
         <input id="address2" maxlength="30" name="address2" type="text" />
         <label id="ea"> Enter Address</label>
         <br>
        
         <label id="cityl">City*</label> 
         <input id="city" maxlength="30" name="city" type="text" />
         <label id="statel">State*</label> 
         <input id="state" maxlength="30"  name="state" type="text" />
         <label id="ec"> Enter City</label>
         <label id="ecs"> Enter State</label>
         <br>
        
         <label id="countryl">Country*</label> 
         <input id="country" maxlength="30" name="country" type="text" />
         <label id="zipcodel">Zip Code*</label> 
         <input id="zipcode" maxlength="30" name="zipcode" type="text" />
         <label id="ecountry"> Enter Country</label>
         <label id="ecz"> Enter Zip Code</label>
         

     </fieldset>
</div>


<div >     
      <fieldset Style="border:1px solid black;margin-top:15px;margin-left:25px;width:925px;">
      <legend><label ><b>Contact Details</b></label></legend>
       
      <table id="myTable" style="width:100%;">
        <tr>
        <th width="14%">Contact Person</th>
        <th  width="23%">Email Address</th> 
        <th  width="13%">Contact Number</th>
        <th  width="13%">Alternative Number</th>
        <th  width="3%">..</th>
        </tr>
        <tbody id="tbody">
       
        </tbody>
  
  
  </table> 	

        <img src="ProjectManagementTool-UI/css/images1/addicon.jpg" Style="width:20px;height:20px" id="addrow" />
        </fieldset>
</div>
<br>
<div>

<button  id="save"><B>Save</B></button>
<!-- <button  id="cancel"><B>Cancel</B></button> -->
 <button type="button"   id="cancel" onclick="cancel5();" ><B> Cancel</B> </button>


 

</div>
<br>
</div>
</form>
</td>
</tr>

</tbody>
</table>

</body>
</html>
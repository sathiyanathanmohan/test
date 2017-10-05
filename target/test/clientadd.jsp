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

<script src="ProjectManagementTool-UI/js/createcustomer.js"></script>
<style>

 #welcomeuser      {position:absolute;font-size:20px;margin-top:20px}
#logout            {position:relative;margin-left:865px;width:130px;height:30px;margin-top:20px;background-color:#0078D7;color:white} 
#customerdiv      {position:relative;background-color:#0078D7;top:5px;width:1000px;height:25px;} 
 #customertitle    {color:white;font-bold:true;font-size:24px;text-align:center;} 
 #overalldiv       {position:relative;width:998px;top:5px}
 #clientcodel      {position:relative;left:0px;}
 #clientcode       {text-transform: uppercase;position:relative;left:70px;width:230px;height:20px}
 #clientnamel      {position:relative;left:230px;}
 #clientname       {text-transform: capitalize;position:relative;left:260px;width:230px;height:20px}
 #ecc              {display:none;position:absolute;left:198px;top:70px;color:red;font-size:13px;}
 #ecn              {display:none;position:absolute;left:720px;top:70px;color:red;font-size:13px;}
 #websitel          {position:relative;left:0px;top:15px;}
 #website          {position:relative;left:30px;top:15px;width:230px;height:20px}
 #phonenol         {position:relative;left:190px;top:15px;}
 #areacode         {position:relative;left:205px;top:15px;width:40px;height:20px}
 #phoneno          {position:relative;left:205px;top:15px;width:180px;height:20px}
 #ecw              {display:none;position:absolute;right:550px;top:109px;font-size:13px;color:red;left:198px}
 #eac              {display:none;position:absolute;right:195px;top:109px;font-size:13px;color:red;left:686px}
 #epno			   {display:none;position:absolute;top:109px;font-size:13px;color:red;left:770px;}
 #address1l        {position:relative;left:0px;top:0px;}
 #address1         {position:relative;left:50px;top:0px;width:230px;height:20px}
 #address2l        {position:relative;left:210px;top:0px;}
 #address2         {position:relative;left:230px;top:0px;width:230px;height:20px}
 #ea               {display:none;position:absolute;left:198px;top:200px;color:red;font-size:13px;}
 #cityl            {position:relative;left:0px;top:20px;}
 #city             {text-transform: capitalize;position:relative;left:120px;top:20px;width:230px;height:20px}
 #statel           {position:relative;left:280px;top:20px;}
 #state            {text-transform: capitalize;position:relative;left:355px;top:20px;width:230px;height:20px}
 #ec               {display:none;position:absolute;left:198px;top:248px;color:red;font-size:13px;}
 #ecs              {display:none;position:absolute;left:715px;top:248px;color:red;font-size:13px;}
 #countryl         {position:relative;left:0px;top:40px;}
 #country          {text-transform: capitalize;position:relative;left:96px;top:40px;width:230px;height:20px}
 #zipcodel         {position:relative;left:255px;top:40px;}
 #zipcode          {position:relative;left:303px;top:40px;width:230px;height:20px}
 #ecountry         {display:none;position:absolute;left:198px;top:295px;color:red;font-size:13px;}
 #ecz              {display:none;position:absolute;left:715px;top:295px;color:red;font-size:13px;}
 #clienttable, th  {border: 1px solid black;border-collapse: collapse;}

#save              {margin-left:370px;width:110px;height:25px;background-color:#0078D7;color:white} 
#cancel            {margin-left:60px;width:110px;height:25px;background-color:#0078D7;color:white} 
 
 
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
<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
<table width="1000px" align="center" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td>
<label id="welcomeuser" style="width:550px;"><b></b></label>
<button  id="logout"><B>Log Out</B></button>
<br>
<img id="back" src="ProjectManagementTool-UI/css/images1/images.jpg" Style="width:26px;height:28px;margin-top:40px" onclick="goBack()" />
<img id="home" src="ProjectManagementTool-UI/css/images1/download.jpg" Style="position:absolute;width:26px;height:32px;margin-left:30px;margin-top:40px" onclick="location.href='projectdashboard.jsp'" />


</td>
</tr>

<tr>
<td >
<div id="customerdiv" ><p id="customertitle">Client Add</p></div>
</td>
</tr>
<tr>
<td >

<form id="form">
<div id="overalldiv" Style="border: 1px solid black;">


<div >     
     <fieldset Style="border:1px solid black;margin-top:18px;margin-left:25px;width:925px;height:100px">
     <legend><label ><b>Client Details</b></label></legend>
          
         <label id="clientcodel">Client Code*</label> 
         <input id="clientcode"   maxlength="30" name="clientcode" type="text" />
         <label id="clientnamel">Client Name*</label> 
         <input id="clientname" maxlength="30" name="clientname" type="text" />
          <label id="ecc"> Enter Client Code</label>
        <label id="ecn"> Enter Client Name </label>
       
       <br>
      
        
        <label id="websitel">Company Website*</label> 
         <input id="website" maxlength="30"  name="website"  type="text" />
         <label id="phonenol">Phone Number*</label>
         <input id="areacode" maxlength="5" placeholder="+91" name="areacode" type="text" />  
        <input id="phoneno" maxlength="10" name="phoneno" type="text" /> 
         
         <label id="ecw"> Enter Company Website </label>
         <label id="eac">Enter areacode</label>
         <label id="epno">Enter phone number</label>
         
 
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
<input type="reset" id="cancel" value="Cancel" >

 

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
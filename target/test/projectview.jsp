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
<script type="text/javascript" src="ProjectManagementTool-UI/js/project_view.js"></script>
<script  src="ProjectManagementTool-UI/js/cookies.js"></script>
<link rel="stylesheet" type="text/css" href="ProjectManagementTool-UI/css/overallview.css">

<link rel="stylesheet" type="text/css" href="ProjectManagementTool-UI/css/Plugins/dataTables.jqueryui.min.css">
<!-- <link rel="stylesheet" href="ProjectManagementTool-UI/css/projectdashboard.css"> -->
<!-- <script src="ProjectManagementTool-UI/js/Plugins/jquery-1.11.1.min.js"></script> -->
<script src="ProjectManagementTool-UI/js/Plugins/jquery.dataTables.min.js"></script> 
<!-- <script type="text/javascript" src="ProjectManagementTool-UI/js/projectdashboard.js"></script> -->

<script>
</script>
  <script type="text/javascript">
function goBack() {
    window.history.back();
}
function close1() {
	
	location.href='projectdashboard.jsp';
}

</script>
<style type="text/css">
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-left: 50px;
      padding-top: 150px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 500px;
    height:400px
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}</style>
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
     
<table  width="1002px" align="center"  >

<tbody>

<tr>
<td>
<div>
<h2 id="welcomeuser" style="width:550px;"> </h2>
<button id="logout"><B>Log Out</B></button>
<img id="back" src="ProjectManagementTool-UI/css/images1/images.jpg" Style="width:26px;height:28px;" onclick="goBack()" />
<img id="home" src="ProjectManagementTool-UI/css/images1/download.jpg" Style="position:absolute;width:26px;height:32px;margin-left:50px" onclick="location.href='projectdashboard.jsp'" />
</div>

<br>
<br>
</td>
</tr>      

<tr>
<td>
<div id="projectdiv"><p id="projecttitle" Style="color:white">Project View</p></div>
</td>
</tr>


<tr>
<td>
<div id="add" width="1000px">
<br>
<form id="form" method="post"  >

<div style="margin-right:2px">     
     <fieldset  id="projectdetails" >
     <legend><label><b>Project Details</b></label></legend>
         <label >Project Code</label>
         <input id="projectcode" readOnly="readonly" maxlength="10" name="projectcode" type="text" />
         <br>
 		 <label >Project Name</label>
  		 <input id="projectname" readOnly="readonly" maxlength="50" name="projectname" type="text" />
  		 <br>
      	 <label >Start Date</label>
		 <input id="startdate" readOnly="readonly" maxlength="20" name="startdate" type="date" />
         <br>
         <label >End Date</label>
		 <input id="enddate" readOnly="readonly" maxlength="20" name="enddate" type="date" />
		 <br>
		 <br>
		 <label  id="pdl">Project Description</label>
         <textarea id="pd" readOnly="readonly" name="pd" rows="4" cols="50"></textarea>
      </fieldset>
</div>

<br>

<div style="margin-right:2px">
     <fieldset id="developementdetails">
     <legend><label><b>Developement Details</b></label></legend>
         <label>Center</label>
         <input id="center" readOnly="readonly"  name="projectcode" type="text" />
         <br>
         <label>Location</label>
         <input  id="location" readOnly="readonly" name="projectcode" type="text" />
         <br>
         <label>Contract Type</label>
         <input  id="contracttype" readOnly="readonly" name="projectcode" type="text" />
         <br>
         <label>Project Status</label>
         <input  id="projectstatus"  readOnly="readonly" name="projectcode" type="text" />
         
         <br>
         <label>Customer Portfolio</label>
         <input  id="customerportfolio" readOnly="readonly"  name="projectcode" type="text" />
         
         
         <label id="servicesl">Services Offered</label>
         <input  id="services" readOnly="readonly"  name="projectcode" type="text" />
         
         <label id="techl" >Technology</label>
<!--          <input  id="technology"  name="projectcode" type="text" /> -->
         
         
         
         <textarea readOnly="readonly" id="tech" rows="4" cols="50" name="tech" > </textarea>
         <label id="effortl">Effort Required</label>
         <input readOnly="readonly" id="effortrequired" maxlength="50" name="effortrequired" type="text" />
            <label id="mandays">Man-days</label>
        
      
         <label id="onsitel">Onsite</label>
         <input id="onsite" name="onsite" readOnly="readonly" maxlength="50" name="name" type="text" />
         <label id="offshorel">offshore</label>
         <input id="offshore" readOnly="readonly" name="offshore"maxlength="50" name="name" type="text" />
         
      </fieldset>
</div>

<br>

<div style="margin-right:2px">
     <fieldset id="customerdetails">
     <legend><label><b>Client Details</b></label></legend>
     <label>Cilent Name :</label>
     <input  id="cc" readOnly="readonly"  name="customername" type="text" />
     <label id="customercode"></label>
<!--      <label id="customername" ></label> -->
         <table id="myTable">
           <tr>
              <th width="25%"><b>Contact Person</b></th>
              <th width="35%"><b>Mail id</b></th>
              <th width="25%"><b>Contact Number</b></th>
              <th width="25%"><b>Alternative Number</b></th>
           </tr>
          <tbody id="tbody">
  
          </tbody>
  
        </table>
      </fieldset>
</div>


	    
	    
	    




<div style="margin-right:2px;margin-left:2px">
       <fieldset  id="responsibility">
            <legend><label><b>Responsibility</b></label></legend>
            <label id="deliverymanagerl">Delivery Manager</label>
            <input  id="deliverymanager" readOnly="readonly"  name="projectcode" type="text" />
            <label id="onsitecoordinatorl">Onsite Co-ordinator</label>
            <input  id="onsitecoordinator" readOnly="readonly" name="projectcode" type="text" />
       </fieldset>
</div>

<br>

<div  style="margin-right:2px;position:relative">
       <div>
       <fieldset  id="remarks">
       <legend ><label><b>Remarks</b></label></legend>
            <label id="pml">Project Manager/Delivery Manager</label>
            <textarea id="pm" readOnly="readonly" name="pm" rows="4" ></textarea>
            <br>
            <label id="generall">General</label>
            <textarea id="general" name="general" readOnly="readonly" rows="4" cols="50"></textarea>
        </fieldset>
        </div>
        
        <div>
        <fieldset  id="supportfile">
        <legend ><label><b>Support File</b></label></legend>
            <label Style="position:absolute;margin-top:15px" id="uploadfile">Upload Files</label><br>
            <input Style="position:absolute;margin-top:35px;margin-left:30%;width:130px;height:30px;background-color:#0078D7;color:white;" type="button" value="View attached files" onclick='onclick1()'>
            <br>
          
        </fieldset>
        
</div>

          
             
</div >
  <br>
         <div id="myModal" class="modal">

   <!-- Modal content -->
         <div class="modal-content">
         <span class="close">&times;</span>
         <div  id="dailydiv" Style="position:relative;margin-left:2px;width:1000px;margin-top:20px" >
         <p id="dailytitle">Support File</p></div>
         <table Style="margin-top:50px;margin-left:110px" align="center" >
         <tr>
         <th width="20%" align="center" ><b>File</b></th>
         <th width="30%" align="center"><b></b></th>
         </tr>
         <tbody id="filetbody">
       
         </tbody>
         </table>
        </div>

</div>

<div style="margin-right:2px">
     <fieldset id="allocationdetails">
     <legend><label><b>Project Allocation Details</b></label></legend>
     	<table  class="display" id="example" style="cellspacing:0;width:99.8%;margin-left:0px;margin-right:0.1%;" >

        <thead>
            <tr>
                <th>EMPLOYEE ID</th>
                <th>EMPLOYEE NAME</th>
                <th>LOCATION</th>
                <th>PERCENTAGE OF ALLOCATION</th>
                <th>START DATE</th>
                <th>END DATE</th>
                <th>PROJECT MANAGER
            </tr>
        </thead>
        
                 <tbody id="tbody1">
  
          </tbody>
  
    </table>
    </fieldset>
</div>
<br>
      
<button id="exit" type="button" onclick="close1()" ><b>Exit</b></button>


	
<br>

</div>
</tbody>
</table>
<script>
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

</body>
</html>
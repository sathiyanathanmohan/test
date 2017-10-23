<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">	
<title>Time Sheet</title>
<script src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
  <script src="ProjectManagementTool-UI/js/Plugins/jquery-1.10.2.js"></script>
   <script type="text/javascript" src=" ProjectManagementTool-UI/js/Plugins/jqueryui-1.10.3-jquery-ui.js"></script>
<!--    <link rel="stylesheet" href="ProjectManagementTool-UI/css/Plugins/jqueryui-1.11.4-jquery-ui.css">  -->
<script  src="ProjectManagementTool-UI/js/cookies.js"></script>
<!-- <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<script src="ProjectManagementTool-UI/js/viewemployee.js"></script>

<style>
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
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 1000px;
    height:500px
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
}
#welcomeuser       {position:absolute;font-size:20px;margin-top:20px}
#logout            {position:relative;margin-left:1210px;width:130px;height:30px;margin-top:20px;background-color:#0078D7;color:white} 
 #timesheetdiv     {background-color:#0078D7;margin-top:25px;width:1350px;height:35px;} 
 #timesheettitle   {color:white;font-bold:true;font-size:24px;text-align:center;} 
 #overalldiv       {width:1350px;margin-top:1px}
 
#employeename      {margin-left:120px;}
#designation       {margin-left:150px;}
 
 #clienttable, th  {border: 1px solid black;border-collapse: collapse;padding: 5px;text-align: left}
/* #myTable  td ,{border: 1px solid black;border-collapse: collapse;padding: 5px;text-align: left} */
#save              {margin-left:530px;width:110px;height:25px;background-color:#0078D7;color:white}
#cancel            {margin-left:60px;width:110px;height:25px;background-color:#0078D7;color:white}
/* #employeecodecombo  {position:relative;margin-top:27px} */
 #selectcombo        {margin-left:1%;width:10%;height:23px} 
 #startdatel         {margin-left:5%} 
 #startdate          {margin-left:1%} 
 #enddatel           {margin-left:5%} 
 #enddate             {margin-left:1%} 
 #viewtimesheet      {margin-left:5%;background-color:#0078D7;color:white} 
 h4, h4 {
  width: 50%;
  height: 60px;
  margin: 0;
  padding: 0;
  display: inline;
}
 #dailydiv     {background-color:#0078D7;margin-top:25px;width:1200px;height:28px;} 
 #dailytitle   {color:white;font-bold:true;font-size:24px;text-align:center;} 
 #viewtable  {
   border-collapse: collapse;
     border: 1px solid black;
}
#viewtable td 
{
   border-collapse: collapse;
     border: 1px solid black;
}
#viewtable th
{
   border-collapse: collapse;
     border: 1px solid black;
}
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
<img id="back" src="ProjectManagementTool-UI/css/images1/images.jpg" Style="width:26px;height:28px;margin-top:20px" onclick="goBack()" />
<img id="home" src="ProjectManagementTool-UI/css/images1/download.jpg" Style="position:absolute;width:26px;height:32px;margin-left:30px;margin-top:20px" onclick="location.href='projectdashboard.jsp'" />
</td>
</tr>

<br>

<tr>
<td>
<label id="employeecode"></label>
<label id="employeename"></label>
<label id="designation"></label>
</td>
</tr>


<tr>
<td>
<label id="employeecodecombo">Employee Code*</label>
<select id="selectcombo">
  <option value="Select">Select</option>
  </select>
<label id="startdatel">Start Date*</label>
<input type="date"  id="startdate" value="">
<label id="enddatel">End Date*</label>
<input type="date" id="enddate" value="">
<button  id="viewtimesheet"><B>View Timesheet</B></button>
</td>
</tr>

<tr>
<td >
<div id="timesheetdiv" ><p id="timesheettitle">Time Approved</p></div>
</td>
</tr>
<tr>
<td >

<form id="form">
<div id="overalldiv" Style="border: 1px solid black;">

<input type="hidden" name="employee_code" id="employee_code">




<div >     
      
       
      <table id="myTable" style="width:100%;">
        <tr>
         <th   >Employee Code</th> 
        <th   >Employee Name</th> 
        
        
       
	      <th  width="8%" >Date</th> 
	       
	       
           <th    >Hours</th>
          <th  >Approval Status</th> 
          <th   >Remarks</th> 
        </tr>
        <tbody id="tbody">
       
        </tbody>
  
  
  </table> 	

<!--         <img src="ProjectManagementTool-UI/css/images1/addicon.jpg" Style="width:20px;height:20px" id="addrow" /> -->
        
</div>
</div>
<br>
<div>

<button  id="save"><B>Save</B></button>
<button  id="cancel"><B>Cancel</B></button>

 

</div>
<br>

</form>
</td>
</tr>

</tbody>
</table>
<tr>
<td>

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h4 >Employee Code:</h4><label id="emp_code1"></label>
    <h4 Style="margin-left:20px">Employee Name:</h4><label id="emp_name1"></label>
    <h4 Style="margin-left:30px">Total Working Hours:</h4><label id="day_hours1"></label>
    <div id="dailydiv" Style="position:relative;margin-left:2px;width:1000px;" ><p id="dailytitle">Detail Daily Timesheet</p></div>

    <table Style="position:relative;margin-top:8px;width:1000px;"  border="1">
    <tr>
    <th>Sequence No<th>Project Code</th><th>Project Name</th><th>Activity Code<th>Work Description<th>Start Time<th>End Time<th>Total Hours</tr>
    <tbody id="viewtbody">
    </tbody>
    
    
    
    </table>
  </div>

</div>
 </td>
    </tr>
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


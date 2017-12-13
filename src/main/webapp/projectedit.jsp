<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Project Add</title>
<!-- <meta charset="utf-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link href="ProjectManagementTool-UI/css/Plugins/bootstrap.min.css"
	rel="stylesheet">
<link
	href="ProjectManagementTool-UI/css/Plugins/bootstrap-theme.min.css"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/font-awesome.min.css"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,300italic,600,600italic,700,800,700italic,800italic'
	rel='stylesheet' type='text/css'>
<link
	href="https://fonts.googleapis.com/css?family=Oswald|Roboto|Roboto+Condensed"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/accordion-menu.css"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/jquery.jscrollpane.css"
	rel="stylesheet">
<link href="ProjectManagementTool-UI/css/Plugins/main.css"
	rel="stylesheet">
<script
	src="ProjectManagementTool-UI/js/Plugins/jquery-3.2.1-jquery.min.js"></script>
<script src="ProjectManagementTool-UI/js/Plugins/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src=" ProjectManagementTool-UI/js/Plugins/jqueryui-1.10.3-jquery-ui.js"></script>
<!--    <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script> -->
<script type="text/javascript"
	src="ProjectManagementTool-UI/js/projectedit.js"></script>
<!--   <script src=js/projectadd.js></script> -->
<script src="ProjectManagementTool-UI/js/cookies.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="ProjectManagementTool-UI/css/projectedit.css"> -->
<script type="text/javascript">
function goBack() {
    window.history.back();
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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	height: 400px
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

	<!--- Top Panel -->
	<div class="topPane">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-12 text-center">
					<a href="../dashboard.html"><img
						src="ProjectManagementTool-UI/css/images1/ennvee-white-logo.png"
						class="img-responsive logo" alt="Ennvee"></a>
				</div>
				<div class="col-md-5 col-sm-6 col-xs-12 discoverMigration">
					<a href="#">Project Management</a>
				</div>
				<div class="col-md-5 col-sm-4 col-xs-12 rightPane">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-4 col-sm-7 loginButton hidden-xs">
								<a href="#" class="btn btn-default dropdown-toggle"
									type="button" id="dropdownMenu1" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> Hi,<span
									id="destusername"></span> <span class="caret"></span>
								</a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><span><i class="fa fa-tachometer"
											aria-hidden="true"></i></span><span><a href="#">Dashboard</a></span></li>
									<li><span><i class="fa fa-snowflake-o"
											aria-hidden="true"></i></span><span><a href="#">Ennable</a></span></li>
									<li><span><i class="fa fa-wpexplorer"
											aria-hidden="true"></i></span><span><a href="#">Discoverer
												Converter</a></span></li>
									<li><span><i class="fa fa-superpowers"
											aria-hidden="true"></i></span><span><a href="#">Auto
												Custom Testing</a></span></li>
									<li><span><i class="fa fa-rebel" aria-hidden="true"></i></span><span><a
											href="#">NetSuite Tableau</a></span></li>
									<li><span><i class="fa fa-unlock"
											aria-hidden="true"></i></span><span><a href=""
											id="desklogout1">Logout</a></span></li>
								</ul>
							</div>

							<div class="col-md-2 col-sm-1 logOut hidden-xs">
								<span id="seetingsIcon"><i class="fa fa-lock"
									aria-hidden="true"></i></span><a href="#" id="desklogout2">Log Out
								</a>
							</div>
							<!--Mobile Menu-->
							<div class=" row mobileMenu visible-xs ">
								<div class="col-xs-6 mobilemenu1">
									<a href="#" class="btn dropdown-toggle" id="dropdownMenu1"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Hi,<span id="moblieusernmae"></span>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
										<li><span><i class="fa fa-tachometer"
												aria-hidden="true"></i></span><span><a href="#">Dashboard</a></span></li>
										<li><span><i class="fa fa-snowflake-o"
												aria-hidden="true"></i></span><span><a href="#">Ennable</a></span></li>
										<li><span><i class="fa fa-wpexplorer"
												aria-hidden="true"></i></span><span><a href="#">Discoverer
													Converter</a></span></li>
										<li><span><i class="fa fa-superpowers"
												aria-hidden="true"></i></span><span><a href="#">Auto
													Custom Testing</a></span></li>
										<li><span><i class="fa fa-rebel"
												aria-hidden="true"></i></span><span><a href="#">NetSuite
													Tableau</a></span></li>
										<li><span><i class="fa fa-unlock"
												aria-hidden="true"></i></span><span><a href="#"
												id="moblielogout1">Logout</a></span></li>
									</ul>
								</div>
								<div class="mobileMenu2 col-xs-2">
									<a href="#"><i class="fa fa-cog" aria-hidden="true"></i></a>
								</div>
								<div class="mobileMenu3 col-xs-2">
									<a href="#"><i class="fa fa-question-circle"
										aria-hidden="true"></i></a>
								</div>
								<div class="mobileMenu4 col-xs-2">
									<a href="#"><i class="fa fa-lock" id="moblielogout2"
										aria-hidden="true"></i></a>
								</div>
							</div>
							<!--End Mobile Menu-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<section> <header>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 text-center">
				<h3 class="well well-sm">Project Edit</h3>
			</div>
		</div>
	</div>
	</header> </section>
	<section>
	<div class="container" style="width: 100%">
		<div class="middlePane">
			<div class="discoverParameterBlock">
				<form id="form" class="technicalDetailsForm" method="post">
					<div class="form-group row">
						<fieldset class="col-md-11">
							<legend>
								<label><b>Project Details</b></label>
							</legend>
							<div class="col-md-6 col-sm-6 col-xs-12 localDb">
								<div class="form-group">
									<label for="exampleInputEmail1">Project Code * :</label> <input
										type="email" class="form-control" id="projectcode"
										name="projectcode" placeholder="">
									<!-- 								   <label id="epc"> Enter project code </label> -->
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Project Name * :</label> <input
										type="email" class="form-control" id="projectname"
										name="projectname" placeholder="">
									<!-- 								   <label id="epn"> Enter project name </label> -->
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Start Date* :</label> <input
										class="form-control" id="startdate" name="startdate"
										type="date" placeholder="">
									<!-- 								   <label id="esd">Select end date</label> -->
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">End Date * :</label> <input
										class="form-control" id="enddate" name="enddate" type="date"
										placeholder="">
									<!-- 								   <label id="esd">Select end date</label> -->
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 DestinationDb">

								<div class="form-group">
									<label for="exampleInputEmail1">Project Description :</label>
									<textarea class="form-control" id="pd" name="pd" rows="4"
										cols="50"></textarea>
									<!-- 								   <label id="esd">Select end date</label> -->
								</div>

							</div>
						</fieldset>



					</div>




					<div class="form-group row">
						<fieldset class="col-md-11">
							<legend> Developement Details </legend>


							<div class="col-md-6 col-sm-6 col-xs-12 localDb">
								<div class="form-group">
									<label for="exampleInputEmail1">Center * :</label> <select
										id="center" name="center" class="form-control"><option
											value="Select">Select</option></select>

									<!-- 								  <label id="ec"> Select center</label> -->
								</div>



								<div class="form-group">
									<label for="exampleInputEmail1">Location * :</label> <select
										id="location" name="location" class="form-control"><option
											value="Select">Select</option></select>

									<!-- 								   <label id="el"> Select location</label>       -->
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Contract Type * :</label> <select
										id="contracttype" name="contracttype" class="form-control"><option
											value="Select">Select</option></select>

									<!-- 								  <label id="ect">Select contract type</label>      -->
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Project Status * :</label> <select
										id="projectstatus" name="projectstatus" class="form-control"><option
											value="Select">Select</option></select>

									<!-- 								 <label id="eps">Select project status as open</label>      -->
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Customer Portfolio * :</label>
									<select id="customerportfolio" name="customerportfolio"
										class="form-control"><option value="Select">Select</option></select>

									<!-- 								 <label id="ecp">Select customer portfolio</label>      -->
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 DestinationDb">



								<div class="form-group">
									<label for="exampleInputEmail1">Technology * :</label> <select
										id="technology" name="technology" class="form-control"><option
											value="Select">Select</option></select>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1"></label>
									<textarea id="tech" class="form-control" rows="2" cols="50"
										name="tech"> </textarea>
									<!-- 								<label id="et">Select technology</label>      -->
								</div>

								<div class="col-md-8 col-sm-6 col-xs-12 localDb">
									<div class="form-group">
										<label for="exampleInputEmail1">Effort Required * :</label> <input
											id="effortrequired" class="form-control" style="width: 150px"
											name="effortrequired" type="text">
									</div>

								</div>
								<div class="col-md-2 col-sm-4 col-xs-12 DestinationDb">

									<label id="mandays" for="exampleInputEmail1">Man-days</label>


								</div>

								<div class="col-md-6 col-sm-6 col-xs-12 localDb">
									<div class="form-group">

										<label for="exampleInputEmail1">Onsite * :</label> <input
											id="onsite" name="onsite" class="form-control"
											style="width: 50px" type="text">
										<!-- 								  <label id="eon">Enter onsite effort</label> -->
									</div>
								</div>
								<div class="col-md-6 col-sm-4 col-xs-12 DestinationDb">

									<div class="form-group">

										<label for="exampleInputEmail1">Offshore * :</label> <input
											id="offshore" name="offshore" class="form-control"
											style="width: 50px" type="text">
										<!-- 								  <label id="eoff">Enter offshore effort</label> -->
									</div>


								</div>

							</div>

						</fieldset>
					</div>
					<div class="form-group row">
						<fieldset class="col-md-11">
							<legend>
								<label><b>Client Details</b></label>
							</legend>
							<div class="form-group">
								<label for="exampleInputEmail1">Client Code * :</label> <select
									id="cc" name="customer_id" class="form-control"
									style="width: 300px"><option value="Select">Select</option></select>

								<!-- 								<label id="eso">Select services offered</label>      -->
							</div>

							<div class="form-group">

								<table id="myTable" width="100%" class="table-responsive">
									<tr>
										<th><b>Select</b></th>
										<th><b>Contact Person</b></th>
										<th><b>Mail id</b></th>
										<th><b>Contact Number</b></th>
										<th><b>Alternative Number</b></th>
										<th></th>
									</tr>
									<tbody id="tbody">

									</tbody>

								</table>
								<!-- 							<img src="ProjectManagementTool-UI/css/images1/addicon.jpg"	 Style="width: 20px; height: 20px" id="addrow" /> -->
							</div>
							<div>
								<img src="ProjectManagementTool-UI/css/images1/addicon.jpg"
									class="img-responsive" alt="Cinque Terre" width=20px
									height='20px' id="addrow" />
							</div>
						</fieldset>
					</div>



					<div class="form-group row">
						<fieldset class="col-md-11">
							<legend>
								<label><b>Responsibility</b></label>
							</legend>
							<div class="col-md-4 col-sm-6 col-xs-12 localDb">
								<div class="form-group">
									<label id="projectmanagerl">Project Manager*</label> <select
										class="form-control" style="width: 200px" id="projectmanager"
										name="projectmanager">
										<option>Select</option>
									</select>
								</div>
							</div>
							<div class="col-md-8 col-sm-6 col-xs-12 DestinationDb">
								<div class="col-md-6 col-sm-5 col-xs-12 localDb">
									<!-- 							<label id="epm">Select project manager</label> -->
									<div class="form-group">
										<label id="deliverymanagerl">Delivery Manager*</label> <select
											class="form-control" style="width: 200px"
											id="deliverymanager" name="deliverymanager">
											<option>Select</option>

										</select>
										<!-- 							<label id="edm">Select delivery manager</label>  -->
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-12 DestinationDb">
									<div class="form-group">
										<label id="">Onsite Co-ordinator</label> <select
											class="form-control" style="width: 200px"
											id="onsitecoordinator" name="onsitecoordinator">
											<option>Select</option>

										</select>
										<!-- 							 <label id="eoc">Select onsite co-ordinator</label> -->
									</div>
								</div>
							</div>
						</fieldset>
					</div>




					<div class="col-md-6 col-sm-6 col-xs-12 localDb">
						<div class="form-group row">
							<fieldset class="col-md-10">
								<legend>
									<label><b>Remarks</b></label>
								</legend>
								<div class="form-group">
									<label for="pm" id="pml">Project Manager/Delivery
										Manager</label>
									<textarea id="pm" class="form-control" name="pm" rows="3"
										cols="50"></textarea>
								</div>
								<div class="form-group">
									<br> <label id="generall" for="general">General</label>
									<textarea id="general" class="form-control" name="general"
										rows="3" cols="50"></textarea>
								</div>
							</fieldset>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12 DestinationDb">
						<div class="form-group row">
							<fieldset class="col-md-10" id="supportfile">
								<legend>
									<label><b>Support File</b></label>
								</legend>
								<div class="form-group">
									<label id="uploadfile" for="upload">Upload Files*</label> <input
										type="button" id="upload" class="btn btn-primary"
										value="Attachment upload" onclick='onclick1()'>

								</div>
								<div class="form-group">
									<label id="filedescription" for="filedescr">File
										Description</label>
									<textarea id="filedescr" class="form-control" name="filedescr"
										rows="4" cols="47"></textarea>
								</div>

							</fieldset>
						</div>
					</div>
			</div>
			<br>
			<div id="myModal" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<span class="close">&times;</span>

					<div id="dailydiv"
						Style="position: relative; margin-left: 2px; width: 1000px; margin-top: 20px">
						<p id="dailytitle">Support File</p>
					</div>

					<table Style="margin-top: 50px; margin-left: 110px" align="center">
						<tr>

							<th width="20%" align="center"><b>File</b></th>
							<th width="30%" align="center"><b></b></th>

						</tr>
						<tbody id="filetbody">
							<tr id="filerow1">
								<td><input type="file" name="file" id="file" /></td>
								<td><img
									src="ProjectManagementTool-UI/css/images1/close.jpg"
									Style="width: 20px; height: 20px" onclick="myFunction66(1);"
									id="fileremove" /></td>
							</tr>
						</tbody>



					</table>
					<img src="ProjectManagementTool-UI/css/images1/addicon.jpg"
						Style="margin-left: 110Px; width: 20px; height: 20px"
						id="addfilerow" />
				</div>

			</div>
			<div>
				<input type="hidden" value="" name="id" id="id"> <input
					type="hidden" value="" name="emp_code" id="emp_code">

				<div class="row actionBtn">
					<div
						class="col-md-2 col-xs-6 col-sm-2 col-md-offset-4 col-sm-offset-4 col-xs-offset-0">
						<button id="save" class="btn btn-primary">Save</button>
					</div>
					<div class="col-md-2 col-xs-6">
						<button id="cancel" class="btn btn-primary" type="button">
							<B>Cancel</B>
						</button>
					</div>
				</div>
			</div>
			<br> <br>

			</form>
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

/**
 * 
 */var count=1;
var totaltime;
var activitycode='';
var activitycodetimesheet;
var rowcount=1;
var row;
var projectappend='';
var project_name9;
var app='';
var designation='';
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
var emp_code=checkCookie2(decodeURIComponent(document.cookie));
designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2==null){
		
		location.href='index.html'
	}
	else{
	
		 $('#destusername').text(user2) ;
		 var today = new Date();
		 var dd = today.getDate();
		 var mm = today.getMonth()+1; //January is 0!
		 var yyyy = today.getFullYear();
		  if(dd<10){
		         dd='0'+dd
		     } 
		     if(mm<10){
		         mm='0'+mm
		     } 

		 today = yyyy+'-'+mm+'-'+dd;
		 $("#startdate").attr("max", today);

//		 document.getElementById("startdate").setAttribute("max", today);

	 	//	alert(emp_code); 
			 var url5 = "rest/webservices/getmasterdetails?category=activitycode";
				
				$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url5,
				        success: function(data) {
				            console.log("response:" + data);
								
								var object=data.object;
								activitycode='';
								activitycode='<Select style="width:99%"  class="form-control" name="acitivity"><option>Select</option>'
				            for ( var i in object) {

				            	$("#projectstatus")
								.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
				            	activitycode=activitycode+' <option value='+object[i].item+'>'+object[i].item+'-'+object[i].item_descrption+'</option>';
				            }
				            activitycode=activitycode+'</select>';
							},
							error : function(msg) {
								console.log("User technology Details not found", msg);
							}
						});
			
			
			
		 
	 		var url = "rest/webservices/getemployee?emp_code="+emp_code;

	 		$.ajax({
	 		        type: "GET",
	 		        dataType:"json",
	 		        url: url,
	 		        success: function(data) {
	 		            console.log("response:" + data);
	 						
	 						var object=data.object;
	 						$("#tbody tr").remove();
	 		            for ( var i in object) {
                            $("#employee_code").val(object[i].emp_code);
                            $("#employee_name").val(object[i].first_name);
                            
	 		            	$("#employeecode").append('<b>EmployeeCode:'+object[i].emp_code.toUpperCase()+'</B>');
	 		            	$("#employeename").append('<b>EmployeeName:'+object[i].first_name.toUpperCase()+'</B>');
	 		            	$("#designation").append('<b>Designation:'+object[i].designation.toUpperCase()+'</B>');
	 		            }
	 					},
	 					error : function(msg) {
	 					
	 					}
	 				});
	 		
	 		
	 		
	 		
	 		
	 		
	 		
	 		
	 		if(designation=='associate'){
	 		
	 		var url = "rest/webservices/allallocationemp?emp_code="+emp_code;

	 		$.ajax({
	 		        type: "GET",
	 		        dataType:"json",
	 		        url: url,
	 		       async:false,
	 		        success: function(data) {
	 		            console.log("response:" + data);
	 						
	 						var object=data.object;
	 						
	 		            for ( var i in object) {
	 		            	var url2 = "rest/webservices/getprojectcodebased?project_code="+object[i].project_code;
	 		            
	 		            	$.ajax({
	 			 		        type: "GET",
	 			 		        dataType:"json",
	 			 		        url: url2,
	 			 		       async:false,
	 			 		        success: function(data) {
	 			 		            console.log("response:" + data);
	 			 						
	 			 						var object=data.object;
	 			 							
	 			 		            for ( var i in object) {
	 			 		            	projectappend=projectappend+'<option value="'+object[i].project_code+'">'+object[i].project_name+'</option>';	
	 			 		            }
	 			 					},
	 			 					error : function(msg) {
	 			 					
	 			 					}
	 			 				});
	 			 		
	 		            	
	 		            	
	 		            	
	 		            }
	 					},
	 					error : function(msg) {
	 					
	 					}
	 				});
	 		}else{
	 			if(designation=='project_manager'){
	 				
	 				var url = "rest/webservices/all_allocation_manager?emp_code="+emp_code;

	 		 		$.ajax({
	 		 		        type: "GET",
	 		 		        dataType:"json",
	 		 		        url: url,
	 		 		       async:false,
	 		 		        success: function(data) {
	 		 		            console.log("response:" + data);
	 		 						
	 		 						var object=data.object;
	 		 						
	 		 		            for ( var i in object) {
	 		 		            	var url2 = "rest/webservices/getprojectcodebased?project_code="+object[i].project_code;
	 		 		       
	 		 		            	$.ajax({
	 		 			 		        type: "GET",
	 		 			 		        dataType:"json",
	 		 			 		        url: url2,
	 		 			 		       async:false,
	 		 			 		        success: function(data) {
	 		 			 		            console.log("response:" + data);
	 		 			 						
	 		 			 						var object=data.object;
	 		 			 							
	 		 			 		            for ( var i in object) {
	 		 			 		            	projectappend=projectappend+'<option value="'+object[i].project_code+'">'+object[i].project_name+'</option>';
	 		 			 		            	
	 		 			 		            }
	 		 			 					},
	 		 			 					error : function(msg) {
	 		 			 					
	 		 			 					}
	 		 			 				});
	 		 			 		
	 		 		            	
	 		 		            	
	 		 		            	
	 		 		            }
	 		 					},
	 		 					error : function(msg) {
	 		 					
	 		 					}
	 		 				});

	 				
	 				
	 				
	 				
	 				
	 				
	 				
	 			}
	 			
	 			
	 			
	 			
	 			
	 			
	 		}
	 		
	}
	
});
});


function homeFunction()

{
	
	if(designation!='admin')
		{
		location.href='empdashboard.jsp';
		}
	else if(designation=='project_manager')
		{
		
		location.href='managerdashboard.jsp';
		}
	else 
		{
		location.href='projectdashboard.jsp';
		}
	} 
$().ready(function(event){
	
	
	$('#addrow').click(function() {
		var startdate=$('#startdate').val();
		
		if(startdate=='')
			{
			alert('Select date');
			}
		else
			{
		if(app!='Approved'){
		$("#tbody").append('<tr id="'+rowcount+'" onclick="myFunction1(this)"><td><td><input type="hidden" value="0" name="rowid" id="rowid'+rowcount+'"><select  class="form-control" id="mySelect" name="mySelect" onchange="myFunction(this)"><option val="Select">Select</option>'+projectappend+'</select><td><td>'+activitycode+'<td><input type="text"   class="form-control" name="workactivity" style="width:99%"><td><input type="time" id="starttime'+rowcount+'"   class="form-control" oninput="myFunction6('+rowcount+')" name="starttime">'
				+'<td><input  type="time"  class="form-control" id="endtime'+rowcount+'"  oninput="myFunction7('+rowcount+')" name="endttime"><td><input type="hidden" id="hour'+rowcount+'" name="hour"><span id="hourlabel'+rowcount+'"></span><td ><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction3('+rowcount+')" id="remove"/></td></tr>');	    
		rowcount=rowcount+1;
		call2();
		}
			}
	});
});

function myFunction1(x) {
    row= x.rowIndex;
}
function myFunction2() {
	
//    alert(row);
    document.getElementById("myTable").deleteRow(row);
	// document.getElementById("passwordl").rows[row].remove;
}

function myFunction3(x) {
	var k='#'+x;
	
	 var txt;
	    if (confirm("Are you sure you want to permanently delete this row?") == true) {
	    	
	    	
	 	   if($("#rowid"+x).val()==0){ $(k).remove();
	    	 call();
	    	 call2();}
	 	   else{
	 	  var url6="rest/webservices/deletedtimesheetrow?rowid="+$("#rowid"+x).val();
	 		
	 		//alert(url6);
	 		$.ajax({
	 			 url: url6,
	 			    type: 'GET',
	 			  
	 			     success: function (data) {
	 		    	console.log("response:" + data);
	 		    	if(data.status==0){
	 		    		 $(k).remove();
	    	 call();
	    	 call2();
	 		    	}
	 		    	else{
	 		    		alert("failed to delete row");
	 		    	}
	 		    
	 		    },error : function(msg) {
	 		        	event.preventDefault();
	 		    			console.log("Details not found", msg);
	 		    		}
	 		});
	 	   
	 	   }  
	    }
	
	
}




function myFunction(source){
	
//	 var x = document.getElementById("mySelect").value;

	
	 var z =source.value ;
	
	
		var url = "rest/webservices/getprojectcodebased?project_code="+z;
//		 alert( url);
		// document.getElementById("myTable").rows[row].cells[2].innerHTML='';
			
			 var remove='<img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2()" id="remove"/>';
	  	$.ajax({
	  	        type: "GET",
	  	        dataType:"json",
	  	        url: url,
	  	      async:false,
	  	        success: function(data) {
	  	            console.log("response:" + data);
	  	         
	  					var object=data.object;
	  					 for ( var i in object) {
	  						document.getElementById("myTable").rows[row].cells[2].innerHTML="";
	  						 var id='<input type="hidden" value="'+object[i].project_code+'" name="project_code" >'+object[i].project_name;
	  						//myTable.rows[row].cells[2].innerHTML =object[i].mail ;
	  						 document.getElementById("myTable").rows[row].cells[2].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[2].innerHTML="";
//	  						 document.getElementById("myTable").rows[row].cells[3].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[4].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[5].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[6].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[7].innerHTML=id;
	  						
	  						
	  						 //document.getElementById("myTable").rows[row].cells[9].innerHTML=remove;
	  						 
	  						 //alert(object[i].mail);
	  						 
	  						 
	  		                 
	  			            }
	  					
	  				
	  				},
	  			error : function(msg) {
	  					console.log("User customer Details not found", msg);
	  				}
	  			});
	  
}









$().ready(function(){
	$( "#starttime" ).spinner({
		  change: function( event, ui ) {
//			  alert("starttime");
			  }
		});
		
		
	
		
//		if($('#enddate').val()!=''){
//			
//			
//			var start=new Date($('#startdate').val());
//			var end=new Date($('#enddate').val());
//			
//			var day=dateDifference(start,end);
//			$('#nodays').text('No.of.days         :  '+day);
//			$('#estimationhours').text('Estimation Hours   :'+day*8);
//			
//			
//		}
//		
		
		
		
	});


	

function myFunction6(row){
	var start1=$("#starttime"+row).val();
	var end1=$("#endtime"+row).val();
	
	if(end1!='')
		{
		if(start1<=end1)
			{
			
			
			 start1 = start1.split(":");
			    end1 = end1.split(":");
			    var startDate = new Date(0, 0, 0, start1[0], start1[1], 0);
			    var endDate = new Date(0, 0, 0, end1[0], end1[1], 0);
			    var diff = endDate.getTime() - startDate.getTime();
			    var hours = Math.floor(diff / 1000 / 60 / 60);
			    diff -= hours * 1000 * 60 * 60;
			    var minutes = Math.floor(diff / 1000 / 60);

			    // If using time pickers with 24 hours format, add the below line get exact hours
			    if (hours < 0)
			       hours = hours + 24;

		var total=(hours <= 9 ? "0" : "") + hours + ":" + (minutes <= 9 ? "0" : "") + minutes;


	    $("#hour"+row).val(total);
	    $("#hourlabel"+row+" label").remove();
	    $("#hourlabel"+row).append("<label>"+total+"</label>");
	call();
			
			}else
				{
//				alert("Time");
				}
		}
	
}
function myFunction7(row){
	var start=$("#starttime"+row).val();
	var end=$("#endtime"+row).val();
	
	if(start!='')
	{
		if(start<=end)
		{
			 start = start.split(":");
			    end = end.split(":");
			    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
			    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
			    var diff = endDate.getTime() - startDate.getTime();
			    var hours = Math.floor(diff / 1000 / 60 / 60);
			    diff -= hours * 1000 * 60 * 60;
			    var minutes = Math.floor(diff / 1000 / 60);

			    // If using time pickers with 24 hours format, add the below line get exact hours
			    if (hours < 0)
			       hours = hours + 24;
			    var total=(hours <= 9 ? "0" : "") + hours + ":" + (minutes <= 9 ? "0" : "") + minutes;

			    $("#hour"+row).val(total);
			    
			    $("#hourlabel"+row+" label").remove();
			    $("#hourlabel"+row).append("<label>"+total+"</label>");
			
			    call();
			
		}else
			{
//			alert("Time");
			}
	}

	}
	



$().ready(function(){
	$("#save").click(function(event){
		var rowempty=$("#tbody").find('tr').length;
		if(rowempty!=0){ 	
		var valid1=0;
		var valid2=0;
		var valid3=0;
		var valid4=0;
		var valid5=0;
		var valid6=0;
var data = $("#form").serializeArray();
	$.each(data, function(i, field){
		if(field.name==="mySelect")
			{
			if(field.value=='Select')
				{
				valid1=0;
				alert('Select your project');
				}
			else
				{
			valid1=valid1+1;
				}
			}
		if(field.name==="workactivity")
		{
		if(field.value=='')
			{
		valid2=0;
		alert('Enter your work description');
			}
		else
			{
		valid2=valid2+1;
			}
		}
		if(field.name==="acitivity")
		{
		if(field.value=='Select')
			{
		valid3=0;
		alert('Select activities');
			}
		else
			{
		valid3=valid3+1;
			}
		}
//		if(field.name==="date")
//		{
//		if(field.value=='')
//			{
//		valid4=0;
//		alert('Select date');
//			}
//		else
//			{
//		valid4=valid4+1;
//			}
//		}
		if(field.name==="starttime")
		{
		if(field.value=='')
			{
		valid5=0;
		alert('Select starttime');
			}
		else
			{
		valid5=valid5+1;
			}
		}
		if(field.name==="endttime")
		{
		if(field.value=='')
			{
		valid6=0;
		alert('Select endtime');
			}
		else
			{
		valid6=valid6+1;
			}
		}
	});
	var c=rowcount-count;
	if(valid2==c&&valid3==c&&valid5==c&&valid6==c)
		{
		
		if(app!='Approved'){
			var x = confirm("Are you sure Forward Time Sheet");
			  if (x){

var data = $("#form").serializeArray();
data.push({ name: "date", value: $("#startdate").val() });
data.push({ name: "approved_status", value: "Pending" });
var url="rest/webservices/timesheetedit";
	//data.push({ name: "customer_id", value: id6 });
	
	$.ajax({
		 url: url,
		    type: 'POST',
		    data:data,
		    async:false,
	    success: function (data) {
	    	console.log("response:" + data);
	    	if(data.status==0){
	    	alert("Timesheet submitted  sucessfully");
	    	}
	    	else{
	    		alert(" Fill mandatory fields");
	    	}
	    
	    },error : function(msg) {
	        	event.preventDefault();
	    			console.log("Error occurred due to some issues", msg);
	    				
	    		}
	});
			  }
			  else{
				  event.preventDefault();
			  }
			  }
		else{
			event.preventDefault();
		}
		}
	else
		{
		alert('Fill mandatory fields');
		}
		}
		else{
			alert("Fill timesheet");
			event.preventDefault();
		}  
});
});




$().ready(function(){
	
	$("#temp").click(function(event){
		var rowempty=$("#tbody").find('tr').length;
		if(rowempty!=0){ 
		if(app!='Approved'){
var data = $("#form").serializeArray();
data.push({ name: "date", value: $("#startdate").val() });
data.push({ name: "approved_status", value: "Saved" });
var url="rest/webservices/timesheetedit";

	
	
	$.ajax({
		 url: url,
		    type: 'POST',
		    data:data,
		    async:false,
	    success: function (data) {
	    	console.log("response:" + data);
	    	if(data.status==0){
	    	alert("Timesheet saved sucessfully");
	    	}
	    	else{
	    		alert("Timesheet saved failed");
	    	}
	    
	    },error : function(msg) {
	        	event.preventDefault();
	    			console.log("Error occurred due to some issues", msg);
	    				
	    		}
	});
		}
		else{
			event.preventDefault();
		}
		}else{
			alert("Fill timesheet");
			event.preventDefault();
		}  
});
});




$().ready(function(){
	$("#startdate").change(function(event){
		$('#approved_status').val(''); 
		app='';
		$("#totalhoursl b").remove();
		$("#totalhoursl").append('<b>Hours : </b>');
var url5 = "rest/webservices/get_timesheet_one_emp?emp_code="+$("#employee_code").val()+"&start_date="+$("#startdate").val();
	
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url5,
	        async:false,
	        success: function(data) {
	            console.log("response:" + data);
	            $("#tbody tr").remove();
					var object=data.object;
					$('#approvalstatusl b').remove();
	            for ( var i in object) {
	            	
	            	var e = new Date(object[i].date);
	            	var str1 = $.datepicker.formatDate('yy-mm-dd', e);
	            	var url7= "rest/webservices/getprojectcodebased?project_code="+object[i].project_code;

			     	  	$.ajax({
	  	        type: "GET",
	  	        dataType:"json",
	  	        url: url7,
	  	      async:false,
	  	        success: function(data) {
	  	            console.log("response:" + data);
	  	         
	  					var object2=data.object;
	  					 for ( var i in object2) {
	  					project_name9=object2[i].project_name;
	  					 }
	  	        },error : function(msg) {
				console.log("Error occurred due to some issues", msg);
			}
	 });
	    
			     	  	
			     	  	if(object[i].approved_status.trim()=="Approved"){
	            	app=object[i].approved_status.trim();
			     	  		var timeString =object[i].start_time ;
		            		var hourEnd = timeString.indexOf(":");
		            		var H = +timeString.substr(0, hourEnd);
		            		var h = H % 12 || 12;
		            		var ampm = H < 12 ? "AM" : "PM";
		            		timeString = h + timeString.substr(hourEnd, 3) + ampm;
		            		var timeString1 =object[i].end_time ;
		            		var hourEnd = timeString1.indexOf(":");
		            		var H = +timeString1.substr(0, hourEnd);
		            		var h = H % 12 || 12;
		            		var ampm = H < 12 ? "AM" : "PM";
		            		timeString1 = h + timeString1.substr(hourEnd, 3) + ampm;
		            		
		            		
		            		
		            		$("#tbody").append('<tr id="'+rowcount+'" onclick="myFunction1(this)"><td>'+object[i].project_code+'<td>'+project_name9+'<td>'+str1+'<td>'+object[i].acitivity+'<td>'+object[i].work_description+'<td>'+timeString+'<td>'+timeString1+'<td>'+object[i].total_hours+'<td><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px"/></td></tr>');	    
			        	
		            		
		               		
		               		$('#approvalstatusl b').remove();
		               		$('#approvalstatusl').append('<b>'+object[i].approved_status+'</b>');
		               		rowcount=rowcount+1;  	
		               		$("#totalhoursl b").remove();
		               		
		               		$("#totalhoursl").append('<b> Hourse :'+object[i].day_hours+'</b>');
			     	  
		               		count=count+1;
			     	  	}
	            	else{
	            		
	            		
	            	
	            		 $("#addimage").css('display','block');
	            		app=object[i].approved_status.trim();
		        		
		        		activitycodetimesheet=object[i].acitivity;
      			     	 var url5 = "rest/webservices/getmasterdetails?category=activitycode";
      					
      					$.ajax({
      					        type: "GET",
      					        dataType:"json",
      					        url: url5,
      					     async:false,
      					        success: function(data) {
      					            console.log("response:" + data);
      									
      									var object6=data.object;
      									activitycode='';
      									activitycode='<Select  class="form-control"  Style="height:30px;width:98%" id="acitivity'+rowcount+'" name="acitivity"><option value="'+activitycodetimesheet+'">'+activitycodetimesheet+'</option>';
      					            for ( var i in object6) {
                                       if(object6[i].item!=activitycodetimesheet)
      					            	{
      					            	activitycode=activitycode+' <option value='+object6[i].item+'>'+object6[i].item+'</option>';
      					            	}
      					            	}
      					            activitycode=activitycode+'</select>';
      								},
      								error : function(msg) {
      									console.log("Error occurred due to some issues", msg);
      								}
      							});
      			     	  	
      			     	  	
   
       		$("#tbody").append('<tr id="'+rowcount+'" onclick="myFunction1(this)"><td ><td><input  class="form-control" type="hidden" id="rowid'+rowcount+'" name="rowid" value="'+object[i].id+'"> <select id="mySelect"  class="form-control" Style="height:30px;width:98%" onchange="myFunction(this)"><option>Select</option>'+projectappend+'</select><td id="change'+rowcount+'"><input type="hidden" value="'+object[i].project_code+'" name="project_code" >'+project_name9+'<td>'+activitycode+
       				'<td><input type="text" name="workactivity" value="'+object[i].work_description+'"  class="form-control"></td><td><input type="time"   class="form-control" value="'+object[i].start_time+'" id="starttime'+rowcount+'"  oninput="myFunction6('+rowcount+')"  Style="height:30px;width:98%" name="starttime">'
       				+'<td><input type="time"   class="form-control" Style="height:30px" value="'+object[i].end_time+'" id="endtime'+rowcount+'"  oninput="myFunction7('+rowcount+')" name="endttime"><td><input type="hidden" value="'+object[i].total_hours+'" id="hour'+rowcount+'" name="hour"><span id="hourlabel'+rowcount+'"><label>'+object[i].total_hours+'</label></span> <td ><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction3('+rowcount+')" id="remove"/></td></tr>');	    
       		
       		$('#approved_status').val(object[i].approved_status);
       		
       		$('#approvalstatusl b').remove();
       		$('#approvalstatusl').append('<b>'+object[i].approved_status+'</b>');
       		rowcount=rowcount+1;
		        		
		        		
		        		
		        		
		        		
		        		
       		call();	  	
       		call2(); 		
	            	}
			     	  	
	            }
	          
	        	
	        	
				},
				error : function(msg) {
					console.log("Error occurred due to some issues", msg);
				}
			});
	});
});





function call()
{
	totaltime='';
	day_hours='00:00';
	
	var total=00;
	var time1=0;
	var time2=0; 
	var min1=0;
	var min2=00;
	var tmin=00;
	
		for(var i=1;i<=rowcount-1;i++)
	{
			
		
			
			
			 
			 if( $("#hour"+i).val()!=null){
			
				 var rowtime= $("#hour"+i).val().trim();
				 rowtime=rowtime.split(":");
				 time1=parseInt(rowtime[0]);
				 min1=parseInt(rowtime[1]);
				 
				 time1=time1+time2;
				 min1=min1+min2;
				 if(min1>=60){
					 min1=min1-60;
					 time1=time1+1;
					 
				 }
				 
				 
				 time2=time1;
				 min2=min1;
				 
				 
				 
				 
				    
			
			  
			
			 }
			 
			 
			 
	}
		 totaltime=(time2 <= 9 ? "0" : "") + time2.toString() + ":" + (min2 <= 9 ? "0" : "") + min2.toString();

				$("#totalhoursl b").remove();
		
$("#totalhoursl").append('<b> Hourse :'+totaltime+'</b>');
$("#day_hour").val(totaltime);

		
		
		
		
	
	
	
}


function call2(){
	
	var x = document.getElementById("tbody").rows.length;

var count=0;
for(var i=1;i<=x;i++)
	{
	
	
	document.getElementById("tbody").rows[count].cells[0].innerHTML="";
		 var id='<input type="hidden" value="'+i+'" name="sequnce_no" >'+i;
		//myTable.rows[row].cells[2].innerHTML =object[i].mail ;
		 document.getElementById("tbody").rows[count].cells[0].innerHTML=id;
	
	
	count=count+1;
	
	
	
	
	}
	
}


$().ready(function(){
	
	
	$("#cancel").click(function (){
	if(designation=='project_manager')
	{
		 location.href='managerdashboard.jsp';
	}
	else if(designation=='associate')
		{
		 location.href='empdashboard.jsp';
		}
	});

	
});





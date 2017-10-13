/**
 * 
 */
var activitycode='<Select Style="height:30px;width:98%"  name="acitivity"><option>Select</option>';
var rowcount=1;
var row;
var day_hours=0;
var day_minutes=0;
var projectappend='';
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
var emp_code=checkCookie2(decodeURIComponent(document.cookie));
	if(user2==null){
		
		location.href='index.html'
	}
	else{
	
		 $('#welcomeuser').append("<b>Welcome "+user2.charAt(0).toUpperCase() + user2.slice(1)+" !!!</b>") ;
			
		 
	 	//	alert(emp_code); 
		 
		 
		 var url5 = "rest/webservices/getmasterdetails?category=activitycode";
			
			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url5,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
			            for ( var i in object) {

			            	$("#projectstatus")
							.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
			            	activitycode=activitycode+' <option value='+object[i].item+'>'+object[i].item+'</option>';
			            }
			            activitycode=activitycode+'</select>';
						},
						error : function(msg) {
							console.log("User technology Details not found", msg);
						}
					});
			
		 
	 		var url = "rest/webservices/projectmanagername?emp_code="+emp_code;

	 		$.ajax({
	 		        type: "GET",
	 		        dataType:"json",
	 		        url: url,
	 		        success: function(data) {
	 		            console.log("response:" + data);
	 						
	 						var object=data.object;
	 						
	 		            for ( var i in object) {
                            $("#employee_code").val(object[i].emp_code);
                            $("#employee_name").val(object[i].first_name);
                            
	 		            	$("#employeecode").append('<b>EmployeeCode:'+object[i].emp_code.toUpperCase()+'</B>');
	 		            	$("#employeename").append('<b>EmployeeName:'+object[i].emp_name.toUpperCase()+'</B>');
	 		            	$("#designation").append('<b>Designation:'+object[i].designation.toUpperCase()+'</B>');
	 		            	$('#projectmanagername').append('<b>Approved By:'+object[i].manager_name.toUpperCase()+'</B>');
	 		            }
	 					},
	 					error : function(msg) {
	 					
	 					}
	 				});
	 		
//	 		var url = "rest/webservices/projectmanagername?first_name="+first_name;
//	 		$.ajax({
//	 		        type: "GET",
//	 		        dataType:"json",
//	 		        url: url,
//	 		        success: function(data) {
//	 		            console.log("response:" + data);
//	 						
//	 						var object=data.object;
//	 						
//	 		            for ( var i in object) {
//                            
//                            $("#projectmanagername").append('<b>'+object[i].first_name.toUpperCase()+'</B>');
//	 		            	
//	 		            }
//	 					},
//	 					error : function(msg) {
//	 					
//	 					}
//	 				});
//	 		
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
//	 			 		            alert(projectappend);
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
	
});
});
$().ready(function(event){

	
	$('#addrow').click(function() {
		
		
		$("#tbody").append('<tr id="'+rowcount+'" onclick="myFunction1(this)"><td><select id="mySelect" Style="height:27px;width:98%"  onchange="myFunction(this)"><option>Select</option>'+projectappend+'</select><td><td><input type="date" Style="height:27px;width:95%"  name="date"><td>'+activitycode+'<td><textarea name="workactivity" style="width:99%"></textarea><td><input   type="time" Style="height:27px;width:96%"  id="starttime'+rowcount+'"  oninput="myFunction6('+rowcount+')" name="starttime">'
				+'<td><input type="time" Style="height:27px;width:96%"  id="endtime'+rowcount+'"  oninput="myFunction7('+rowcount+')" name="endttime"><td><input type="hidden" id="hour'+rowcount+'" name="hour"><span id="hourlabel'+rowcount+'"></span> <td>Approved Pendding<td ><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction3('+rowcount+')" id="remove"/></td></tr>');	    
		rowcount=rowcount+1;
	});
});

function myFunction1(x) {
    row= x.rowIndex;
}
function myFunction2() {
	
//    alert(row);
    document.getElementById("myTable").deleteRow(row);
    call();
	// document.getElementById("passwordl").rows[row].remove;
}

function myFunction3(x) {
	
	var k='#'+x;
	   $(k).remove();
	   call();
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
	  	        success: function(data) {
	  	            console.log("response:" + data);
	  	         
	  					var object=data.object;
	  					 for ( var i in object) {
	  						 var id='<input type="hidden" value="'+object[i].project_code+'" name="project_code" >'+object[i].project_name;
	  						//myTable.rows[row].cells[2].innerHTML =object[i].mail ;
	  						 document.getElementById("myTable").rows[row].cells[1].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[2].innerHTML="";
//	  						 document.getElementById("myTable").rows[row].cells[3].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[4].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[5].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[6].innerHTML=id;
//	  						 document.getElementById("myTable").rows[row].cells[7].innerHTML=id;
	  						
	  						
	  						 document.getElementById("myTable").rows[row].cells[9].innerHTML=remove;
	  						 
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
		  change: function( event, ui ) {alert("starttime");}
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
//			    day_hours=day_hours+hours;
//			    day_minutes=day_minutes+minutes;
//			    if(day_minutes>=60)
//			    	{
//			    	day_minutes=day_minutes-60;
//			    	day_hours=day_hours+1;
//			    	}
		var total=(hours <= 9 ? "0" : "") + hours + ":" + (minutes <= 9 ? "0" : "") + minutes;

		
	    $("#hour"+row).val(total);
	    $("#hourlabel"+row+" label").remove();
	    $("#hourlabel"+row).append("<label>"+total+"</label>");
	    cal();
//	    $("#day_hours label").remove();
//	    $("#day_hours").append("<label>"+day_hours+":"+day_minutes+"</label>");
//	alert(day_hours+""+day_minutes);
			
			}else
				{
				alert("Time");
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
//			    day_hours=day_hours+hours;
//			    day_minutes=day_minutes+minutes;
//			    if(day_minutes>=60)
//			    	{
//			    	day_minutes=day_minutes-60;
//			    	day_hours=day_hours+1;
//			    	}
			    var total=(hours <= 9 ? "0" : "") + hours + ":" + (minutes <= 9 ? "0" : "") + minutes;

			    $("#hour"+row).val(total);
			    
			    $("#hourlabel"+row+" label").remove();
			    $("#hourlabel"+row).append("<label>"+total+"</label>");
			    cal();
//			    $("#day_hours label").remove();
//			    $("#day_hours").append("<label>"+day_hours+":"+day_minutes+"</label>");
//			
//				alert(day_hours+""+day_minutes);
			
		}else
			{
			alert("Time");
			}
	}

	}
	



$().ready(function(event){
	$("#save").click(function(){
var data = $("#form").serializeArray();
var url6="rest/webservices/timesheet";
	//data.push({ name: "customer_id", value: id6 });
	alert(url6);
	$.ajax({
		 url: url6,
		    type: 'POST',
		    data:data,
		    async:false,
	    success: function (data) {
	    	console.log("response:" + data);
	    	if(data.status==0){
		    	alert("Updated Sucess");
		    	}
	    	else{
		    		alert("failed");
		    		
		    	}
	    	
	
	    },error : function(msg) {
	        	event.preventDefault();
	    			console.log("User customer Details not found", msg);
	    				alert("Opps! Sorry Contact Person Update Fail");	
	    		}
	});
});
});




function cal()
{
	day_hours='00:00';
	
	var total=00;
	var time1=0;
	var time2=0; 
	var min1=0;
	var min2=00;
	var tmin=00;
		for(var i=1;i<=rowcount-1;i++)
	{
			
		
			
			alert( $("#hour"+i).val());
			 
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
		var totaltime=(time2 <= 9 ? "0" : "") + time2.toString() + ":" + (min2 <= 9 ? "0" : "") + min2.toString();

		alert(totaltime);
		
//		alert(day_hours);
		
		
		
	
	

}







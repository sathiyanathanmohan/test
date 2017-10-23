var activitycode='';
var activitycodetimesheet;
var rejected_reason=''; 
var rowcount=1;
var row;
var projectappend='';
var project_name9;
var approved='';
var emp_code='';
var designation='';
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
     emp_code=checkCookie2(decodeURIComponent(document.cookie));
     designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2==null){
		
		location.href='index.html'
	}
	else{
	
		 $('#welcomeuser').append("<b>Welcome "+user2.charAt(0).toUpperCase() + user2.slice(1)+" !!!</b>") ;
			
		 $('#approved_by').val(emp_code);
 
		if(designation=='admin')
			{
			var url = "rest/webservices/timesheetview?emp_code="+emp_code;

			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
							$("#selectcombo option").remove();
							$("#selectcombo")
							.append(' <option value=>Select</option><option value="all">Over All</option>');
			            for ( var i in object) {
			            	if(object[i].emp_code)
			            	{
			            	$("#selectcombo")
							.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].emp_name+'</option>');
			            	}
			            }
						},
						error : function(msg) {
						
						}
					});
			}
		else
			{
			 var url = "rest/webservices/emptimesheet?project_manager="+emp_code;

				$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url,
				        success: function(data) {
				            console.log("response:" + data);
								
								var object=data.object;
								$("#selectcombo option").remove();
								$("#selectcombo")
								.append(' <option value=>Select</option><option value="all">Over All</option>');
				            for ( var i in object) {

				            	$("#selectcombo")
								.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].emp_name+'</option>');
				            }
							},
							error : function(msg) {
							
							}
						});
			
			
			}

			
			
		 
	 		
	}
	});
});
	 		










$().ready(function(){
	$("#viewtimesheet").click(function(){
		var selectcombo=$('#selectcombo').val();
		var startdate=$('#startdate').val();
		var enddate=$('#enddate').val();
		if(selectcombo=='Select'||!selectcombo)
		{
		 alert('Select employeename');
		}
		else
			{
		if(!startdate)
			{
			 alert('Select startdate');
			}
		else
			{
			if(!enddate)
			{
				 alert('Select enddate');
			}
			else
				{
				
				if($("#selectcombo").val()=='all'){
					if(designation=='admin')
					{
						alert('inside alert');
						 var url = "rest/webservices/get_timesheetallviewadmin?project_manager="+emp_code+"&start_date="+$("#startdate").val()+"&end_date="+$("#enddate").val();

							$.ajax({
							        type: "GET",
							        dataType:"json",
							        url: url,
							        success: function(data) {
							            console.log("response:" + data);
											
											var object=data.object;
							            for ( var i in object) {
							            	var date6 = new Date(object[i].date);
							            	date6 = $.datepicker.formatDate('yy-mm-dd', date6);
							            	$("#tbody").append('<tr id="'+rowcount+'"><td>'+object[i].emp_code+'<td>'+object[i].emp_name+'<td>'+date6+'<td>'+object[i].day_hours+'<td>'+object[i].approved_status+'<td>'+object[i].project_manager+'<td><input type="Button" value="View" onclick="onclick1(\'' + object[i].emp_code + '\',\'' + object[i].date + '\');" ></tr>');	    
							        		rowcount=rowcount+1;
					
							            }
										},
										error : function(msg) {
											console.log("User timesheet Details not found", msg);
										}
									});
					}
					else
						{
					var url5 = "rest/webservices/get_timesheetallview?project_manager="+emp_code+"&start_date="+$("#startdate").val()+"&end_date="+$("#enddate").val();
					
					$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url5,
				        async:false,
				        success: function(data) {
				            console.log("response:" + data);
				            $("#tbody tr").remove();
							var object=data.object;
			            for ( var i in object) {      	
			            	var date6 = new Date(object[i].date);
			            	date6 = $.datepicker.formatDate('yy-mm-dd', date6);

		

			            		$("#tbody").append('<tr id="'+rowcount+'"><td>'+object[i].emp_code+'<td>'+object[i].emp_name+'<td>'+date6+'<td>'+object[i].day_hours+'<td>'+object[i].approved_status+'<td>'+object[i].project_manager+'<td><input type="Button" value="View" onclick="onclick1(\'' + object[i].emp_code + '\',\'' + object[i].date + '\');" ></tr>');	    
				        		rowcount=rowcount+1;
			            		
			            
			            }
							},
							error : function(msg) {
								console.log("User technology Details not found", msg);
							}
						});
				

						}}
				else{
					if(designation=='admin')
					{
						 var url = "rest/webservices/get_timesheetviewadmin?emp_code="+$("#selectcombo").val()+"&start_date="+$("#startdate").val()+"&end_date="+$("#enddate").val();

							$.ajax({
							        type: "GET",
							        dataType:"json",
							        url: url,
							        success: function(data) {
							            console.log("response:" + data);
											
											var object=data.object;
							            for ( var i in object) {
							            	var date6 = new Date(object[i].date);
							            	date6 = $.datepicker.formatDate('yy-mm-dd', date6);
							            	$("#tbody").append('<tr id="'+rowcount+'"><td>'+object[i].emp_code+'<td>'+object[i].emp_name+'<td>'+date6+'<td>'+object[i].day_hours+'<td>'+object[i].approved_status+'<td>'+object[i].project_manager+'<td><input type="Button" value="View" onclick="onclick1(\'' + object[i].emp_code + '\',\'' + object[i].date + '\');" ></tr>');	    
							        		rowcount=rowcount+1;
					
							            }
										},
										error : function(msg) {
											console.log("User timesheet Details not found", msg);
										}
									});
					}
					else
						{
						
					
		var url5 = "rest/webservices/get_timesheetview?emp_code="+$("#selectcombo").val()+"&start_date="+$("#startdate").val()+"&end_date="+$("#enddate").val();
			
			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url5,
			        async:false,
			        success: function(data) {
			            console.log("response:" + data);
			            $("#tbody tr").remove();
						var object=data.object;
		            for ( var i in object) {
		            	var e = new Date(object[i].date);
		            	var str1 = $.datepicker.formatDate('yy-mm-dd', e);
//		            	var url7= "rest/webservices/getprojectcodebased?project_code="+object[i].project_code;
		//
//				     	  	$.ajax({
//		  	        type: "GET",
//		  	        dataType:"json",
//		  	        url: url7,
//		  	      async:false,
//		  	        success: function(data) {
//		  	            console.log("response:" + data);
//		  	         
//		  					var object2=data.object;
//		  					
//		  					 for ( var i in object2) {
//		  						 
//		  					project_name9=object2[i].project_name;
//		  					 }
//		  	        },error : function(msg) {
//					console.log("User technology Details not found", msg);
//				}
		// });
			            	var e = new Date(object[i].date);
			            	var str1 = $.datepicker.formatDate('dd-mm-yy', e);
			            	
			            	var date6 = new Date(object[i].date);
			            	date6 = $.datepicker.formatDate('yy-mm-dd', date6);

			            					     	
			            	
//			       			     	
			            	
//			            		var timeString =object[i].start_time ;
//			            		var hourEnd = timeString.indexOf(":");
//			            		var H = +timeString.substr(0, hourEnd);
//			            		var h = H % 12 || 12;
//			            		var ampm = H < 12 ? "AM" : "PM";
//			            		timeString = h + timeString.substr(hourEnd, 3) + ampm;
//			            		var timeString1 =object[i].end_time ;
//			            		var hourEnd = timeString1.indexOf(":");
//			            		var H = +timeString1.substr(0, hourEnd);
//			            		var h = H % 12 || 12;
//			            		var ampm = H < 12 ? "AM" : "PM";
//			            		timeString1 = h + timeString1.substr(hourEnd, 3) + ampm;
		    		
			            		
			            		$("#tbody").append('<tr id="'+rowcount+'"><td>'+object[i].emp_code+'<td>'+object[i].emp_name+'<td>'+date6+'<td>'+object[i].day_hours+'<td>'+object[i].approved_status+'<td>'+object[i].project_manager+'<td><input type="Button" value="View" onclick="onclick1(\'' + object[i].emp_code + '\',\'' + object[i].date + '\');" ></tr>');	    
				        		rowcount=rowcount+1;
			            		
			            
			            }
			            
						},
						error : function(msg) {
							console.log("User technology Details not found", msg);
						}
					});
						}
			
				}
				}
			}
			}
		
		
	
		
		});
});






function onclick1(empcode,date) {
	var date4=date;
	
	 date4 = new Date(date4);
	 date4 = $.datepicker.formatDate('yy-mm-dd', date4);

	var project_name2;
	$().ready(function(){
var url5 = "rest/webservices/get_timesheet_one_emp?emp_code="+empcode+"&start_date="+date4;
	
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url5,
	        async:false,
	        success: function(data) {
	            console.log("response:" + data);
	            $("#viewtbody tr").remove();
					var object=data.object;
	            for ( var i in object) {
	                $("#emp_code1 h4").remove();
	                
	                $("#emp_code1").append('<h4>'+object[i].emp_code.toUpperCase()+'</h4>');
	                
	                $("#emp_name1 h4").remove();
	                $("#emp_name1").append('<h4> '+object[i].emp_name.toUpperCase()+'</h4>');
	                
	                
	                $("#day_hours1 h4").remove();
	                $("#day_hours1").append('<h4> '+object[i].day_hours+' Hr</h4>');
	                
	            	var e2 = new Date(object[i].date);
	            	var str2 = $.datepicker.formatDate('yy-mm-dd', e2);
	            	var url7= "rest/webservices/getprojectcodebased?project_code="+object[i].project_code;
                     var start_time2=object[i].start_time.split(":");
                     var end_time2=object[i].end_time.split(":");
                 	
                     if(start_time2[0]<12)
                    	 {
                    	 start_time2=object[i].start_time+" "+"AM";
                    	 }
                     else{
                    	 if(start_time2[0]==12){
                    		 
                    		 start_time2=object[i].start_time+" PM";
                    		 
                    	 }else{
                    	 start_time2=start_time2[0]-12+":"+start_time2[1]+" PM";
                    	 }
                     }
                     
                     if(end_time2[0]<12)
                	 {
                    	 end_time2=object[i].end_time+" "+"AM";
                	 }
                 else{
                	 if(end_time2[0]==12){
                		 
                		 end_time2=object[i].end_time+" "+"PM";
                		 
                	 }else{
                		 end_time2=end_time2[0]-12+":"+end_time2[1]+" PM";
                	 }
                 }
                  
			     	  	$.ajax({
	  	        type: "GET",
	  	        dataType:"json",
	  	        url: url7,
	  	      async:false,
	  	        success: function(data) {
	  	            console.log("response:" + data);
	  	         
	  					var object2=data.object;
	  					 for ( var i in object2) {
	  						project_name2=object2[i].project_name;
	  					 }
	  	        },error : function(msg) {
				console.log("User technology Details not found", msg);
			}
	 });
			     	  	
			     	  	
			     $("#viewtbody").append('<tr><td>'+object[i].sequnces_no+'<td>'+object[i].project_code+'<td>'+project_name2+'<td>'+object[i].acitivity+'<td>'+object[i].work_description+'<td>'+start_time2+'<td>'+
			    		 end_time2+'<td>'+object[i].total_hours+' Hr</tr>')	  	
			     	  	
			     	  	
	    
    
	            }
	        },error : function(msg) {
	        	console.log("failed to update");
    		}
    
    
	        });
	});
    
	modal.style.display = "block";
	
	
}






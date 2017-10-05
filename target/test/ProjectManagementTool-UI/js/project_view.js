/**
 * 
 */



var currentcenter;
	var projectcode="";
    var fileanme=""; 
	var row;
	var c;
	var t=1;
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2!=null){
		if(designation!='admin')
		{
		 location.href='timesheetedit.html';
		}
	else{	
   $('#welcomeuser').append("<b>Welcome "+user2+" !!!</b>") ;
//		 $('#welcomeuser').append("Welcome "+user2+" !!!") ;
		 
		 var m,n;	 
		 var	a ;
		 	 function getParams(){
		 		 var idx = document.URL.indexOf('?');
		 		 var params = new Array();
		 		 if (idx != -1) {
		 		 var pairs = document.URL.substring(idx+1, document.URL.length).split('&');
		 		 for (var i=0; i<pairs.length; i++){
		 		 nameVal = pairs[i].split('=');
		 		 params[nameVal[0]] = nameVal[1];
		 		 }
		 		 }
		 		 return params;
		 		 }
		 		 params = getParams();
		 	a= unescape(params["a"]);		 
		

		 var url = "rest/webservices/getproject?id="+a;

			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
			            for ( var i in object) {
			            	projectcode=object[i].project_code;
			            	$("#projectcode").val(object[i].project_code);
			            	$("#projectname").val(object[i].project_name);
		            call();
			             projectid=object[i].id;;
			            	var d = new Date(object[i].start_date);
			            	var str = $.datepicker.formatDate('yy-mm-dd', d);
			            	$("#startdate").val(str);
			            	var e = new Date(object[i].end_date);
			            	var str1 = $.datepicker.formatDate('yy-mm-dd', e);
			            	$("#enddate").val(str1);
			            	//	document.getElementById("startdate").value = object[i].start_date;
//			            	
			            	$("#pd").val(object[i].project_description);
			            	
			            	$("#center").val( object[i].center);   
//			            	ce=object[i].center;
			            	
			            		
			            	$("#location").val(object[i].location);
			            			            	$("#contracttype").val( object[i].contract_typeS);
			            	$("#projectstatus").val( object[i].project_status);
			            	
			            	$("#customerportfolio ").val( object[i].customer_portfolio);
			            	
			            	
                           if(object[i].customer_id!=''){
                        	   
                        	   var url = "rest/webservices/getallcontactperson?customer_id="+object[i].customer_id;
                       		//alert(url);
                       			$.ajax({
                       			        type: "GET",
                       			        dataType:"json",
                       			        url: url,
                       			        async:false,
                       			        success: function(data) {
                       			            console.log("response:" + data);
                       			            c='<select id="mySelect" onchange="myFunction(this)"> <option>Select</option>';
                       							var object=data.object;
                       						
                       							 for ( var i in object) {
                       				                    
                       				                   c=c+'<option value="'+object[i].id+'" >'+object[i].person_name+'</option>';
                       					            	
                       					          
                       					            }
                       							
                       							c=c+'</select>';
                       							
                       						},
                       					error : function(msg) {
                       							console.log("User customer Details not found", msg);
                       						}
                       					});
                        	   
                        	   
                        	   
                        	   
                        	   
                        	   
                        	   
                        	   var client='';
                        	   
			    			var url = "rest/webservices/getonecontact?id="+object[i].customer_id;
			    			$("#cc option").remove();
			    			$.ajax({
			    			        type: "GET",
			    			        dataType:"json",
			    			        url: url,
			    			        async:false,
			    			        success: function(data) {
			    			            console.log("response:" + data);
			    							
			    							var object8=data.object;
			    			            for ( var i in object) {
			    			            	
			    			            	client=object8[i].company_name;
			    			            	
			    			            	
			    			            	
			    			            	
			    			            }
			    						},
			    					error : function(msg) {
			    							console.log("User customer Details not found", msg);
			    						}
			    					});
			    			
			    			
			    			$("#cc").val(client);
			    			
			    			
			    			
			    			var url3 = "rest/webservices/get_allcontact_person_onproject?customer_id="+object[i].customer_id+"&project_id="+projectid;
			    		
			    			$.ajax({
			    			        type: "GET",
			    			        dataType:"json",
			    			        url: url3,
			    			        async:false,
			    			        success: function(data) {
			    			            console.log("response:" + data);
			    							
			    							var object=data.object;
			    			            for ( var i in object) {
			    			            	
			    			            	
			    			            	var url4 = "rest/webservices/getonecontactperson?id="+object[i].id;
			    			            	
			    			            	$.ajax({
						    			        type: "GET",
						    			        dataType:"json",
						    			        url: url4,
						    			        success: function(data) {
						    			            console.log("response:" + data);
						    			            
						    			            
						    							var object=data.object;
						    			            for ( var i in object) {
						    			            	
						    			            
						    			            	 var id3=object[i].person_name;
						    		  						//myTable.rows[row].cells[2].innerHTML =object[i].mail ;
						    		  				$("#tbody").append('<tr ><td>'+id3+'<td>'+object[i].mail+'<td>'+object[i].contact_no1+'<td>'+object[i].contact_no2+'</tr>');
						    			        t=t+1;
						    			          
						    			            }
						    						},
						    					error : function(msg) {
						    							console.log("User customer Details not found", msg);
						    						}
						    					});
			    			            	
			    			            	
			    			            	
			    			            	
			    			            	         
			    			            	
			    			            }
			    						},
			    					error : function(msg) {
			    							console.log("User customer Details not found", msg);
			    						}
			    					});
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			    			
			            
			            }
			            	$("#services ").val( object[i].services_offered);
			            	//alert( object[i].onsite_cooedinator+" "+object[i].delivery_manger);
			            	
			            	$("#tech").val(object[i].technology);
			            	
			            	$("#effortrequired").val(object[i].total_effort);
			            	$("#contracttype").val(object[i].contract_type);
			            	$("#onsite").val(object[i].onsite_effort);
			            	$("#offshore").val(object[i].offshore_effort);

			            
			            	if(object[i].filename!=null){
			            	
			            	$("#filename").append("<h5 id='fileview'  onclick='myFunction6()'>"+object[i].filename+" </h5><img id='delete' src='ProjectManagementTool-UI/css/images1/close.jpg' Style='width:10px;height:10px' onclick='myFunction11(\""+object[i].filename+ "\")' id='remove'/>");

			            	 filename=object[i].filename;
			            	}
			            	$("#filedescr").val('');
			            	
			            	$("#filedescr").val(object[i].filedescription);
			            	
			            	
			            	
			            	if(object[i].project_manager!=null){
			            		
			            		var url2 = "rest/webservices/getemployee?emp_code="+object[i].project_manager;

								$.ajax({
								
								        type: "GET",
								        dataType:"json",
								        url: url2,
								        async:false,
								        success: function(data) {
								            console.log("response:" + data);
								           
												var object1=data.object;
												
								            for ( var i in object1) {
								            	var name= object1[i].first_name;
								            	        	$("#projectmanager").val( object1[i].emp_code+"("+ object1[i].first_name+")");
								            }
											},
											error : function(msg) {
												console.log(" emp_code not found", msg);
											}
										});
					
			            	
			            	
			            	}
			            	
			            	
			            	if(object[i].delivery_manger!=null){
			            		var url2 = "rest/webservices/getemployee?emp_code="+object[i].delivery_manger;

								$.ajax({
								
								        type: "GET",
								        dataType:"json",
								        url: url2,
								        async:false,
								        success: function(data) {
								            console.log("response:" + data);
								           
												var object1=data.object;
												
								            for ( var i in object1) {
								            	var name= object1[i].first_name;
								            	
								            	$("#deliverymanager").val(object1[i].emp_code+"("+ object1[i].first_name+")");
								            }
											},
											error : function(msg) {
												console.log(" emp_code not found", msg);
											}
										});
			            	
			            	}
			            	if(object[i].onsite_cooedinator!=null){
			            		
			            		var url2 = "rest/webservices/getemployee?emp_code="+object[i].onsite_cooedinator;
			            		$.ajax({
									
							        type: "GET",
							        dataType:"json",
							        url: url2,
							        async:false,
							        success: function(data) {
							            console.log("response:" + data);
							           
											var object1=data.object;
											
							            for ( var i in object1) {
							            	
							            		
							            	$("#onsitecoordinator").val(object1[i].emp_code+"("+ object1[i].first_name+")");
							            }
										},
										error : function(msg) {
											console.log(" emp_code not found", msg);
										}
									});
			            	}
			            	
                          $("#pm").val(object[i].manager_remark);
                          $("#general").val(object[i].general_remark);
			            	
			            	}
						},
						error : function(msg) {
							console.log("User servicesoffered Details not found", msg);
						}
					});
			
			 var url = "rest/webservices/get_all_file_name?projectid="+a;
var filecount=1;
				$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url,
				        async:false,
				        success: function(data) {
				            console.log("response:" + data);
				            var object=data.object;
				        	$("#filetbody tr").remove();	
				            for ( var i in object) {
				            	
				            
				            	$("#filetbody").append("<tr><td>"+filecount+"<td ><h5 style='cursor:pointer;color:#0e04c6'  onclick='myFunction6(\""+object[i].filename+ "\")'>"+object[i].filename+"</h5></tr>");
				           
				            
				            	filecount=filecount+1;
				            
				            }  
				            
				            
				        },error : function(msg) {
							console.log("User file Details not found", msg);
						}
				});
	}
	}
	else{
		window.location.href='index.html';
	}

	
});
		
});

function call()
{
	
	var man_name="";
 	var url1 = "rest/webservices/allallocation?project_code="+projectcode;
 	
$.ajax({
    type: "GET",
    dataType:"json",
    url: url1,
    success: function(data) {
        console.log("response:" + data);					
			var object1=data.object;
			  
        for ( var i in object1) {	          
if(object1[i].project_manager!=null){
        		
        		var url2 = "rest/webservices/getemployee?emp_code="+object1[i].project_manager;

				$.ajax({
				
				        type: "GET",
				        dataType:"json",
				        url: url2,
				        async:false,
				        success: function(data) {
				            console.log("response:" + data);
				           
								var object4=data.object;
								
				            for ( var i in object4) {
				            	man_name= object4[i].first_name;
				            	
				            	        	
				            }
							},
							error : function(msg) {
								console.log(" emp_code not found", msg);
							}
						});
	
        	
        	
        	}

          $("#tbody1").append('<tr align="center"><td >'+object1[i].emp_code+'</a></td><td>'+object1[i].emp_name+'</td><td>'+object1[i].location+'</td><td>'+object1[i].percentage_allocation+'</td><td>'+object1[i].start_date+'</td><td>'+object1[i].end_date+'</td><td>'+man_name+'</tr>');	           
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        }
        $('#example').DataTable();
		},
		error : function(msg) {
			console.log(" project_code not found", msg);
		}
 	});
	}




var modal=document.getElementById("myModal");

function onclick1() {


	modal.style.display = "block";
	
	
}
function myFunction6(filename){
//	alert(filename);
var download="DownloadServlet?projectid="+projectid+"&filename="+filename;
window.location.assign(download);

}


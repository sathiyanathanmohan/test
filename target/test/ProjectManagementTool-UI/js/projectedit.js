var valid1=0;
var valid2=0;
var valid3=0;
var valid4=0;
var valid5=0;
var currentcenter;
	var projectid="";
    var fileanme=""; 
	var row;
	var c;
	var t=1;
	var rowcount=1;
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
var login_emp_code=checkCookie2(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2!=null){
		if(designation!='project_manager'&&designation!='admin')
		{
		 location.href='timesheetedit.html';
		}
	else{	
   $('#welcomeuser').append("<b>Welcome "+user2+" !!!</b>") ;
   
   $('#emp_code').val(login_emp_code);
   
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
			            	document.getElementById("id").value = object[i].id;
			            	$("#projectcode").val(object[i].project_code);
			            	$("#projectname").val(object[i].project_name);
		            //
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
			            	$("#center option").remove();
			            	$("#center").append("<option id='cen' value="+object[i].center+">"+ object[i].center+"</option>");   
//			            	ce=object[i].center;
			            	currentcenter=object[i].center;
			            	$("#location option").remove();	
			            	$("#location").append("<option id='loca' value="+object[i].location+">"+ object[i].location+"</option>");
			            	$("#contracttype option").remove();	
			            	$("#contracttype").append("<option id='contrac' value="+object[i].contract_type+" >"+ object[i].contract_type+"</option>");
			            	$("#projectstatus option").remove();	
			            	$("#projectstatus").append("<option id='projectstat' value="+object[i].project_status+ ">"+ object[i].project_status+"</option>");
			            	
			            	$("#customerportfolio option").remove();	
			            	$("#customerportfolio ").append("<option  id='customerport' value="+object[i].customer_portfolio+">"+ object[i].customer_portfolio+"</option>");
			            	
			            	
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
                        	   
                        	   
                        	   
                        	   
                        	   
                        	   
                        	   
                        	   
                        	   
			    			var url = "rest/webservices/getonecontact?id="+object[i].customer_id;
			    			$("#cc option").remove();
			    			$.ajax({
			    			        type: "GET",
			    			        dataType:"json",
			    			        url: url,
			    			        async:false,
			    			        success: function(data) {
			    			            console.log("response:" + data);
			    							
			    							var object=data.object;
			    			            for ( var i in object) {
			    			            	
			    			            	$("#cc").append('<option value='+object[i].id+'>'+object[i].customer_code+'</option>');
			    			            	
			    			            	
			    			            	
			    			            	
			    			            }
			    						},
			    					error : function(msg) {
			    							console.log("User customer Details not found", msg);
			    						}
			    					});
			    			
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
						    			            	
						    			            
						    			            	 var remove1='<img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2('+t+')" />';
						    			            	 var id3='<input type="hidden" value="'+object[i].id+'" name="person_id" id="id">'+object[i].person_name;
						    		  						//myTable.rows[row].cells[2].innerHTML =object[i].mail ;
						    		  				$("#tbody").append('<tr id="remove'+t+'"  onclick="myFunction1(this)"><td>'+c+'<td>'+id3+'<td>'+object[i].mail+'<td>'+object[i].contact_no1+'<td>'+object[i].contact_no2+'<td>'+remove1+'</tr>');
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
			            	$("#services option").remove();	
			            	$("#services ").append("<option id='serv' value="+object[i].services_offered+">"+ object[i].services_offered+"</option>");
			            	//alert( object[i].onsite_cooedinator+" "+object[i].delivery_manger);
			            	
			            	$("#tech").val(object[i].technology);
			            	
			            	$("#effortrequired").val(object[i].total_effort);
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
								            	$("#projectmanager option").remove();	
								            	$("#projectmanager").append("<option id='projectman' value="+ object1[i].emp_code+">"+object1[i].emp_code+"-"+ object1[i].first_name+"</option>");
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
								            	$("#deliverymanager option").remove();	
								            	$("#deliverymanager").append("<option id='deliveryman' value="+ object1[i].emp_code+">"+object1[i].emp_code+"-"+ object1[i].first_name+"</option>");
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
							            	
							            	$("#onsitecoordinator option").remove();	
							            	$("#onsitecoordinator").append("<option id='onsitecoordin' value="+ object1[i].emp_code+">"+object1[i].emp_code+"-"+ object1[i].first_name+"</option>");
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
				            	
				            
				            	$("#filetbody").append("<tr><td ><h5 style='cursor:pointer;color:#0e04c6'  onclick='myFunction6(\""+object[i].filename+ "\")'>"+object[i].filename+"</h5><td Style='margin-left:100px'> <img src='ProjectManagementTool-UI/css/images1/close.jpg' Style='width:10px;height:10px' onclick='myFunction11(\""+object[i].filename+ "\")'></td></tr>");
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

var center1=0;
var location1=0;
var contract1=0;
var status1=0;
var customer1=0;
var customer_port1=0;
var services1=0;
var technology1=0;
var project_manager1=0;
var delivery_manager1=0;
var coordinator1=0;
var customer1=0;
var status1=0;
$().ready(function(){
	
	

	$("#cc").click(function(){
		
		if(customer1==0){	
			var ce1=$("#cc").val();

			var url = "rest/webservices/getallcustomer";

			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
			            for ( var i in object) {
                            if(ce1!=object[i].id){
			            	$("#cc")
			            	.append(' <option value='+object[i].id+'>'+object[i].customer_code+'</option>');	           
                            }
                            }
						},
					error : function(msg) {
							console.log("User customer Details not found", msg);
						}
					});
			
			
			
			
		customer1=1;
		}
	});
	
	
	
	
	$("#center").click(function(){
		
		if(center1==0){	
			var ce=$("#cen").val();
		var url = "rest/webservices/getmasterdetails?category=center";

		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);
						
						var object=data.object;
						//$("#center option").remove();
					//	$("#center").append(' <option>selcet</option>');
		            for ( var i in object) {
		            	if(object[i].item!=ce){

		            	$("#center").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');	
		            	}
		            	}
					},
					error : function(msg) {
						console.log("User center Details not found", msg);
					}
				});
		center1=1;
		}
	});
	
	
	$("#projectstatus").click(function(){
		
		if(status1==0){	
		var projectstat=$("#projectstat").val();	
		var url = "rest/webservices/getmasterdetails?category=status";
//alert(url);
		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);
						
						var object=data.object;
						//$("#projectstatus option").remove();
						//$("#projectstatus").append(' <option>selcet</option>');
		            for ( var i in object) {
                       if(object[i].item!=projectstat){
		            	$("#projectstatus").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');	
                       }
		            	}
					},
					error : function(msg) {
						console.log("User projectstatus Details not found", msg);
					}
				});
		status1=1;
		}
	});
	
		$("#location").click(function(){
			
		
if(location1==0)
	{
	var url = "rest/webservices/getmasterdetails?category=location";
//alert(currentcenter);
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
	            $("#location option").remove();
	            $("#location").append(' <option value="">Select</option>');	           
            	
					var object=data.object;
	            for ( var i in object) {
	            	if (object[i].item_descrption==currentcenter){
	            	$("#location").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
	            	}
	            	}
				},
				error : function(msg) {
					console.log("User location Details not found", msg);
				}
			});
	location1=1;
	
	}
		});
		
			
			$("#contracttype").click(function(){
				
				var url = "rest/webservices/getmasterdetails?category=contract_type";
if(contract1==0)
	{
	var contrac=$("#contrac").val();
				$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url,
				        success: function(data) {
				            console.log("response:" + data);
								
								var object=data.object;
								
							
				            for ( var i in object) {
                                 if(object[i].item!=contrac){ 
				            	$("#contracttype").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
                                 }
				            	}
							},
							error : function(msg) {
								console.log("contracttype Details not found", msg);
							}
						});
				contract1=1;
	}
			});
			
	

			$("#customerportfolio").click(function(){
				
			
if(customer_port1==0)
	{
				var customerport=$("#customerport").val();
				var url = "rest/webservices/getmasterdetails?category=customer_portfolio";
				
				$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url,
				        success: function(data) {
				            console.log("response:" + data);
								
								var object=data.object;
				            for ( var i in object) {
				            	 if(object[i].item!=customerport){ 
				            	$("#customerportfolio")
								.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
				            }
				            }
							},
							error : function(msg) {
								console.log("User customerportfolio Details not found", msg);
							}
						});
				
				
				customer_port1=1;
	}
			});
			
			
			
$("#services").click(function(){
				
				var url = "rest/webservices/getmasterdetails?category=services_offered";
if(services1==0)
	{
	var serv=$("#serv").val();
				$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url,
				        success: function(data) {
				            console.log("response:" + data);
								
								var object=data.object;
								
				            for ( var i in object) {
                                if(serv!=object[i].item)
				            	$("#services").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');	         
				            	}
							},
							error : function(msg) {
								console.log("services offered Details not found", msg);
							}
						});
				services1=1;
	}
			});
			
			




$("#technology").click(function(){
	
	var url = "rest/webservices/getmasterdetails?category=technology";
if(technology1==0)
{
	 $('#tech').text(''); 
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					$("#technology option").remove();
					$("#technology").append(' <option>selcet</option>');
	            for ( var i in object) {

	            	$("#technology").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');	         
	            	}
			},
				error : function(msg) {
					console.log("technology  Details not found", msg);
				}
			});
	technology1=1;
}
});



$("#projectmanager").click(function(){
	
	var url = "rest/webservices/getallemployee?designation=project_manager";
if(project_manager1==0)
{
	var projectman=$("#projectman").val();
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					
	            for ( var i in object) {
                   
	            	$("#projectmanager").append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');	         
	            	}
				},
				error : function(msg) {
					console.log("projectmanager  Details not found", msg);
				}
			});
	project_manager1=1;
}
});



$("#deliverymanager").click(function(){
	
	var url = "rest/webservices/getallemployee?designation=delivery_manager";
if(delivery_manager1==0)
{
	var deliveryman=$("#deliveryman").val();
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					
	            for ( var i in object) {
                    
	            	$("#deliverymanager").append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');	         
	            	}
				},
				error : function(msg) {
					console.log("deliverymanager  Details not found", msg);
				}
			});
	delivery_manager1=1;
}
});


$("#onsitecoordinator").click(function(){
	
	
	var url = "rest/webservices/getallemployee?designation=onsite_coordinator";
	
if(coordinator1==0)
{
	var onsitecoordin=$("#onsitecoordin").val();
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					
	            for ( var i in object) {
                      
	            	$("#onsitecoordinator").append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');	         
	            	}
				},
				error : function(msg) {
					console.log("onsitecoordinator  Details not found", msg);
				}
			});
	coordinator1=1;
}
});


			
	});	
	
	
	
$().ready(function(){
	$('#center').change(function() {
		var centerchange=$("#center").val();
	//	alert(centerchange);
		if(centerchange=="Onsite"){
			
			var url = "rest/webservices/getmasterdetails?category=location";

			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
			            $("#location option").remove();
			            $("#location").append(' <option value="">Select</option>');	           
		            	
							var object=data.object;
			            for ( var i in object) {
			            	if (object[i].item_descrption==centerchange){
			            	$("#location").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
			            	}
			            	}
						},
						error : function(msg) {
							console.log("User location Details not found", msg);
						}
					});
		}
	if(centerchange=="Offshore"){

		var url = "rest/webservices/getmasterdetails?category=location";

		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);
		            $("#location option").remove();
		            $("#location").append(' <option value="">Select</option>');	           
	            	
						var object=data.object;
		            for ( var i in object) {
		            	if (object[i].item_descrption==centerchange){
		            	$("#location").append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
		            	}
		            	}
					},
					error : function(msg) {
						console.log("User location Details not found", msg);
					}
				});
			
		}
	if(centerchange=="Both"){
		
		var url = "rest/webservices/getmasterdetails?category=location";

		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);
		            $("#location option").remove();
		            $("#location").append(' <option value="">Select</option>');	           
	            	
						var object=data.object;
		            for ( var i in object) {

		            	$("#location")
		            	.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');	           
		            	}
					},
					error : function(msg) {
						console.log("User location Details not found", msg);
					}
				});
	}
		
		
	});
	});



	
var tech1;
var tech2=0;
$().ready(function(){
	$("#technology").change(function(event){
		 
		 tech2=1;
	if($(this).find('option:selected').hasClass('actived')){		
	    alert('already selected');
	}
	    else{
	    	  $(this).find('option:selected').addClass('actived');
	    	  if( $("#tech").val()==' '){	       
	    		  tech1 =  $(this).val();
	           $("#tech").val(tech1);
	   	 }else
	   		 {
	   		tech1= $('#tech').val()+","+$(this).val();
	   	
	   		  $('#tech').val(tech1);
	   		 }
	    	  
	    }
	 

	 });


	    });
	
	
	
	
$().ready(function(){
	
	
	$("#cancel").click(function (){
		go();
	
	});

	
});



$().ready(function(){
	$("#projectcode").keyup(function(event){
		var projectcode=$('#projectcode').val();
		   if(projectcode=='')
		   {
			   $('#epc').css('display','block');
		   }
		   else
		   {
			   $('#epc').css('display','none');
		   }
			});
	$("#projectname").keyup(function(event){
		var projectname=$('#projectname').val();
			if(projectname=='')
			{
				$('#epn').css('display','block');
			}
			else
			{
				$('#epn').css('display','none');
			}
	
		});
	 
	 $("#contracttype").change(function(event){
		 var con=$('#contracttype').val();
			
			if(con=='Select')
			{
			$('#ect').css('display','block');
			}
			else
				{
			 $('#ect').css('display','none');
				}
			});
	 
	 $("#startdate").change(function(event){var rowcount=1;
	 var msgstart='';
	 var msgend='';
	 valid1=0;
	 valid2=0;
	 var msgeffort='';
	 var msgon='';
	 var msgoff='';
 valid3=0;
 valid4=0;
 valid5=0;
	 var sum=0;
	 var start=$('#startdate').val();
	 var date1=new Date($('#startdate').val());//startdate
	 var str = $.datepicker.formatDate('yy-mm-dd',date1);//start date
	 var date2=new Date();
	  var enddate=$('#enddate').val();
	 var str1=$.datepicker.formatDate('mm',date2);//current date
	 var str4=$.datepicker.formatDate('yy-mm-dd',date2);
	 var str2=$.datepicker.formatDate('mm',date1);//split date
	 var end=new Date($('#enddate').val());
	 var str3=$.datepicker.formatDate('yy-mm-dd',end);//end date
		 var start=$('#startdate').val();
		 if(!start)
			{
			valid1=0;
			msgstart='Select start date';
			$('#esd').text(msgstart);
			$('#esd').css('display','block');
			}	
			
		 
		else if(str2<str1)
		{
			
			valid1=0;
			msgstart='Start date not to be a past date';
			$('#esd').text(msgstart);
			$('#esd').css('display','block');
			
			}
		else if(str2>=str1)
			{
			valid1=1;
			$('#esd').css('display','none');
			}
	 });
	 $("#enddate").change(function(event){var rowcount=1;
	 var msgstart='';
	 var msgend='';
	 valid1=0;
	 valid2=0;
	 var msgeffort='';
	 var msgon='';
	 var msgoff='';
 valid3=0;
 valid4=0;
valid5=0;
	 var sum=0;
	 var start=$('#startdate').val();
	 var date1=new Date($('#startdate').val());//startdate
	 var str = $.datepicker.formatDate('yy-mm-dd',date1);//start date
	 var date2=new Date();
	  var enddate=$('#enddate').val();
	 var str1=$.datepicker.formatDate('mm',date2);//current date
	 var str4=$.datepicker.formatDate('yy-mm-dd',date2);
	 var str2=$.datepicker.formatDate('mm',date1);//split date
	 var end=new Date($('#enddate').val());
	 var str3=$.datepicker.formatDate('yy-mm-dd',end);//end date
		 var start=$('#enddate').val();
			
			
		 if(!enddate)
		 {
		 valid2=0;
		 msgend='Select end date';
		 $('#eed').text(msgend);
		 $('#eed').css('display','block');
		 }
		 else  if(str3>=str4&&str3>str)
		 	{
		 	valid2=1;
		 	$('#eed').css('display','none');
		 	
		 	}

		 else if(str3<str4)
		 {
		 	valid2=0;
		 	msgend='End date not to be a past date or current date';
		 	$('#eed').text(msgend);
		 	$('#eed').css('display','block');
		 	
		 	}
		 else{
		 	valid2=0;
		 	msgend='End date must be greater than start date';
		 	$('#eed').text(msgend);
		 	$('#eed').css('display','block');
		 }

			});
	 
	 $("#projectstatus").change(function(event){
		 var projectstatus=$('#projectstatus').val();
		
		 if(projectstatus!='Open')
		 {
			
		  $('#eps').css('display','block');
         }
		 else
		 {
		 $('#eps').css('display','none');
		 }
	 });
	 
	 $("#customerportfolio").change(function(event){
		 var cus=$('#customerportfolio').val();
		 if(cus=='Select')
		 {
		  $('#ecp').css('display','block');

		 }
		 else
		 {
		 $('#ecp').css('display','none');
		 }
	 });
	 $("#services").change(function(event){
		 var service=$('#services').val();
		 if(service=='Select')
		 {
		  $('#eso').css('display','block');

		 }
		 else
		 {
		 $('#eso').css('display','none');
		 }
	 });
	 $("#technology").change(function(event){
		 var technology=$('#technology').val();
		 if(technology=='Select')
		 {
		  $('#et').css('display','block');

		 }
		 else
		 {
		 $('#et').css('display','none');
		 }
	 });
	 $("#effortrequired").keyup(function(event){
		 var effortrequired=$('#effortrequired').val();
		 if(effortrequired=='')
		 {
		  $('#er').css('display','block');

		 }
		 else
		 {
		 $('#er').css('display','none');
		 }
	 });
	 $("#effortrequired").keyup(function(event){
		 var effortrequired=$('#effortrequired').val();
		 if(effortrequired=='')
		 {
		 	msgeffort='Enter effort required';
		 	$('#er').text(msgeffort);
		 	$('#er').css('display','block');
		 	valid3=0;
		 }
		 else if(!$.isNumeric(effortrequired))
		 {
		 	msgeffort='Effort must be numeric';
		 	$('#er').text(msgeffort);
		 	$('#er').css('display','block');
		 	valid3=0;
		 	}
		 else
		 {
		 	if(valid4==1&&valid5==1){
		 		sum=parseInt(onsite)+parseInt(offshore);
//		 		alert('sum'+sum);
		 		v1=parseInt(effortrequired);
		 		if(sum>v1||sum<v1)
		 			{
		 			msgeffort='Effort must equal the sum of onsite and offshore';
		 			$('#er').text(msgeffort);
		 			$('#er').css('display','block');
		 			}
		 		else if(sum==v1)
		 			{
		 			$('#er').css('display','none');
		 			valid3=1;
		 			}
		 	}
		 	
		 }
	 });
	 $("#onsite").keyup(function(event){
		 var onsite=$('#onsite').val();
		 if(onsite=='')
		 {
		 msgon='Enter onsite effort';
		 $('#eon').text(msgon);
		 $('#eon').css('display','block');
		 valid4=0;
		 }
		 else if(!$.isNumeric(onsite))
		 	{
		 	msgon='Onsite  must be numeric';
		 	$('#eon').text(msgon);
		 	$('#eon').css('display','block');
		 	valid4=0;
		 	}
		 else
		 {
		 	valid4=1;
		 	$('#eon').css('display','none');
		 }
	 });
	 $("#offshore").keyup(function(event){
		 var offshore=$('#offshore').val();
		 if(offshore=='')
		 {
		 	valid5=0;
		 	msgoff='Enter offshore effort';
		 	$('eoff').text(msgoff);
		 	$('#eoff').css('display','block');
		 }
		 else if(!$.isNumeric(offshore))
		 	{
		 	msgoff='Offshore  must be numeric';
		 	$('#eoff').text(msgoff);
		 	$('#eoff').css('display','block');
		 	valid5=0;
		 	}

		 else
		 {
		 	valid5=1;
		 	$('#eoff').css('display','none');
		 }
	 });
	 
	 $("#projectmanager").change(function(event){
		   var projectmanager=$('#projectmanager').val();
		   if(projectmanager=='Select')
		   {
		    $('#epm').css('display','block');

		   }
		   else
		   {
		   $('#epm').css('display','none');
		   }
	 });
	 $("#deliverymanager").change(function(event){
		   var deliverymanager=$('#deliverymanager').val();
		   if(deliverymanager=='Select')
		   {
		    $('#edm').css('display','block');

		   }
		   else
		   {
		   $('#edm').css('display','none');
		   }
		   
	 });
	 
	
	 
});






$().ready(function(){
	
	
	var msgstart='';
	var msgend='';
	 valid1=0;
 valid2=0;
	var msgeffort='';
	var msgon='';
	var msgoff='';
valid3=0;
 valid4=0;
valid5=0;
	var sum=0;
$("#save").click(function (event){

		var center=$('#center').val();
	var location=$('#location').val();
	var con=$('#contracttype').val();
	var projectstatus=$('#projectstatus').val();
    var cus=$('#customerportfolio').val();
   var service=$('#services').val();
  var technology=$('#technology').val();
  var projectmanager=$('#projectmanager').val();
   var deliverymanager=$('#deliverymanager').val();
   var onsitecoordinator=$('#onsitecoordinator').val();
if(center=='Select')
	{
	 $('#ec').css('display','block');
	
	}
else
	{
	$('#ec').css('display','none');
	}
if(location=='Select')
{
 $('#el').css('display','block');

}
else
{
$('#el').css('display','none');
}
if(con=='Select')
{
 $('#ect').css('display','block');

}
else
{
$('#ect').css('display','none');
}
//if(projectstatus!='open')
//{
// $('#eps').css('display','block');
//
//}
//else
//{
//$('#eps').css('display','none');
//}
if(cus=='Select')
{
 $('#ecp').css('display','block');

}
else
{
$('#ecp').css('display','none');
}
if(service=='Select')
{
 $('#eso').css('display','block');

}
else
{
$('#eso').css('display','none');
}
//if(technology=='Select')
//{
// $('#et').css('display','block');
//
//}
//else
//{
//$('#et').css('display','none');
//}
if(projectmanager=='Select')
{
 $('#epm').css('display','block');

}
else
{
$('#epm').css('display','none');
}
if(deliverymanager=='Select')
{
 $('#edm').css('display','block');

}
else
{
$('#edm').css('display','none');
}
if(onsitecoordinator=='Select')
{
 $('#eoc').css('display','block');

}
else
{
$('#eoc').css('display','none');
}
var start=$('#startdate').val();
var date1=new Date($('#startdate').val());//startdate
var str = $.datepicker.formatDate('yy-mm-dd',date1);//start date
var date2=new Date();
 var enddate=$('#enddate').val();
var str1=$.datepicker.formatDate('mm',date2);//current date
var str4=$.datepicker.formatDate('yy-mm-dd',date2);
var str2=$.datepicker.formatDate('mm',date1);//split date
var end=new Date($('#enddate').val());
var str3=$.datepicker.formatDate('yy-mm-dd',end);//end date
if(str2>=str1)
	{
	valid1=1;
	$('#esd').css('display','none');
	}
//else if(str2<str1)
//{
//	valid1=0;
//	msgstart='Start date not be a past date';
//	$('#esd').text(msgstart);
//	$('#esd').css('display','block');
//	
//	}
else if(start=='')
	{
	valid1=0;
	msgstart='Select start date';
	$('#esd').text(msgstart);
	$('#esd').css('display','block');
	}
if(enddate=='')
{
valid2=0;
msgend='Select end date';
$('#eed').text(msgend);
$('#eed').css('display','block');
}
else  if(str3>=str4&&str3>str)
	{
	valid2=1;
	$('#eed').css('display','none');
	
	}

else if(str3<str4)
{
	valid2=0;
	msgend='End date not to be a past date or current date';
	$('#eed').text(msgend);
	$('#eed').css('display','block');
	
	}
else{
	valid2=0;
	msgend='End date must be greater than start date';
	$('#eed').text(msgend);
	$('#eed').css('display','block');
}


var projectcode=$('#projectcode').val();
var projectname=$('#projectname').val();
var effortrequired=$('#effortrequired').val();
var onsite=$('#onsite').val();
var offshore=$('#offshore').val();
if(projectcode=='')
{
$('#epc').css('display','block');
}
else
	{
 $('#epc').css('display','none');
	}
if(projectname=='')
{
$('#epn').css('display','block');
}
else
	{
 $('#epn').css('display','none');
	}

if(onsite=='')
{
msgon='Enter onsite effort';
$('#eon').text(msgon);
$('#eon').css('display','block');
valid4=0;
}
else if(!$.isNumeric(onsite))
	{
	msgon='Onsite  must be numeric';
	$('#eon').text(msgon);
	$('#eon').css('display','block');
	valid4=0;
	}
else
{
	valid4=1;
	$('#eon').css('display','none');
}
if(offshore=='')
{
	valid5=0;
	msgoff='Enter offshore effort';
	$('eoff').text(msgoff);
	$('#eoff').css('display','block');
}
else if(!$.isNumeric(offshore))
	{
	msgoff='Offshore  must be numeric';
	$('#eoff').text(msgoff);
	$('#eoff').css('display','block');
	valid5=0;
	}

else
{
	valid5=1;
	$('#eoff').css('display','none');
}
if(effortrequired=='')
{
	msgeffort='Enter effort required';
	$('#er').text(msgeffort);
	$('#er').css('display','block');
	valid3=0;
}
else if(!$.isNumeric(effortrequired))
{
	msgeffort='Effort must be numeric';
	$('#er').text(msgeffort);
	$('#er').css('display','block');
	valid3=0;
	}
else
{
	if(valid4==1&&valid5==1){
		sum=parseInt(onsite)+parseInt(offshore);
//		alert('sum'+sum);
		v1=parseInt(effortrequired);
		if(sum>v1||sum<v1)
			{
			msgeffort='Effort must equal the sum of onsite and offshore';
			$('#er').text(msgeffort);
			$('#er').css('display','block');
			}
		else if(sum==v1)
			{
			$('#er').css('display','none');
			valid3=1;
			}
	}
	
}

if(projectcode!==''&&projectname!==''&&center!=''&&location!=''&&contracttype!=''&&customerportfolio!=''&&services!=''&&projectmanager!='Select'&&deliverymanager!='Select'&&onsitecoordinator!='Select'&&valid2==1&&valid3==1&&valid4==1&&valid5==1)
{
//var myform = document.getElementById("form");
	var url = "rest/webservices/editproject";
var data = $("#form").serialize();
$.ajax({
	url: url,
    type: 'POST',
    data:data,
    async:false,
    success: function (data) {
       
    	console.log("response:" + data.id);
    	
    	
    	
    	
    	var id11=data.id;
    	if(data.status==0){
    		
    	
    	    var contact_id=$("#cc").val();
     		
 			var data=$("#form").serializeArray();
 			data.push({ name: "project_id", value: projectid });
 			data.push({name:"contact_id",value:contact_id});
 			var url = "rest/webservices/contactpersonreupdate";
 			$.ajax({
 			        type: "POST",
 			        dataType:"json",
 			        data:data,
 			        url: url,
 			      
 			        success: function(data) {
 			            console.log("response:" + data);
 			      
 							var object=data.object;
 						
 			           
 	                    if(object.status==0){
 	                    	
 	                    	
 	                 
 	                       	     }else{
 	                       	    	 alert("Opps! Sorry Contact Person Update Fail");
 	                       	     }
 						},
 					error : function(msg) {
 							console.log("User customer Details not found", msg);
 							alert("Opps! Sorry Contact Person Update Fail");	
 					}
 						
 					});
 		
    		
    	
 			
    		if($("#file").val()!=""){
    	
    			
    
    		var file=$("#file").val();
     		
     		
    		$('input[name="file"]').each(function(index, value) 
	                { 
	                    var file = value.files[0];
	                    if(file) 
	                    {
	                        var formData = new FormData();
	                        formData.append('file', file);
	                        formData.append('id',projectid);
	                        var thefile = document.getElementById('file');
	                        formData.append('filename',file.name);
	                                  //  alert( thefile.files.item(0).name);
	                        $.ajax({
	                          url: 'rest/webservices/filechange',
	                          type : 'POST',
	                          data : formData,
	                          cache : false,
	                          async:false,
	                          contentType : false,
	                          processData : false,
	                          success: function (data) {
	                          	console.log("response:" + data);
	                          	
	                          	var object=data;
	                          	 
	                          		 
	                          		 if(object.status==0){
	                          			 alert(" file update sucessfully");
	                          			location.href='projectdashboard.jsp';
	                          

	                          	       }
	                          		 else{
	                          			 alert(object.errorMessage);
	                          			event.preventDefault();    		
	                          		 }
	                          		
	                          		 },
	                        error: function (xhr, ajaxOptions, thrownError) {
	       		             console.log(xhr);
	       		             console.log(thrownError);
	       		             console.log(ajaxOptions);
	       		             
	       		          event.preventDefault();    	
	       		     }
	                      
	                        });
	                   
	              
	           
	                
	                   

	                    }
	                    });
    		}
     	      
    		alert("project Upadted successfully");
    	}
    	else{
    		if(data.errorMessage=="Violation of UNIQUE KEY constraint 'unqiue key'. Cannot insert duplicate key in object 'dbo.project_details'.")
    	   {
    		   alert("project code already exits try another name")	;	  
    	   }else{
   			alert(data.errorMessage);
   			 event.preventDefault();
   		}
   		 
   		 
    }
    	
    },
    error: function (xhr, ajaxOptions, thrownError) {
        console.log(xhr);
        console.log(thrownError);
        console.log(ajaxOptions);
}
});

}else
	{
	
	//alert('not');
	event.preventDefault();
	}
	
	});
});

	
	
	
	
	
	
	function go()
	{
		
		location.href='projectdashboard.jsp';
	}
	
	$().ready(function(){
		$('#startdate').change(function(){
			
			if($('#enddate').val()!=''){
				
				
				var start=new Date($('#startdate').val());
				var end=new Date($('#enddate').val());
				
				var day=dateDifference(start,end);
				$('#nodays').text('No.of.days         :  '+day);
				$('#estimationhours').text('Estimation Hours   :'+day*8);
				
				
			}
			
			
			
			
		});


		});




		$().ready(function(){
			$('#enddate').change(function(){
				
				if($('#startdate').val()!=''){
					
					
					var start=new Date($('#startdate').val());
					var end=new Date($('#enddate').val());
					
					var day=dateDifference(start,end);
					$('#nodays').text('No.of.days         :  '+day);
					$('#estimationhours').text('Estimation Hours   :'+day*8);
					
					
				}
				
				
				
				
			});


			});


		function dateDifference(start, end) {

			  // Copy date objects so don't modify originals
			  var s = new Date(+start);
			  var e = new Date(+end);

			  // Set time to midday to avoid dalight saving and browser quirks
			  s.setHours(12,0,0,0);
			  e.setHours(12,0,0,0);

			  // Get the difference in whole days
			  var totalDays = Math.round((e - s) / 8.64e7);

			  // Get the difference in whole weeks
			  var wholeWeeks = totalDays / 7 | 0;

			  // Estimate business days as number of whole weeks * 5
			  var days = wholeWeeks * 5;

			  // If not even number of weeks, calc remaining weekend days
			  if (totalDays % 7) {
			    s.setDate(s.getDate() + wholeWeeks * 7);

			    while (s < e) {
			      s.setDate(s.getDate() + 1);

			      // If day isn't a Sunday or Saturday, add to business days
			      if (s.getDay() != 0 && s.getDay() != 6) {
			        ++days;
			      }
			    }
			  }
			  return days;
			}


		//
		//$().ready(function(){
//			$('#cal').click(function(){
		//	
//			var start=new Date($('#startdate').val());
//			var end=new Date($('#enddate').val());
//			var day=dateDifference(start,end);
//			$('#nodays').text('No.of.days         :  '+day);
//			$('#estimationhours').text('Estimation Hours   :'+day*8);
		//	
//			});
		//	
		//	
		//
		//});

//		$().ready(function(){
//			
//			$("delete").click(function(){
////			sent to project  row id and filename in to filedelete webservices  
//			
//			
//			
//			
//			
//			
//			});
//			
//			
//			
//		});







				$().ready(function(){

		$('#cc').change(function() {
			var k=$(this).val(); 
			
			
			var url = "rest/webservices/getallcontactperson?customer_id="+k;
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
							 $("#tbody tr").remove();
							 var remov3='<img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2('+t+')" id="remove'+t+'"/>';
							 $("#tbody").append('<tr id="remove'+t+'" onclick="myFunction1(this)"><td>'+c+'<td><td><td><td><td>'+remove+'</td></tr>');	           
						},
					error : function(msg) {
							console.log("User customer Details not found", msg);
						}
					});
		});
		});



	
	
	
		$().ready(function(){
			
			$('#addrow').click(function() {
				if($("#cc").val!='')
				{
					
					var remov3='<img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2('+t+')" id="remove'+t+'"/>';
				$("#tbody").append('<tr id="remove'+t+'" onclick="myFunction1(this)"><td>'+c+'<td><td><td><td><td >'+remov3+'</td></tr>');
				t=t+1;
				}
			});
		});


	
		function myFunction(source){
			
//			 var x = document.getElementById("mySelect").value;

			
			 var z =source.value ;
			
				var url = "rest/webservices/getonecontactperson?id="+z;
				 document.getElementById("myTable").rows[row].cells[2].innerHTML='';
					 document.getElementById("myTable").rows[row].cells[3].innerHTML='';
					 document.getElementById("myTable").rows[row].cells[4].innerHTML='';
//					 document.getElementById("myTable").rows[row].cells[5].innerHTML='';
//					 var remove='<img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2();" id="remove'+t+'"/>';
			  	$.ajax({
			  	        type: "GET",
			  	        dataType:"json",
			  	        url: url,
			  	        success: function(data) {
			  	            console.log("response:" + data);
			  	         
			  					var object=data.object;
			  					 for ( var i in object) {
			  						 var id1='<input type="hidden" value="'+object[i].id+'" name="person_id" id="id">'+object[i].person_name;
			  						//myTable.rows[row].cells[2].innerHTML =object[i].mail ;
			  						 document.getElementById("myTable").rows[row].cells[1].innerHTML=id1;
			  						 document.getElementById("myTable").rows[row].cells[2].innerHTML=object[i].mail;
			  						 document.getElementById("myTable").rows[row].cells[3].innerHTML=object[i].contact_no1;
			  						 document.getElementById("myTable").rows[row].cells[4].innerHTML=object[i].contact_no2;
			  						 document.getElementById("myTable").rows[row].cells[5].innerHTML=remove;
			  						 
			  						 //alert(object[i].mail);
			  						 
			  						 
			  		                 
			  			            }
			  					
			  				
			  				},
			  			error : function(msg) {
			  					console.log("User customer Details not found", msg);
			  				}
			  			});
			  
		}

		function myFunction1(x) {
		    row= x.rowIndex;
		   
		}
		function myFunction2(tt) {
			$().ready(function(event){
				 var x = confirm("Are you sure you want to delete?");
				  if (x)
				     {
			$("#remove"+tt).remove();
				     }
				  else{
					  event.preventDefault();  
				  }
			});
		    //document.getElementById("myTable").deleteRow(tt);
			// document.getElementById("passwordl").rows[row].remove;
		}


function myFunction3(tt) {
			
			
		    document.getElementById("myTable").deleteRow(tt);
			// document.getElementById("passwordl").rows[row].remove;
		}

	

function myFunction6(filename){
//		alert(filename);
	var download="DownloadServlet?projectid="+projectid+"&filename="+filename;
	window.location.assign(download);

//	$.ajax({
//	    url:download,
//	    type:'POST',
//	    contentType: 'application/json;charset=UTF-8',
//        
//	    success: function (data) {
//	    	
//	        console.log('ok');
//	    },
//	    error: function (xhr) {
//	      console.log(xhr);
//	    }
//	    });
////window.location.href=download;
	}
	

function myFunction11(filename){
	$().ready(function(event){
	 var x = confirm("Are you sure you want to delete?");
	  if (x)
	     {
		  
		
		  var url="rest/webservices/filedelete?projectid="+projectid+"&filename="+filename;
			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
			           
		            	
							console.log(data.status);
							if(data.status==0)
							{
								alert("file deleted");
								location.reload();
								

							}
							else{
								 event.preventDefault();  
							}
			          
						},
						error : function(msg) {
							 event.preventDefault();  
							console.log("User location Details not found", msg);
						}
					});
	     }
	  else{
		  event.preventDefault();  
	  }
	     });
		  
		  
	  
	  
}

var filerowcount=2;
$().ready(function(){
	
	$('#addfilerow').click(function() {
		
		$("#filetbody").append(' <tr id="filerow'+filerowcount+'"><td><input type="file" name="file" id="file"/></td><td><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction66('+filerowcount+');" id="fileremove"/></td></tr>');	    
		
		filerowcount=filerowcount+1;
	});
});

function myFunction66(ll) {

	var k='#filerow'+ll;
	   $(k).remove();
}

var modal=document.getElementById("myModal");

function onclick1() {


	modal.style.display = "block";
	
	
}

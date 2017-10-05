/**
 * 
 */$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2!=null){
		if(designation!='project_manager'&&designation!='admin')
		{
		 location.href='timesheetentry.html';
		}
	else{	

   
   var url = "rest/webservices/getallcustomer";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#clientid1")
	            	.append(' <option value='+object[i].id+'>'+object[i].customer_code+"-"+object[i].company_name+'</option>');	           
	            	}
				},
			error : function(msg) {
					console.log("User customer Details not found", msg);
				}
			});

   
	}
	}
	else{
		window.location.href='index.html';
	}
});

});
 
 
 
 

 $().ready(function(){
 $('#clientid1').change(function() {
 	var k=$(this).val(); 
 	 var c=0;
 	 var url = "rest/webservices/getonecontact?id="+k;

		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        async:false,
		        success: function(data) {
		            console.log("response:" + data);
						
						var object=data.object;

						   for ( var i in object) {
							   customer_id=object[i].id;
							   $('#clientname b').remove();
			               		$('#clientname').append('<b>'+object[i].company_name+'</b>');
			               	 $('#location b').remove();
			               		$('#location').append('<b>'+object[i].customer_city+'</b>');
						   }
		        
						   var url1 = "rest/webservices/getallcontactperson?customer_id="+k;
		        
						   $.ajax({
						        type: "GET",
						        dataType:"json",
						        url: url1,
						        async:false,
						        success: function(data) {
						            console.log("response:" + data);
										
										var object=data.object;

										   for ( var i in object) {
											   	c=c+1;
												
						       
										   }
										   $('#person a').remove();
						               		$('#person').append('<a>'+c+'</a>');
						        },
		       					error : function(msg) {
		       							console.log("User customer contact person Details not found", msg);
		       						}
		       					});
			
		        
		        
		        
		        
		        
		        
		        },
					error : function(msg) {
							console.log("User customer Details not found", msg);
						}
					});
		
		var url = "rest/webservices/report2?cus_code="+k;
		$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        async:false,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;

					 if(data.object==''){
						 $("#c1 tr").remove();
						 alert('empty');
						 $('#example').DataTable();
					 }
					 else
						 {
						 $("#c1 tr").remove();
						 var k=1;	
						 
						 for ( var i in object) {
							 $("#c1").append('<tr  align="center"><td>'+k+'<td>'+object[i].project_code+'<td>'+object[i].project_name+'<td>'+object[i].location+'<td>'+object[i].count+'<td ><button  id="view" onclick="show1('+object[i].id+')"  >view</button>');
							 k++;
						 	}
				
						 $('#example').DataTable();
						 }
	        },
				error : function(msg) {
						console.log("Project details are not found", msg);
					}
				});
 });
 });

 
 
 function show()
 {
	 var id=$('#clientid1').val();
	 $().ready(function(){
	 var url = "rest/webservices/getallcontactperson?customer_id="+id;
		var k=1;
	
		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);
						
						var object2=data.object;	
						$("#managerview tr").remove();
		            for ( var i in object2) {
	                
		            	
	         	$("#managerview").append('<tr align="center"><td>'+ k +'</td><td  >'+object2[i].person_name.toUpperCase()+'</td><td  >'+object2[i].contact_no1+'<td>'+object2[i].contact_no2+'</td><td>'+object2[i].mail+'</td></tr>');
		            				     
	         	 k=k+1;	
	              
	              }
		          
		           
		        
		        },
					error : function(msg) {
						console.log("User Favorites Details not found", msg);
					}
				});
		$('#myModal').css("display","block");
	 }); }
 function show1(id1)
 {
	 var id=$('#clientid1').val();
	
	 $().ready(function(){
		 var url = "rest/webservices/report3?pro_id="+id1+"&cus_code="+id;
			var k=1;
		
			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object2=data.object;	
							$("#managerview tr").remove();
			            for ( var i in object2) {
		                
			            	
		         	$("#managerview").append('<tr align="center"><td>'+ k +'</td><td  >'+object2[i].person_name.toUpperCase()+'</td><td  >'+object2[i].contact_number1+'<td>'+object2[i].contact_number2+'</td><td>'+object2[i].contact_mail+'</td></tr>');
			            				     
		         	 k=k+1;	
		              
		              }
			          
			           
			        
			        },
						error : function(msg) {
							console.log("User Favorites Details not found", msg);
						}
					});
			$('#myModal').css("display","block");
		 }); 
	
	  }
	
 
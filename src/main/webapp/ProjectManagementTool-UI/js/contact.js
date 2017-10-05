
$(document).ready(function(){
$( window ).load(function() {
	
	
	
	var url = "rest/webservices/getallcustomer";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        async:false,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#username")
	            	.append(' <option value='+object[i].id+'>'+object[i].customer_code+'</option>');	           
	            	}
				},
			error : function(msg) {
					console.log("User customer Details not found", msg);
				}
			});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
});
var c;
$().ready(function(){
	
	$('#username').change(function() {
		var k=$(this).val(); 
		
		alert(k);
		var url = "rest/webservices/getallcontactperson?customer_id="+k;

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
				            	
				            sr++;	
				            }
						
						c=c+'</select>';
						
						 $("#tbody1 tr").remove();
						 var sr=1;
						 $("#tbody1").append('<tr><td>Si.No<td>Contact Person<td>Mail<td>Contact Number<td> Alternative Number</td><td></td></tr>');
		     
                    
                   
		            	$("#tbody1").append('<tr onclick="myFunction1(this)"><td>'+sr+'<td>'+c+'<td><td><td><td></td></tr>');	           
		           
					},
				error : function(msg) {
						console.log("User customer Details not found", msg);
					}
				});
	});
	
	
	
	
	
			$('#login').click(function() {
			 var formData = new FormData();
			var data=$("#form").serializeArray();
			data.push({ name: "project_id", value: "5" });
			//data.append('id',25);
			var url = "rest/webservices/save";
//			formData.append('customer_id',$("#username").val());
//			formData.append('conatctperson',$())
			$.ajax({
			        type: "POST",
			        dataType:"json",
			        data:data,
			        url: url,
			        async:false,
			        success: function(data) {
			            console.log("response:" + data);
			           
							var object=data.object;
							
							// $("#passwordl").append('<tr><td>Si.No<td>Contact Person<td>Mail<td>Contact Number<td> Alternative Number</td><td></td></tr>');
			            for ( var i in object) {
	                    
	                   
			            		
			            }
						},
					error : function(msg) {
							console.log("User customer Details not found", msg);
						}
					});
			
		
		
		});
		
		
		
	
		
	
	
});




















var countt=1;

$().ready(function(){
	
	$('#add').click(function() {
		
		countt=countt++;
		$("#tbody1").append('<tr onclick="myFunction1(this)"><td>'+countt+'<td>'+c+'<td><td><td><td ><span id="remove">REMOVE</span></td></tr>');	    
		
	});

	
$('#person1').change(function() {
	
	alert("fsdfsdfs");
	
//	var g=$(this).val(); 
//	
//	alert(g);
//	var url = "rest/webservices/getonecontactperson?id="+g;
//
//	$.ajax({
//	        type: "GET",
//	        dataType:"json",
//	        url: url,
//	        success: function(data) {
//	            console.log("response:" + data);
//	         
//					var object=data.object;
//					 for ( var i in object) {
//		                    
//						 
//						 
//						 alert(object[i].mail);
//						 
//						 
//		                 
//			            }
//					
//				
//				},
//			error : function(msg) {
//					console.log("User customer Details not found", msg);
//				}
//			});
//

});




});

var myTable = document.getElementById('passwordl');

var row;
function myFunction(source){
	
	 var x = document.getElementById("mySelect").value;

	
	 var z =source.value ;
	
		var url = "rest/webservices/getonecontactperson?id="+z;
		 document.getElementById("passwordl").rows[row].cells[2].innerHTML='';
			 document.getElementById("passwordl").rows[row].cells[3].innerHTML='';
			 document.getElementById("passwordl").rows[row].cells[4].innerHTML='';
			 document.getElementById("passwordl").rows[row].cells[5].innerHTML='';
			 var remove='<span onclick="myFunction2()" id="remove">REMOVE</span>';
	  	$.ajax({
	  	        type: "GET",
	  	        dataType:"json",
	  	        url: url,
	  	        success: function(data) {
	  	            console.log("response:" + data);
	  	         
	  					var object=data.object;
	  					 for ( var i in object) {
	  		                    var id='<input type="hidden" value="'+object[i].id+'" name="person_id" id="id">'+object[i].person_name;
	  						//myTable.rows[row].cells[2].innerHTML =object[i].mail ;
	  						 document.getElementById("passwordl").rows[row].cells[2].innerHTML=id;
	  						 document.getElementById("passwordl").rows[row].cells[3].innerHTML=object[i].mail;
	  						 document.getElementById("passwordl").rows[row].cells[4].innerHTML=object[i].contact_no1;
	  						 document.getElementById("passwordl").rows[row].cells[5].innerHTML=object[i].contact_no2;
	  						 document.getElementById("passwordl").rows[row].cells[5].innerHTML=remove;
	  						 
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
function myFunction2() {
	
    alert(row);
    document.getElementById("passwordl").deleteRow(row);
	// document.getElementById("passwordl").rows[row].remove;
}


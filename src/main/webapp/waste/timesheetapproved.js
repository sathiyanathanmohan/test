
var rowcount=1;

$(document).ready(function(){
$( window ).load(function() {	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	
	if(user2!=null){
		if(designation!='project_manager'&&designation!='admin')
		{
		 location.href='timesheetedit.html';
		}
	else{	
		 $('#welcomeuser').append("Welcome "+user2+" !!!") ;
      load();
	}
	}
	else{
		  location.href='index.html';
	}

	
});		
});



function load()
{
	var url = "rest/webservices/getmasterdetails?category=services_offered";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#services")
	            	.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');	           
	            	}
				},
			error : function(msg) {
					console.log("User servicesoffered Details not found", msg);
				}
			});

	var url = "rest/webservices/getmasterdetails?category=technology";
	
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#technology")
					.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
	            }
				},
				error : function(msg) {
					console.log("User technology Details not found", msg);
				}
			});
	
	
var url = "rest/webservices/getmasterdetails?category=status";
	
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#projectstatus")
					.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
	            }
				},
				error : function(msg) {
					console.log("User technology Details not found", msg);
				}
			});
	
	
	
	
	
var url = "rest/webservices/getmasterdetails?category=customer_portfolio";
	
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#customerportfolio")
					.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
	            }
				},
				error : function(msg) {
					console.log("User customerportfolio Details not found", msg);
				}
			});
	
	
	
//var url = "rest/webservices/getallcustomerdetails";
//	
//	$.ajax({
//	        type: "GET",
//	        dataType:"json",
//	        url: url,
//	        success: function(data) {
//	            console.log("response:" + data);
//					
//					var object=data.object;
//	            for ( var i in object) {
//
//	            	$("#customerportfolio")
//					.append(' <option value='+object[i].customer_code+'>'+object[i].customer_code+'</option>');
//	            }
//				},
//				error : function(msg) {
//					console.log("User customer Details not found", msg);
//				}
//			});

	var url = "rest/webservices/getallemployee?designation=project_manager";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#projectmanager")
					.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');
	            }
				},
				error : function(msg) {
				
				}
			});
	
	var url = "rest/webservices/getallemployee?designation=delivery_manager";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#deliverymanager")
	            	.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');	            
	            	}
				},
				error : function(msg) {
					console.log("User delivery manager Details not found", msg);
				}
			});

	var url = "rest/webservices/getallemployee?designation=onsite_coordinator";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#onsitecoordinator")
	            	.append('  <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');	           
	            	}
				},
				error : function(msg) {
					console.log("User onsite_coord Details not found", msg);
				}
			});
	var url = "rest/webservices/getmasterdetails?category=contract_type";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#contracttype")
					.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');
	            }
				},
				error : function(msg) {
					console.log("User contract_type Details not found", msg);
				}
			});
	
	
	var url = "rest/webservices/getmasterdetails?category=center";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#center")
	            	.append(' <option value='+object[i].item+'>'+object[i].item+'</option>');	         
	            	}
				},
				error : function(msg) {
					console.log("User center Details not found", msg);
				}
			});
	


	var url = "rest/webservices/getallcustomer";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#cc")
	            	.append(' <option value='+object[i].id+'>'+object[i].customer_code+"-"+object[i].company_name+'</option>');	           
	            	}
				},
			error : function(msg) {
					console.log("User customer Details not found", msg);
				}
			});
	
	
	


}

$().ready(function(){
$('#center').change(function() {
	var centerchange=$("#center").val();
	//alert(centerchange);
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










var c;
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
					 $("#tbody").append('<tr id="'+rowcount+'" onclick="myFunction1(this)"><td>'+c+'<td><td><td><td><td ><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction3('+rowcount+')" id="remove"/></td></tr>');	
					 
						rowcount=rowcount+1;          
				},
			error : function(msg) {
					console.log("User customer Details not found", msg);
				}
			});
});
});







var str;
$().ready(function(){
	$("#technology").change(function(event){
	if($(this).find('option:selected').hasClass('actived')){		
	    alert('already selected');
	}
	    else{
	    	  $(this).find('option:selected').addClass('actived');
	    	  if( $("#tech").text()==' '){	       
	            str =  $(this).val();
	           $("#tech").text(str);
	   	 }else
	   		 {
	   		  str= $('#tech').text()+","+$(this).val();
	   		  $('#tech').text(str);
	   		 }
	    	  
	    }
	 

	 });


	    });

$().ready(function(){
	$("#center").change(function(event){
		var center=$('#center').val();
		
		if(center=='Select')
		{
		
		 $('#ec').css('display','block');
		 
		}

	if(center=='Onsite')
	{
		document.getElementById("onsite").readOnly = false;
		document.getElementById("offshore").readOnly = true;
		document.getElementById("offshore").value = '0';		
	    document.getElementById("onsite").value = '';
	
		

	}	

	if(center=='Offshore')
		{
		document.getElementById("onsite").readOnly = true;
		document.getElementById("offshore").readOnly = false;
		document.getElementById("onsite").value = '0';
	
		document.getElementById("offshore").value = '';
		

		}
	 if (center=='Both')
		{
		 document.getElementById("offshore").readOnly = false;
		 document.getElementById("onsite").readOnly = false;
		 document.getElementById("onsite").value = '';	
		 document.getElementById("offshore").value = '';
		
			
		}
		
		
	 });
	
	
});








$().ready(function(){
	var msgstart='';
	var msgend='';
	var valid1=0;
	var valid2=0;
	var msgeffort='';
	var msgon='';
	var msgoff='';
	var valid3=0;
	var valid4=0;
	var valid5=0;
	var sum=0;
	
	$("#save").click(function (event){

//		var modal1 = document.getElementById('myModal');
//		 modal1.style.display = "block";
 		$('input[name="file"]').each(function(index, value) 
                { 
 	
			
                    var file = value.files[0];
                  
                    if(file) 
                    {
                alert(file.name);
//                        var formData = new FormData();
//                        formData.append('file', file);
//                        formData.append('id',id);
//                        var thefile = document.getElementById('file');
//                        formData.append('filename',thefile.files.item(fileindex).name);
////                        
//                        $.ajax({
//                          url : 'rest/webservices/filechange',
//                          type : 'POST',
//                          data : formData,
//                          cache : false,
//                          async:false,
//                          contentType : false,
//                          processData : false,
//                          success: function (data) {
//                          	console.log("response:" + data);
//                          	
//                          	var object=data;
//                          	 
//                          		 
//                          		 if(object.status==0){
//                          			 alert(" file update sucessfully");
//                          		alert("project created successfully");
//                          		window.location.href='projectdashboard.jsp'
//
//                          	       }
//                          		 else{
//                          			 alert("update ksdfvpksdnfdw failed");
//                          			event.preventDefault();    		
//                          		 }
//                          		 },
//                        error: function (xhr, ajaxOptions, thrownError) {
//       		             console.log(xhr);
//       		             console.log(thrownError);
//       		             console.log(ajaxOptions);
//       		             
//       		          event.preventDefault();    	
//       		     }
//                      
//                        });
//                   
              
           
                    }
                    });
	

});
});


	
	
	
	
$().ready(function(){
	
	$("#cancel").click(function (){
		
		location.href='projectdashboard.jsp';
	

});

});

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
			$('#effortrequired').val(day*8);
			
			
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
//	$('#cal').click(function(){
//	
//	var start=new Date($('#startdate').val());
//	var end=new Date($('#enddate').val());
//	var day=dateDifference(start,end);
//	$('#nodays').text('No.of.days         :  '+day);
//	$('#estimationhours').text('Estimation Hours   :'+day*8);
//	
//	});
//	
//	
//
//});

$().ready(function() {
    $("#effortrequired").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
    
    $("#onsite").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
    
    
    
    $("#offshore").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
    
    
    
    
});




$().ready(function(){
	
	$('#addrow').click(function() {
		if($("#cc").val!='')
		{
		$("#tbody").append('<tr id="'+rowcount+'" onclick="myFunction1(this)"><td>'+c+'<td><td><td><td><td ><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction3('+rowcount+')" id="remove"/></td></tr>');	    
		rowcount=rowcount+1;
		}
	});
});


var row;
function myFunction(source){
	
//	 var x = document.getElementById("mySelect").value;

	
	 var z =source.value ;
	
		var url = "rest/webservices/getonecontactperson?id="+z;
		 document.getElementById("myTable").rows[row].cells[2].innerHTML='';
			 document.getElementById("myTable").rows[row].cells[3].innerHTML='';
			 document.getElementById("myTable").rows[row].cells[4].innerHTML='';
			 document.getElementById("myTable").rows[row].cells[5].innerHTML='';
			 var remove='<img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2()" id="remove"/>';
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
	  						 document.getElementById("myTable").rows[row].cells[1].innerHTML=id;
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
function myFunction2() {
	
//    alert(row);
    document.getElementById("myTable").deleteRow(row);
	// document.getElementById("passwordl").rows[row].remove;
}

function myFunction3(x) {
	
	var k='#'+x;
	   $(k).remove();
}



var modal=document.getElementById("myModal");

function onclick1() {


	modal.style.display = "block";
	
	
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





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
	$("#location option").remove();

	
	if(centerchange=='Select')
	{
	
	 $('#ec').css('display','block');
	 $("#location").append(' <option value="Select">Select</option>');	  
	}
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
		            $("#location").append(' <option value="Select">Select</option>');	           
	            	
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
	            $("#location").append(' <option value="Select">Select</option>');	           
            	
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
	    alert('Technology already selected');
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
	$("#location").change(function(event){
		var location=$('#location').val();
		if(location=='Select')
		{
		 $('#el').css('display','block');

		}
		else
		{
		$('#el').css('display','none');
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
		else
			{
			$('#ec').css('display','none');
			}
		

	if(center=='Onsite')
	{
		document.getElementById("onsite").readOnly= false;
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
	 var valid1=0;
	 var valid2=0;
	 var msgeffort='';
	 var msgon='';
	 var msgoff='';
	 var valid3=0;
	 var valid4=0;
	 var valid5=0;
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
	 var valid1=0;
	 var valid2=0;
	 var msgeffort='';
	 var msgon='';
	 var msgoff='';
	 var valid3=0;
	 var valid4=0;
	 var valid5=0;
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
	
	
	$("#save").click(function (event){
		var projectcode=$('#projectcode').val();
		var projectname=$('#projectname').val();
		var effortrequired=$('#effortrequired').val();
		var onsite=$('#onsite').val();
		var offshore=$('#offshore').val();
		var center=$('#center').val();
	var location=$('#location').val();
	var con=$('#contracttype').val();
	var projectstatus=$('#projectstatus').val();
    var cus=$('#customerportfolio').val();
    var service=$('#services').val();
    var technology=$('#technology').val();
   var projectmanager=$('#projectmanager').val();
   var deliverymanager=$('#deliverymanager').val();
//   var onsitecoordinator=$('#onsitecoordinator').val();
   
   var rowcount=1;
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

   if(offshore=='')
   {
   	valid5=0;
   	msgoff='Enter offshore effort';
   	$('eoff').text(msgoff);
   	$('#eoff').css('display','block');
   }

   if(effortrequired=='')
   {
   	msgeffort='Enter effort required'; 
   	$('#er').text(msgeffort);
   	$('#er').css('display','block');
   	valid3=0;
   }
   if(center=='Select')
	{
	
	 $('#ec').css('display','block');
	 
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
if(projectstatus!='Open')
{
 $('#eps').css('display','block');

}
else
{
$('#eps').css('display','none');
}
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
if(technology=='Select')
{
 $('#et').css('display','block');

}
else
{
$('#et').css('display','none');
}
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
//if(onsitecoordinator=='Select')
//{
// $('#eoc').css('display','block');
//
//}
//else
//{
//$('#eoc').css('display','none');
//}




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
		msgstart='Start date not to be a past month';
		$('#esd').text(msgstart);
		$('#esd').css('display','block');
		
		}
	else if(str2>=str1)
		{
		valid1=1;
		$('#esd').css('display','none');
		}


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

		







if(projectcode!=''&&projectname!=''&&center!='Select'&&location!='Select'&&contracttype!='Select'&&projectstatus=='Open'&&customerportfolio!='Select'&&services!='Select'&&technology!='Select'&&projectmanager!='Select'&&deliverymanager!='Select'&&valid1==1&&valid2==1&&valid3==1&&valid4==1&&valid5==1)
{
	
	
	var fileup=1;

		        
	
		              
		    
	
		     var url = "rest/webservices/createproject";
		     var myform = document.getElementById("form");
		     var data = $("#form").serialize()
		     $.ajax({
		     	 url: url,
		     	    type: 'POST',
		     	    data:data,
		     	    async:false,
		         success: function (data) {
		         	console.log("response:" + data);
		         	
		         	var object=data;
		         	 
		         		 
		         		 if(object.status==0){
		         		 
		         		fileup==0;
		         		var id=object.id;
		         		
		         var contact_id=$("#cc").val();
		         		
		     			var data=$("#form").serializeArray();
		     			data.push({ name: "project_id", value: id });
		     			data.push({name:"contact_id",value:contact_id});
		     			var url = "rest/webservices/contactpersonsave";
		     			$.ajax({
		     			        type: "POST",
		     			        dataType:"json",
		     			        data:data,
		     			        url: url,
		     			        async:false,
		     			        success: function(data) {
		     			            console.log("response:" + data);
		     			           
		     							var object=data.object;
		     							
		     							
		     			            for ( var i in object) {
		     	                    if(object.status==0){
		     	                    	alert("contact saved")
		     	                    }
		     	                   
		     			            		
		     			            }
		     						},
		     					error : function(msg) {
		     							console.log("User customer Details not found", msg);
		     						}
		     					});
		     			
		         		
		         		
		         		
		         		
		         		
		         		
		         		
		         		
		         		
		     			

		         		

		         		$('input[name="file"]').each(function(index, value) 
		    	                { 
		         		
		    	                    var file = value.files[0];
		    	                   
		    	                    if(file) 
		    	                    {
//		    	                        var file_decrption=document.getElementsById("file_desc");
//		    	                        file_decrption=file_decrption[index].value();
//		    	                            var filename=file.name;
//		    		    	                alert(filename+"   "+file_decrption);
		    	                        var formData = new FormData();
		    	                        formData.append('file', file);
		    	                        formData.append('id',id);
		    	                        var thefile = document.getElementById('file');
		    	                        formData.append('filename',file.name);
		    	                        
		    	                        $.ajax({
		    	                          url : 'rest/webservices/filechange',
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
		    	                          		alert("project created successfully");
		    	                          		window.location.href='projectdashboard.jsp'

		    	                          	       }
		    	                          		 else{
		    	                          			 alert("update  failed");
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
		         		 else{
		         			 if(object.errorMessage=="Violation of UNIQUE KEY constraint 'unqiue key'. Cannot insert duplicate key in object 'dbo.project_details'.")
		         		{
		         		alert("project code already exits try another name");	
		         		 e.preventDefault();    		
		         		 }else{
		         			alert(object.errorMessage);
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
	
	
	
//	
//	if( fileup==0){
//		
//		
//		 $('input[name="file"]').each(function(index, value) 
//	                { 
//	                    var file = value.files[0];
//	                    if(file) 
//	                    {
//	                   
//	                        var formData = new FormData();
//	                        formData.append('file', file);
//	                        formData.append('projectcode',projectcode)
//	                        $.ajax({
//	                          url : 'rest/webservices/pdf',
//	                          type : 'POST',
//	                          data : formData,
//	                          cache : false,
//	                          async:false,
//	                          contentType : false,
//	                          processData : false,
//	                          success: function (data) {
//	                          	console.log("response:" + data);
//	                          	
//	                          	var object=data;
//	                          	 
//	                          		 
//	                          		 if(object.status==0){
//	                          			 alert(" file update sucess");
//	                          		alert("project created successfully");
//	                          	  location.href='projectdashboard.html';
//
//	                          	       }
//	                          		 else{
//	                          			 alert("update ksdfvpksdnfdw failed");
//	                          			event.preventDefault();    		
//	                          		 }
//	                          		 },
//	                        error: function (xhr, ajaxOptions, thrownError) {
//	       		             console.log(xhr);
//	       		             console.log(thrownError);
//	       		             console.log(ajaxOptions);
//	       		             
//	       		          event.preventDefault();    	
//	       		     }
//	                      
//	                        });
//	                   
//	              
//	           
//	                    }
//	                    });
//		
//	
//}
}
else
{

//alert('not');
event.preventDefault();
}
});

});


	
	
	
	
$().ready(function(){
	
	$("#cancel").click(function (){
		
		location.href='projectdashboard.jsp';
	

});

});

//$().ready(function(){
//$('#startdate').change(function(){
//	
//	if($('#enddate').val()!=''){
//		
//		
//		var start=new Date($('#startdate').val());
//		var end=new Date($('#enddate').val());
//		
//		var day=dateDifference(start,end);
//		$('#nodays').text('No.of.days         :  '+day);
//		$('#estimationhours').text('Estimation Hours   :'+day*8);
//		
//		
//	}
//	
//	
//	
//	
//});
//
//
//});




//$().ready(function(){
//	$('#enddate').change(function(){
//		
//		if($('#startdate').val()!=''){
//			
//			
//			var start=new Date($('#startdate').val());
//			var end=new Date($('#enddate').val());
//			
//			var day=dateDifference(start,end);
//			$('#nodays').text('No.of.days         :  '+day);
//			$('#estimationhours').text('Estimation Hours   :'+day*8);
//			$('#effortrequired').val(day*8);
//			
//			
//		}
//		
//		
//		
//		
//	});
//
//
//	});


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





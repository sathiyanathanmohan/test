/**
 * 
 */
var customer_id;
var count=1;
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation= checkCookie3(decodeURIComponent(document.cookie));

	if(user2!=null){
		if(designation!='project_manager'&&designation!='admin')
		{
		 location.href='timesheetedit.html';
		}
		
	else{	
		if(designation!='admin')
		{
		 location.href='clientdashboard.jsp';
		}
		else{
		 $('#welcomeuser').append("<b>Welcome "+user2.charAt(0).toUpperCase() + user2.slice(1)+" !!!</b>") ;
		 
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
	
	
		 	 var url = "rest/webservices/getonecontact?id="+a;

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
				        $("#id").val(object[i].id);
				        $("#clientcode").val(object[i].customer_code);
				        $("#clientname").val(object[i].company_name);
				        $("#website").val(object[i].website_name);
				       $("#email").val(object[i].customer_mail);
				       if(object[i].area_code!=""){
					       $("#areacode").val(object[i].area_code);
					       }
				       if(object[i].contact_phone1!=0){
				       $("#phoneno").val(object[i].contact_phone1);
				       }
				       $("#address1").val(object[i].customer_street1);
				       $("#address2").val(object[i].customer_street2);
				       $("#city").val(object[i].customer_city);
				       $("#state").val(object[i].customer_state);
				       $("#country").val(object[i].customer_country);
				       $("#zipcode").val(object[i].customer_zipcode);
				       
				       
				       
								   }
				        
								   var url1 = "rest/webservices/getallcontactperson?customer_id="+a;
				        
								   $.ajax({
								        type: "GET",
								        dataType:"json",
								        url: url1,
								        async:false,
								        success: function(data) {
								            console.log("response:" + data);
												
												var object=data.object;

												   for ( var i in object) {
								        
								      
													   $("#tbody").append('<tr id="'+count+'" onclick="myFunction1(this);"> <td width="14%"><input type="text" id="personname'+i+'" name="personname"> <input type="hidden" value="" name="conatctpersonid" id="conatctpersonid'+i+'">  </td><td width="23%"><input type="text" style="width:98.5%" id="personmail'+i+'" name="personmail"> </td><td width="13%"> <input type="text" id="personno1'+i+'" name="personno1"></td> <td width="13%"> <input type="text" id="personno2'+i+'" name="personno2"></td><td width="3%" ><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2('+count+')" id="remove"/></td></tr>');	    
													
													  
													
												   $("#personname"+i).val(object[i].person_name);
												   $("#personmail"+i).val(object[i].mail);
												   $("#personno1"+i).val(object[i].contact_no1);
												   $("#personno2"+i).val(object[i].contact_no2);
												   $("#conatctpersonid"+i).val(object[i].id);
												   
													   count=count+1;
														
								       
												   }
												   
								        
								        
								        
								        
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
	
	
	
	
	
	
	
	}
	}
	}
		
	else{
		window.location.href='index.html';
	}
	
});
});


$().ready(function(event){

	
	$('#addrow').click(function() {
		
		
		$("#tbody").append('<tr id="'+count+'" onclick="myFunction1(this);"> <td width="14%"><input type="text" id="personname" name="personname" > <input type="hidden" value="2" name="conatctpersonid" id="conatctpersonid">  </td><td width="23%"><input type="text"  style="width:98.5%" id="personmail" name="personmail"> </td><td width="13%"> <input type="text"  id="personno1" name="personno1"></td> <td width="13%"> <input type="text"  id="personno2" name="personno2"></td><td width="3%" ><img src="ProjectManagementTool-UI/css/images1/close.jpg" Style="width:20px;height:20px" onclick="myFunction2('+count+')" id="remove"/></td></tr>');	    
		count=count+1;
	});
});


var row;


function myFunction1(x) {
    row= x.rowIndex;
    
}
function myFunction2(x) {
	var k='#'+x;
   $(k).remove();
  //  document.getElementById("tbody").deleteRow(row);
	// document.getElementById("passwordl").rows[row].remove;
}

var valid1=0;
var valid2=0;
var valid3=0;
var valid4=0;
var valid5=0;
var valid6=0;
var valid7=0;
var valid8=0;
var valid9=0;
var valid10=0;
var valid11=0;

$().ready(function(){
	
	$("#cancel").click(function (){
		window.location.href='clientdashboard.jsp';
		});
	$("#save").click(function (event){	
		var clientcode=$('#clientcode').val().trim();
		var clientname=$('#clientname').val().trim();
		var zipcode=$('#zipcode').val().trim();
		var website=$('#website').val().trim();
		var tempVal = $('#phoneno').val().trim();
		var address1=$('#address1').val().trim();
		var city=$('#city').val().trim();
		var country=$('#country').val().trim();
		var state=$('#state').val().trim();
		var ar=$('#areacode').val().trim();
		
		var msg='';
		if(clientcode=='')
			{
			$('#ecc').css('display','block');	
			}
		else
			{
			$('#ecc').css('display','none');	
			}
		
	
		if(address1=='')
		{
			$('#ea').css('display','block');		
		}
		else
			{
			$('#ea').css('display','none');
			}
		
		
		
	if(clientname=='')
	{
		valid4=0;
		msg='Enter client name ';
		
		$('#ecn').text(msg);
		$('#ecn').css('display','block');	
	}
	else
		{
		valid4=1;
		}
	
	if(ar=='')
	{
		valid=0;
		msg='Enter areacode ';
		$('#eac').text(msg);
		$('#eac').css('display','block');	
	}		
	else
		{
		valid=0;
		}
	if(city=='')
	{
		valid5=0;
		msg='Enter city name';
		$('#ec').text(msg);
		$('#ec').css('display','block');
	}
	else
		{
		valid5=1;
		}
	if(country=='')
	{
		valid6=0;
		msg='Enter country name';
		$('#ecountry').text(msg);
		
		$('#ecountry').css('display','block');	
	}
	else
		{
		valid6=1;
		}
	if(state=='')
	{
		valid7=0;
		msg='Enter state name';
		$('#ecs').text(msg);
		$('#ecs').css('display','block');	;	
	}
	else
		{
		valid7=1;
		}
	if(tempVal=='')
	{
		valid1=0;
		msg='Enter phoneno ';
		$('#epn').text(msg);
		$('#epn').css('display','block');	
	}
	else
		{
		valid1=1;
		}
if(zipcode=='')
	{
		valid2=0;
		msg='Enter zipcode ';
		$('#ecz').text(msg);
		$('#ecz').css('display','block');	
	}
else
	{
	valid2=1;
	}
		if(website=='')
		{
			valid3=0;
			msg='Enter website ';
			$('#ecw').text(msg);
			$('#ecw').css('display','block');	
		}
		else
			{
			valid3=1;
			}
		
				
				var f=$("#form").serializeArray();
				$.each(f, function(i, field){
					
					if(field.name==="personname")
						{
						if(field.value=='')
							{
							valid8=valid8+0;
							alert('Enter contact person name');
							}
						else
							{
							valid8=valid8+1;
							}
						}
					if(field.name==="personmail")
						{
						var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
						if(field.value=='')
							{
							valid9=valid9+0;
							alert('Enter contact person email ID');
							}
						
						else if(filter.test((field.value)))
							{
							valid9=valid9+1;
							}
						else
							{
							valid9=valid9+0;
							alert('invalid emailId');
							}
						}
					if(field.name==="personno1")
					{
					if(field.value=='')
						{
						valid10=valid10+0;
						alert('Enter contact number');
						}
					
					else if(/^\d+$/.test(+field.value))
						{
						valid10=valid10+1;
						}
					else
						{
						valid10=valid10+0;
						alert('invalid contact number');
						}
					}
					
		        });
//alert('valid1'+valid1+'valid2'+valid2+'valid3'+valid3+'valid4'+valid4+'valid5'+valid5+'valid6'+valid6+'valid7'+valid7+'valid8'+valid8+'valid9'+valid9+'valid10'+valid10);
		if(clientcode!=''&&address1!=''&&valid1==1&&valid2==1&&valid3==1&&valid4==1&&valid5==1&&valid6==1&&valid7==1&&valid8==(count-1)&&valid9==(count-1)&&valid10==(count-1))
			{
			var url6 = "rest/webservices/editcustomerdetails";
			var myform = document.getElementById("form");
			var data =$("#form").serializeArray();
			$.ajax({
				url: url6,
				type:"POST",
				data:$("#form").serializeArray(),
				async:false,
				success: function (data) {
					console.log("response:" + data.toString);
					if(data.status==0){
						var url = "rest/webservices/contactpersonedit";
						var data = $("#form").serializeArray();
						data.push({ name: "customer_id", value: customer_id });	
						$.ajax({
							url: url,
							type: 'POST',
							data:data,
							async:false,
							success: function (data) {
								console.log("response:" + data);
    			    
								if(data.status==0)
								{
	                	 
									alert("Updated successfully");
									window.location.href='clientdashborad.jsp'
								}
	      
							},error : function(msg) {
								event.preventDefault();
    			    			console.log("User customer Details not found", msg);
//    			    				alert("Opps! Sorry Contact Person Update Fail");	
    			    		}
    			});
    		 }
    		
    },error : function(msg) {
    	event.preventDefault();
			console.log("User customer Details not found", msg);
//				alert("Opps! Sorry Contact Person Update Fail");	
		}
    		

});
			}
		else
		{
		event.preventDefault();
		}
		
	});
});


function cancel5() 
{
	
	
	window.location.href='clientdashborad.jsp';




}
function handleInput(e) {
	   var ss = e.target.selectionStart;
	   var se = e.target.selectionEnd;
	   e.target.value = e.target.value.toUpperCase();
	   e.target.selectionStart = ss;
	   e.target.selectionEnd = se;
	}

var msg='';
$().ready(function(){
	$("#clientcode").keyup(function (event){
		var clientcode=$('#clientcode').val().trim();
		if(clientcode=='')
		{
		$('#ecc').css('display','block');	
		}
	else
		{
		$('#ecc').css('display','none');	
		}

	});
});
$().ready(function(){
	$("#address1").keyup(function (event){
		var address1=$('#address1').val().trim();
		if(address1=='')
		{
			$('#ea').css('display','block');		
		}
		else
			{
			$('#ea').css('display','none');
			}
	});
});
$().ready(function(){
	$("#clientname").keyup(function (event){
		valid4=0;
		var clientname=$('#clientname').val().trim();
		var na=/^[ A-Za-z_.]*$/;
		var regexname= /^[a-zA-Z\s]*$/;
		if(clientname=='')
		{
			valid4=0;
			msg='Enter client name ';
			$('#ecn').text(msg);
			$('#ecn').css('display','block');	
		}
		else if(na.test(clientname.toString())) 
			{
			valid4=1;
			
			$('#ecn').css('display','none');
			}
		else
			{
			valid4=0;
			msg='Enter valid client name';
			$('#ecn').text(msg);
			$('#ecn').css('display','block');
			}
	});
});
var msg='';
$().ready(function(){

	$("#areacode").keyup(function (event){	
		valid=0;
		var ar=$('#areacode').val().trim();
		var gg='';
		if(ar=='')
		{
			valid=0;
			msg='Enter areacode ';
			$('#eac').text(msg);
			$('#eac').css('display','block');	
		}
		
		else{
		if(ar.charAt(0)=="+")
			{
			  
			     for(var i=1;i<ar.length;i++)
				 {
			    	gg=gg+ ar.charAt(i);
			    	$('#eac').css('display','none');
				 }	
			     
				if(!isNaN(gg))
				    {
					
					valid=1;
					$('#eac').css('display','none');
				     }
				else
					 {
					 valid=0;
					 msg='Enter only number ';
						$('#eac').text(msg);
						$('#eac').css('display','block');	
					 }
				  }
			
			
		else
			  {
			  valid=1;
			  msg='Start with plus ';
				$('#eac').text(msg);
				$('#eac').css('display','block');	
		      }
		
		}
	});
});
$().ready(function(){

	$("#city").keyup(function (event){
		valid5=0;
		var regexname= /^[a-zA-Z\s]*$/;
		var city=$('#city').val().trim();
		if(city=='')
		{
			valid5=0;
			msg='Enter city name';
			$('#ec').text(msg);
			$('#ec').css('display','block');
		}
		else if(regexname.test(city.toString()))
		{
		valid5=1;
		$('#ec').css('display','none');
		}
		else
		{
		valid5=0;
		msg='Enter valid city name';
		$('#ec').text(msg);
		$('#ec').css('display','block');
		}
	});
});

$().ready(function(){

	$("#country").keyup(function (event){
		valid6=0;
		var regexname= /^[a-zA-Z\s]*$/;
		var country=$('#country').val().trim();
		if(country=='')
		{
			valid6=0;
			msg='Enter country name';
			$('#ecountry').text(msg);
			
			$('#ecountry').css('display','block');	
		}
		else if(regexname.test(country.toString()))
		{
			valid6=1;
			$('#ecountry').css('display','none');
		}
		else
		{
		valid6=0;
		msg='Enter valid country name';
		$('#ecountry').text(msg);
		$('#ecountry').css('display','block');
		}
	});
});

$().ready(function(){

	$("#state").keyup(function (event){
		valid7=0;
		var regexname= /^[a-zA-Z\s]*$/;
		var state=$('#state').val().trim();
		if(state=='')
		{
			valid7=0;
			msg='Enter state name';
			$('#ecs').text(msg);
			$('#ecs').css('display','block');	;	
		}
		else if(regexname.test(state.toString()))
		{
		valid7=1;
		
		$('#ecs').css('display','none');
		}
		else
		{
		valid7=0;
		msg='Enter valid state name';
		$('#ecs').text(msg);
		$('#ecs').css('display','block');
		}
		
		
	});
});


$().ready(function(){

	$("#phoneno").keyup(function (event){
		var tempVal = $('#phoneno').val().trim();
		valid1=0;
		if(tempVal=='')
		{
			valid1=0;
			msg='Enter phoneno ';
			$('#epno').text(msg);
			$('#epno').css('display','block');	
		}
		else if (/^\d+$/.test(+tempVal))
			{  
			valid1=1;
			$('#epno').css('display','none');
			}
		else
			{ 
			valid1=0;
			msg='Enter valid phoneno';
			$('#epno').text(msg);
			$('#epno').css('display','block');
			}
	});
});

$().ready(function(){
	
	$("#website").keyup(function (event){
		var website=$('#website').val().trim();
		valid3=0;
var url=/^(www+\.)?[a-zA-Z0-9]+\.([a-zA-Z]{2,4})\/?/;
if(website=='')
{
	valid3=0;
	msg='Enter website ';
	$('#ecw').text(msg);
	$('#ecw').css('display','block');	
}
else	if (url.test(website.toString())) 
{
valid3=1;
$('#ecw').css('display','none');
}
else
{
	valid3=0;
	msg='Enter valid  webaddress ';
	$('#ecw').text(msg);
	$('#ecw').css('display','block');	
}
	});
});


$().ready(function(){

	$("#zipcode").keyup(function (event){
		var zipcode=$('#zipcode').val().trim();
		valid2=0;
		if(zipcode=='')
		{
			valid2=0;
			msg='Enter zipcode ';
			$('#ecz').text(msg);
			$('#ecz').css('display','block');	
		}
		
			else
				{
				valid2=1;
				$('#ecz').css('display','none');
				
				}
	});
});
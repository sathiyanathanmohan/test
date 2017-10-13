var a;
var project_code;
$( window ).load(function() {
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
		if(user2!=null){
			if( designation!='admin'&&designation!='project_manager')
			{
			 location.href='timesheetentry.html';
			}
		else{	
	   $('#welcomeuser').append("<b>Welcome "+user2+" !!!</b>") ;
var m,n;	 
var	y ;
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
		y = getParams();
	a= unescape(y["a"]);

 	$(document).ready(function(){	
 	
	
		
		 var url = "rest/webservices/getproject?id="+a;

			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
			            for ( var i in object) {
			            	
			            	project_code=object[i].project_code;
			            	$("#headtag").append('<b>'+object[i].project_code.toUpperCase()+'-'+object[i].project_name.toUpperCase()+'</b>');
			            	document.getElementById("pro_code").value = project_code;
			            	call();
			            	
			            	}
						},
						error : function(msg) {
							console.log("User project Details not found", msg);
						}
					});
	function call()
		{
         	var url1 = "rest/webservices/allallocation?project_code="+project_code;
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url1,
	        success: function(data) {
	            console.log("response:" + data);					
					var object1=data.object;
					   $('#example').DataTable();
	            for ( var i in object1) {	          
	            	
                  $("#c1").append('<tr align="center"><td ><a id="edit" href="javascript:show('+object1[i].id +');">'+object1[i].emp_code+'</a></td><td>'+object1[i].emp_name+'</td><td>'+object1[i].location+'</td><td>'+object1[i].percentage_allocation+'</td><td>'+object1[i].start_date+'</td><td>'+object1[i].end_date+'</td><td>'+object1[i].project_manager+'</td></tr>');	           
                  $('#example').DataTable();	            
	            }
				},
				error : function(msg) {
					console.log("Project_code not found", msg);
				}
         	});
	 	}
		});
	
 	empid();	
 	manager();
		}
		}else{
	    	  location.href='index.html';
	    }
});







function empid()
{
	$().ready(function(){
var url3 = "rest/webservices/all_employee_details";
	
	$.ajax({
	
	        type: "GET",
	        dataType:"json",
	        url: url3,
	        success: function(data) {
	            console.log("response:" + data);
	            $('#empid1 p').remove();
	            $('#en').val('');
            	$('#loc').val('');
					var object1=data.object;
					
	            for ( var i in object1) {
	            	
	            	$("#empid").append('<option value='+object1[i].emp_code+'>'+object1[i].emp_code+"-"+object1[i].first_name+'</option>');
	            }
				},
				error : function(msg) {
					console.log(" emp_code not found", msg);
				}
			});
	});
	}




function manager()
{
	
	var url = "rest/webservices/getallemployee?designation=project_manager";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {

	            	$("#managerid")
					.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');
	            }
				},
				error : function(msg) {
				
				}
			});
	}


















$().ready(function(){
	$('#empid').change(function() {
		var k=$(this).val(); 
	
			
			$('#en').val('');
			$('#loc').val('');

//				var key = e.which;
//				if (key == 13) // the enter key code
//				{
					var url2 = "rest/webservices/getemployee?emp_code="+k;

					$.ajax({
					
					        type: "GET",
					        dataType:"json",
					        url: url2,
					        success: function(data) {
					            console.log("response:" + data);
					           
									var object1=data.object;
									
					            for ( var i in object1) {
					            	
					            	var name= object1[i].first_name;
					            	//alert( object1[i].first_name);
					            	$('#en').val(name);
					            	$('#loc').val(object1[i].location);
					            }
								},
								error : function(msg) {
									console.log(" emp_code not found", msg);
								}
							});
		

	});
	});





$().ready(function(){
	$('#eempid').change(function() {
		var k=$(this).val(); 
	
			
			$('#een').val('');
			$('#eloc').val('');

//				var key = e.which;
//				if (key == 13) // the enter key code
//				{
					var url2 = "rest/webservices/getemployee?emp_code="+k;

					$.ajax({
					
					        type: "GET",
					        dataType:"json",
					        url: url2,
					        success: function(data) {
					            console.log("response:" + data);
					           
									var object1=data.object;
									
					            for ( var i in object1) {
					            	
					            	var name= object1[i].first_name+" "+object1[i].last_name;
					            	//alert( object1[i].first_name);
					            	$('#een').val(name);
					            	$('#eloc').val(object1[i].location);
					            }
								},
								error : function(msg) {
									console.log(" emp_code not found", msg);
								}
							});
		

	});
	});




var empidclickcount=0;
$().ready(function(){
	$('#eempid').click(function() {
	
		if(empidclickcount==0)
		{
			var url3 = "rest/webservices/getallemployee?designation=associate";
			var eempi=$("#eempi").val();
			$.ajax({
			
			
			        type: "GET",
			        dataType:"json",
			        url: url3,
			        success: function(data) {
			            console.log("response:" + data);
			           // $('#eempid1 p').remove();
			           // $('#een').val('');
		            	//$('#eloc').val('');
							var object1=data.object;
							//$("#eempid option").remove();
			            for ( var i in object1) {
			            	if(eempi!=object1[i].emp_code)
			            	$("#eempid").append('<option value='+object1[i].emp_code+'>'+object1[i].emp_code+'-'+object1[i].first_name+'</option>');
			            }
						},
						error : function(msg) {
							console.log(" emp_code not found", msg);
						}
					});
			empidclickcount=1;
		}
			
	});
	});


var managerclickcount=0;

$().ready(function(){
	$('#emanagerid').click(function() {
		
		if(managerclickcount==0)
		{
			var url = "rest/webservices/getallemployee?designation=project_manager";

			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
			            for ( var i in object) {

			            	$("#emanagerid")
							.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');
			            }
						},
						error : function(msg) {
						
						}
				
					});
			managerclickcount=1;
		}
			
	});
	});






var verfiy=1;

var valid2=1;



$().ready(function(){
$("#save").click(function (){
		
	var valid1=1;
	 var	per=1;
	
	var url1 = "rest/webservices/getproject?id="+a;
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url1,
	        success: function(data) {
	        	var msgstart='';
	            console.log("response:" + data);
	           
	            var object1=data.object;
	            	var d = new Date(object1[0].start_date); 
	                var str = $.datepicker.formatDate('yy-mm-dd', d);
	            	var e = new Date(object1[0].end_date);
	            	var str1 = $.datepicker.formatDate('yy-mm-dd', e);
	            	
	            	var startdate=new Date($('#startdate').val());
	            	var str2 = $.datepicker.formatDate('yy-mm-dd',startdate);	            	
	            	var enddate=new Date($('#enddate').val());
	            	var str3 = $.datepicker.formatDate('yy-mm-dd',enddate);
	            	var str5=$.datepicker.formatDate('dd',startdate);
	            	var date1=new Date();
	            	var str6 = $.datepicker.formatDate('yy-mm-dd',date1);
	            	if($("#empid").val()=='Select')
	            	{
	            		alert("Select Employee Id");
	            	}else{
	            		if($("#poa").val()==""){
	            		
	            		alert("Percentage of allocation is Empty");
	            		}
	            		else{
	            			if($('#startdate').val()=='' || $('#enddate').val()==''){
	            			alert("Start Date OR End Date field is Empty");
	            		}else{
	            			if(str>str2){
	            		alert("Project Start is "+str+" so select start date greater than project start date");
	            		
	            	}else{
	            		if(str1<str2){
	            			
	            			alert("Project end  is "+str1+" so select start date less than project end date");
	            		}else
	            			{
	            			if(str3<str)
	            				{
	            				alert("Project Start  is "+str2+" so select end  date greater than project start date");
	            				}
	            			else
	            				{
	            				if(str3>str1){
	            					alert("Project end  is "+str1+" so select end date less than  date");
	            				}else{if(str2>str3)
	            					{
	            					alert("End date greater than Start date");
	            					}
	            				     else{
	            					var ch= verify();
	            				//	alert(ch);
	            					valid1=0;
	            					}
	            					 
	            				}
	            					
	            				}
	            			
	            			
	            		
	            			}
	            		}
	            	}
	            	
	            	}
	        }
	           
	        
	            	if( valid1==0 && ch==0)
	            		{
	            		//alert(save);
	            		save();
	            		}
	            	
				},
				error : function(msg) {
					console.log(" Project_code not found", msg);
				}
			});
	
	
	
	
	
	
	
	
	});

});











	
function save(){
	

	var url = "rest/webservices/projectallocation";
	
var data = $("#form").serialize();
$.ajax({
    url: url,
    type: 'POST',
    data:data,
    success: function (data) {
    	console.log("response:" + data.object);
  
   if(data.status==0){
	   alert("Employee allocated successfully");
	   location.reload();
	   
   }else{
	 
	   if(data.status==5)
		 {
		 alert("Error occurred due to some issue"+data.errorMessage);
		 }
	 else	
      {	   
		 alert("Check allocation filed please recheck");
         }
	   }
    },
error : function(msg) {
	console.log("allocation error", msg);
}
});

}	




var id;
function show(id1)
{
	
	
//		 $("#contentedit").css('display','block');
 		$("#content").css('display','none');
		 $("#contentedit").css('display','block');
 	
	
	 id=id1;

	document.getElementById("id").value = id;
var url3 = "rest/webservices/oneallocation?id="+id;

	$.ajax({
	
	        type: "GET",
	        dataType:"json",
	        url: url3,
	        success: function(data) {
	            console.log("response:" + data);
					var object1=data.object;
					$("#eempid option").remove();
					$("#emanagerid option").remove();
	            for ( var i in object1) {

	            	var d = new Date(object1[0].start_date);
	            	var str = $.datepicker.formatDate('yy-mm-dd', d);
	            	
	            	var e = new Date(object1[0].end_date);
	            	var str1 = $.datepicker.formatDate('yy-mm-dd', e);
	            	
	            	
	            	
	            	$("#id").val(object1[i].id);
	            	$("#eempid").append("<option id='eempi' value="+object1[i].emp_code+">"+object1[i].emp_code+"-"+object1[i].emp_name+"</option>");
	            	$("#een").val(object1[i].emp_name);
	            	$("#eloc").val(object1[i].location);
	            	$("#epoa").val(object1[i].percentage_allocation);
	            	$("#estartdate").val(str);
	            	$("#eenddate").val(str1);
	            	$("#emanagerid").append("<option id='emanageri' value="+object1[i].project_manager+">"+object1[i].project_manager+"</option>");
	            	
	            }
				},
				error : function(msg) {
					console.log(" emp_code not found", msg);
				}
			});


}


$().ready(function(){
	
	
	
	
	$("#esave").click(function (e){
		var valid1=1;
		 var	per=1;
		
		var url1 = "rest/webservices/getproject?id="+a;
		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url1,
		        success: function(data) {
		        	var msgstart='';
		            console.log("response:" + data);
		           
		            var object1=data.object;
		            	var d = new Date(object1[0].start_date); 
		                var str = $.datepicker.formatDate('yy-mm-dd', d);
		            	var e = new Date(object1[0].end_date);
		            	var str1 = $.datepicker.formatDate('yy-mm-dd', e);
		            	
		            	var startdate=new Date($('#estartdate').val());
		            	var str2 = $.datepicker.formatDate('yy-mm-dd',startdate);	            	
		            	var enddate=new Date($('#eenddate').val());
		            	var str3 = $.datepicker.formatDate('yy-mm-dd',enddate);
		            	var str5=$.datepicker.formatDate('dd',startdate);
		            	var date1=new Date();
		            	var str6 = $.datepicker.formatDate('yy-mm-dd',date1);
		            	if($("#eempid").val()=='Select')
		            	{
		            		alert("Selcet Employee Id");
		            	}else{
		            		if($("#epoa").val()==""){
		            		
		            		alert("Percentage of allocation is Empty.");
		            		}
		            		else{
		            			if($('#estartdate').val()=='' || $('#eenddate').val()==''){
		            			alert("Start Date OR End Date filed is Empty");
		            		}else{
		            			if(str>str2){
		            		alert("Project Start is "+str+" so select start date greaterthan than project start date");
		            		
		            	}else{
		            		if(str1<str2){
		            			
		            			alert("Project end  is "+str1+" so select start date lessthan than project end date");
		            		}else
		            			{
		            			if(str3<str)
		            				{
		            				alert("Project Start  is "+str+" so select end  date greaterthan than project start date");
		            				}
		            			else
		            				{
		            				if(str3>str1){
		            					alert("Project end  is "+str1+" so select start date lessthan than project enddate");
		            				}else{if(str2>str3)
		            					{
		            					alert("End date graeter than Start date");
		            					}
		            				     else{
		            					var ch= everify();
		            					
		            					valid1=0;
		            					}
		            					 
		            				}
		            					
		            				}
		            			
		            			
		            		
		            			}
		            		}
		            	}
		            	
		            	}
		        }
		           
		        
		            	if( valid1==0 && ch==0)
		            		{
		            		//alert(save);
		            		esave();
		            		}
		            	
					},
					error : function(msg) {
						console.log(" project_code not found", msg);
					}
				});
	
	
	//update();
	});
	
	});
	



function esave(){

	var url = "rest/webservices/updateallocation";

	var data = $("#edit").serialize();
	$.ajax({
	    url: url,
	    type: 'POST',
	    data:data,
	    
	    success: function (data) {
	    	console.log("response:" + data.object);
	  
	   if(data.status==0){
		   alert("Employee allocation updated successfully");
		   location.reload();
		   
	   }else{ if(data.status==0){
		   alert(" Employee already allocated");
		   e.preventDefault();
	   }
	   
	   else{
		   alert("allocation failed please retry !");
		   e.preventDefault();
	   }
	   
	   }
	    	
	    },
	error : function(msg) {
		console.log("allocation update error", msg);
		 alert("allocation failed please retry !");
		   e.preventDefault();
	}
	});
	
	            

}























function verify()
{
	var empcode=$('#empid').val();
	var per=1;
	var sum=0;
	var vervalidate=1;
	var username=$('#username').val();
	var newpercentage=$('#poa').val();
    if ($('#poa').val() <=0||$('#poa').val() >100){
        alert('Percentage must be 1 to 100');
    }
    else
    	{	    	    	

var url1 = "rest/webservices/allallocationemp?emp_code="+empcode;
$.ajax({
        type: "GET",
        dataType:"json",
        async: false,
        url: url1,
        success: function(data) {
            console.log("response:" + data);
				
				var object1=data.object;
				
            for ( var i in object1) {
            	
           sum= sum+ parseInt(object1[i].percentage_allocation);
         
            }
//          alert('already allocated space:'+sum);
            
            
            if(sum>=100)
            	{
            	alert('Employees  already  100% allocated');
            	// return vervalidate
            	}
            else
            	{
            	var t=100-sum;
            	if(newpercentage>t)
            		{
            		alert('Percentage of allocation must be below or equal '+t);
            		// return vervalidate
            		}
            	else
            	{
//            	alert('verified successfully');
            	per=0;
            	
       
            	}
            	}
        
            
			},
			error : function(msg) {
				console.log(" project_code not found", msg);
			}


});

}
    return per ;	  	
	
	}




function everify()
{
	var empcode=$('#eempi').val();
	
	var url3 = "rest/webservices/oneallocation?id="+id;
var perviewall;
	$.ajax({
	
	        type: "GET",
	        dataType:"json",
	        url: url3,
	        async: false,
	        success: function(data) {
	            console.log("response:" + data);
	        	
				var object=data.object;
            for ( var i in object) {
            	
            	perviewall=object[i].percentage_allocation;
            	}
	           
	            
	            
	        },
	            error:function(data) {
	            	console.log("response:" + data);
	            }
	        });
	
	
	
	
	
	
	var per=1;
	var sum=0;
	var vervalidate=1;
	
	var newpercentage=$('#epoa').val();
    if ($('#epoa').val() <=0||$('#epoa').val() >100){
        alert('Percentage must be 1 to 100');
    }
    else
    	{	    	    	

var url1 = "rest/webservices/allallocationemp?emp_code="+empcode;

$.ajax({
        type: "GET",
        dataType:"json",
        async: false,
        url: url1,
        success: function(data) {
            console.log("response:" + data);
				
				var object1=data.object;
				
            for ( var i in object1) {
            	
           sum= sum+ parseInt(object1[i].percentage_allocation);
//         alert(sum);
            }
            
            sum=sum-perviewall;
//           alert(' already allocated space:'+sum);
            
            
            if(sum>=100)
            	{
            	alert('Employees  already  100% allocated');
            	// return vervalidate
            	}
            else
            	{
            	var t=100-sum;
            	if(newpercentage>t)
            		{
            		alert('Percentage of allocation must be below or equal '+t);
            		// return vervalidate
            		}
            	else
            	{
//            	alert('verified successfully');
            	per=0;
            	
       
            	}
            	}
        
            
			},
			error : function(msg) {
				console.log(" project_code not found", msg);
			}


});

}
    return per ;	  	
	
	}



$().ready(function(){


	$('#everify').click(function(){
		//alert("");
	var re=everify();
	if(re==0)
		alert("% allocated successfully");

//		alert("verfication fail please enter correct values")
	});	

});	








$().ready(function(){


	$('#verify').click(function(){
		//alert("");
	var re=verify();
	if(re==0)
		alert("% allocated successfully");
	
//		alert("verfication fail please enter correct values");
	});	

});	

$("poa").keydown(function(e){
	 -1!==$.inArray(e.keyCode,[46,8,9,27,13,110,190])||/65|67|86|88/.test(e.keyCode)&&(!0===e.ctrlKey||!0===e.metaKey)||35<=e.keyCode&&40>=e.keyCode||(e.shiftKey||48>e.keyCode||57<e.keyCode)&&(96>e.keyCode||105<e.keyCode)&&e.preventDefault()
	 });
	



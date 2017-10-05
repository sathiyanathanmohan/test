/**
 * 
 */

$(document).ready(function(){
$( window ).load(function() {	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2!=null){
		if(designation!='project_manager'&&designation!='admin')
		{
		 location.href='timesheetentry.html';
		}
		
	else{	
		if(designation!='admin')
		{
		 location.href='projectdashboard.jsp';
		}
		else{
		 $('#welcomeuser').append("<b>Welcome  "+user2+" !!!</b>") ;
		 
		 
		 
		 
		 
		 
			 
		 
		 
		 
}
	}
		
	}
		else
			{
			
			 location.href='index.html';
			
			
			}
			
		
	});
});

var des=[{"des":"admin"},{"des":"associate"},{"des":"project_manager"},{"des":"delivery_manager"},{"des":"onsite_coodernater"}];




$().ready(function(){


	$( "#emp_code" ).keyup(function(event) {

	
		var some=[];
    if(event.which==13){
    	
    	
    	
		var url2 = "rest/webservices/getemployee?emp_code="+$("#emp_code").val();
		$('#emp_name').val('');
		$('#emp_mail').val('');

		$.ajax({
		
		        type: "GET",
		        dataType:"json",
		        url: url2,
		        success: function(data) {
		            console.log("response:" + data);
		           
						var object1=data.object;
						document.getElementById("emp_name").disabled = false;
						document.getElementById("emp_mail").disabled = false;
						document.getElementById("emp_design").disabled = false;
						document.getElementById("emp_status").disabled = false;
						$("#emp_design option").remove();
						$("#emp_status option").remove();
						
		            for ( var i in object1) {
		            	
		            	var name= object1[i].first_name;
		            	//alert( object1[i].first_name);
		            	$('#emp_name').val(name);
		            	$('#row_id').val(object1[i].id);
		            	
		            	$('#emp_mail').val(object1[i].emp_mail);
		            	
		            	if(object1[i].status==1){
		            		$("#emp_status").append('<option value="1">&nbsp;&nbsp;&nbsp; De-Active </option><option value="0">&nbsp;&nbsp;&nbsp; In-Active </option>');	
		            	}

		            	if(object1[i].status==0){
		            		$("#emp_status").append('<option value="0">&nbsp;&nbsp;&nbsp; In-Active </option><option value="1">&nbsp;&nbsp;&nbsp; De-Active </option>');
		            		
		            	}
		            	
		            	
		            	
		            	
		            	
		            	
		            	
		            	var opti='<option value="'+object1[i].designation+'">'+object1[i].designation;
		            	  for ( var j in des) {
		            	if(object1[i].designation!=des[j].des)
		            		{
		            		opti=opti+'<option value="'+des[j].des+'">'+des[j].des;
		            		}
		            	
		            	  }
		            		$("#emp_design").append(opti);
		            	  
		            	  
		            }
					},
					error : function(msg) {
						console.log(" emp_code not found", msg);
					}
				});

    	
    	
    	
    	
    	
    	
    	
    	
    }
    else{
    var url = "rest/webservices/employeecodekeypress?emp_code="+$("#emp_code").val();

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	     
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
	            for ( var i in object) {
some.push(object[i].emp_code);
	            }
	            
	        }
	
	        });
	$( "#emp_code" ).autocomplete({
        source: some
      });
  	
    }
   });
	});
	
  


//$().ready(function(){


//$( "#emp_name" ).keyup(function(event) {
//  
//		var some=[];
//    if(event.which==13){
//    	
//    	
//    	
//		var url2 = "rest/webservices/getemployee?emp_code="+$("#emp_code").val();
//		$('#emp_name').val('');
//		$('#emp_mail').val('');
//
//		$.ajax({
//		
//		        type: "GET",
//		        dataType:"json",
//		        url: url2,
//		        success: function(data) {
//		            console.log("response:" + data);
//		           
//						var object1=data.object;
//						document.getElementById("emp_name").disabled = false;
//						document.getElementById("emp_mail").disabled = false;
//						document.getElementById("emp_design").disabled = false;
//						$("#emp_design option").remove();
//						
//		            for ( var i in object1) {
//		            	
//		            	var name= object1[i].first_name;
//		            	//alert( object1[i].first_name);
//		            	$('#emp_name').val(name);
//		            	$('#loc').val(object1[i].location);
//		            	
//		            	$("#emp_design").append('<option value="'+object1[i].designation+'">'+object1[i].designation+'<option value="associate">&nbsp;&nbsp;&nbsp; ASSOCIATE </option><option value="project_manager">&nbsp;&nbsp;&nbsp; Project_manager </option> <option value="onsite_coodernater">&nbsp;&nbsp;&nbsp; Onsite Co-Odernater </option><option value="delivary_manager">&nbsp;&nbsp;&nbsp; Delivery_manager </option><option value="admin">&nbsp;&nbsp;&nbsp; Admin </option>');
//		            }
//					},
//					error : function(msg) {
//						console.log(" emp_code not found", msg);
//					}
//				});
//
//    	
//    	
//    	
//    	
//    	
//    	
//    	
//    	
//    }
//    else{
//    var url = "rest/webservices/getemployeenamekeypress?emp_name="+$("#emp_name").val();
//
//	$.ajax({
//	        type: "GET",
//	        dataType:"json",
//	        url: url,
//	     
//	        success: function(data) {
//	            console.log("response:" + data);
//					
//					var object=data.object;
//	            for ( var i in object) {
//some.push(object[i].first_name);
//	            }
//	            
//	        }
//	
//	        });
//	$( "#emp_name" ).autocomplete({
//        source: some
//      });
//  	
//    }
//   });
//});

$().ready(function(){
$("#save").click(function (event){	
	 var emp_code=$("#emp_code").val().trim();
		var emp_name=$("#emp_name").val().trim();
		var emp_mail=$("#emp_mail").val().trim();
		var emp_design=$("#emp_design").val().trim();
		
		 var code_vail=1;
		 var name_vail=1;
		 var mail_vail=1;
		 var design_vail=1;
if(emp_code=='')
	{
	
	code_vail=1;
	$("#emp_code").css( "border"," solid 1px #FF0000");
	
	
	}else
		{
		code_vail=0;
		$("#emp_code").css( "border"," solid 1px #fff");
		}


if(emp_name=='')
	 {
	 name_vail=1;
	 
	 $("#emp_name").css( "border"," solid 1px #FF0000");
	 }else
		 {
		 
		 
		 
		 
		 name_vail=0;
		 $("#emp_name").css( "border"," solid 1px #fff");
		 
		 }



if(emp_mail=='')
	 {
	 mail_vail=1;
	 $("#emp_mail").css( "border"," solid 1px #FF0000");
	 
	 }else{
		 
		 
			    var x = emp_mail;
			    var atpos = x.indexOf("@");
			    var dotpos = x.lastIndexOf(".");
			    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
			        alert("Invalid e-mail address");
			        $("#emp_mail").css( "border"," solid 1px #FF0000");
			        mail_vail=1;
			        
			    }
			    else{	
		 mail_vail=0;
		 $("#emp_mail").css( "border"," solid 1px #fff"); 
	 
			    }
			    }


if(emp_design=='')
	 {
	 design_vail=1;
	 $("#emp_design").css( "border"," solid 1px #FF0000");
	 }else{
		 design_vail=0;
		 $("#emp_design").css( "border"," solid 1px #fff");
	 }


if(code_vail ==0&& name_vail==0 && mail_vail==0 && design_vail==0)
	 {
	 
	 var url = "rest/webservices/editemployee";
//		var myform = document.getElementById("form");
//		alert(url);
		var data = $("#form").serializeArray();
		$.ajax({
			 url: url,
			    type: 'POST',
			    data:data,
			    async:false,
		    success: function (data) {
		    	console.log("response:" + data.toString);
		    	
//		    	alert(data.id);
		    		 if(data.status==0){
		    		 alert("Employee updated successfully")
		    		 cancel5();
		    		 }
		    		
		    			 else{
		    		 if(data.status==-5)
		    			 {
		    			 alert("Employee ID already exists");
		    			 event.preventDefault();
		    			 }else
		    				 {
		    				 console.log("Employee updation failed")
			    			 event.preventDefault();

		    				 }
		    			 
		    		 }
	 
	
		    },error : function(msg) {
	    	event.preventDefault();
				console.log("User Employee update not found", msg);
//					alert("Employee updation failed");	
			}
		   
		});
	 
	 
	 
	 
	 }else{
		 alert("Fill mandatory fields");
		 event.preventDefault();
	 }




});
});



function alphanumber(evt) {

	 evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	   
	    if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode!=32 && charCode!=190&&charCode > 31 && (charCode < 48 || charCode > 57)  ) {
	        return false;
	        
	    }
	    return true;
	}




	function onlyAlphabets(evt) {

		 evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		   
		    if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode!=32 && charCode!=190  ) {
		        return false;
		        
		    }
		    return true;
		}





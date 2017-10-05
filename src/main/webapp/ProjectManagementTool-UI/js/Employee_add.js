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
			 
			 var url = "rest/webservices/createemployee";
//				var myform = document.getElementById("form");
//	 			alert(url);
				var data = $("#form").serializeArray();
				$.ajax({
					 url: url,
					    type: 'POST',
					    data:data,
					    async:false,
				    success: function (data) {
				    	console.log("response:" + data.toString);
				    	
//	 			    	alert(data.id);
				    		 if(data.status==0){
				    		 alert("Employee added successfully")
				    		 cancel5();
				    		 }
				    		
				    			 else{
				    		 if(data.status==-5)
				    			 {
				    			 alert("Employee ID already exists");
				    			 event.preventDefault();
				    			 }else
				    				 {
				    				 console.log("Employee creation  failed")
					    			 event.preventDefault();

				    				 }
				    			 
				    		 }
			 
			
				    },error : function(msg) {
			    	event.preventDefault();
						console.log("Employee creation not found", msg);
//							alert("Employee creation  failed");	
					}
				   
				});
			 
			 }else{
				 alert("Fill mandatory fields");
				 event.preventDefault();
			 }
		 
		 
		 
		 
		 });
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		}
	}
	}

	else{
		  location.href='index.html';
	}

	
});		
});







$().ready(function(){
	
	$("#emp_code").keyup(function(){
	
		
		
		
		
		
	})
	
	
}
);



function cancel5() 
{
	
	
	 location.href='projectdashboard.jsp';


}




function onlyAlphabets(evt) {

	 evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	   
	    if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode!=32 && charCode!=190  ) {
	        return false;
	        
	    }
	    return true;
	}


function alphanumber(evt) {

	 evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	   
	    if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode!=32 && charCode!=190&&charCode > 31 && (charCode < 48 || charCode > 57)  ) {
	        return false;
	        
	    }
	    return true;
	}

	

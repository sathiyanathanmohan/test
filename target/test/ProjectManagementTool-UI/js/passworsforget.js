/**
 * 
 */
$(document).ready(function(){
	$("#submit").click(function(event){
		if($("#emp_code").val()!=''){
	var url="rest/webservices/forgetpassword?emp_code="+$("#emp_code").val();
	$.ajax({
		 url: url,
		    type: 'POST',
		   
		    
		    beforeSend: function(){
		    	document.getElementById('body').style.backgroundColor = "#3A3C4C";
		    	 document.getElementById('txt').style.display = "none";
		 	    	document.getElementById('wait').style.display = "block";
		    	
		        },
	    success: function (data) {
	    	document.getElementById('body').style.backgroundColor = "white";
	        document.getElementById('txt').style.display = 'block';
	    	document.getElementById('wait').style.display = 'none';
	    	console.log("response:" + data);
	    	if(data.status==0){
	    	alert("CODE Sent your mail id  Sucess");
	    	window.location.href="index.html";
	    	}
	    	else{
	    		 
	    		alert(data.errorMessage);
	    		event.preventDefault();
	    	}
//	    	if(data.status==-5)
//	    		{
//	    		 
//	    		alert("NO EMP CODE FOUND");
//	    		event.preventDefault();
//	    		}
	    	
	    	
	    },error : function(msg) {
	    	document.getElementById('body').style.backgroundColor = "white";
	        document.getElementById('txt').style.display = 'block';
	    	document.getElementById('wait').style.display = 'none';
		    	
	        	event.preventDefault();
	    			console.log("User customer Details not found", msg);
	    				alert("Opps! Sorry Mail Sent Fail");	
	    		}
	});
	
		}
		else{
			alert("Enter User Name");
		}
	
	});	

	
});

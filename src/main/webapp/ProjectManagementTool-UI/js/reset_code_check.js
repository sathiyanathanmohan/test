/**
 * 
 */



$().ready(function(){
	
	
	
	
	$('#submit').click(function() {
		if($("#newpassword").val()!='' &&$("#confirmnewpassword").val()!=''){
		if($("#newpassword").val()==$("#confirmnewpassword").val())
		{
		var url="rest/webservices/passwordchange?emp_code="+$("#empcode").val()+"&newpassword="+$("#newpassword").val();
		
		$.ajax({
			 url: url,
			    type: 'POST',
			       async:false,
		    success: function (data) {
		    	console.log("response:" + data);
		    	alert("Updated Sucess");
		    	window.location='index.html';
		    	
		    	
		    },error : function(msg) {
		        	event.preventDefault();
		    			console.log("User customer Details not found", msg);
		    				alert("Opps! Sorry Contact Person Update Fail");	
		    		}
		});
		}
		else
			{
			alert("Password Mismatch !!!");
			}
	}
	else{
		alert("Password Not Empty")
	}
});
});

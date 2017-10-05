
var ps='';
var p1='';
var code='';
var user='';
$().ready(function(){
	
	 code= checkCookie2(decodeURIComponent(document.cookie));
user= checkCookie(decodeURIComponent(document.cookie));
//		alert('user'+user);
		 if(user==null)
			 {
			 location.href='index.html';
			 }
		 else
			 {
			 $('#welcomeuser').append("<b>Welcome "+user.charAt(0).toUpperCase() + user.slice(1)+" !!!</b>") ;
			 }
		
});
$().ready(function(){

//	alert('pass'+code);
	var url = "rest/webservices/updatelogin?emp_code="+code;

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					ps=object[0].password;
//					alert('ps'+ps);
				},
				error : function(msg) {
				
				}
			});
	$("#save").click(function (event){	
//	alert('ps'+ps);
	p1=$('#OLDpwd').val();
	var np=$('#newpassword').val();
	var nps=$('#conpassword').val();
	var v1=0;
	var v2=0;
	if(p1=='')
		{
		alert('Enter old password');
		}
	else
		{
		if(ps==p1)
		{
		v1=1;
//		alert('same');
		}
	else
		{
		v1=0;
		alert('Old password not match');
		}
		}
	if(np==''&&nps=='')
		{
		alert('Enter your new passwords');
		}
	else
		{
		if(np==nps)
		{
		v2=1;
		}
	else
		{
		v2=0;
		alert('confirm password mismatch');
		}
		}
	
	if(v1==1&&v2==1)
		{
		if(p1==np)
			{
			alert('You used this password recently.Choose a different one');
			}else
				{
		$("#id").val(code);
		//alert('verified'+$('#id').val());
		var url = "rest/webservices/updatepassword";
		var data = $("#form").serialize();
		$.ajax({
			url: url,
		    type: 'POST',
		    data:data,
		    async:false,
		    success: function (data) {
		    	console.log("response:" + data.toString());
		    	if(data.status==0)
		    		{
		       alert('Password changed successfully');
		    	 location.href='projectdashboard.jsp';
		    		}
		    	else
		    		{
		    		alert('Password updation failed');
		    		}
		    	
		    },
		    error: function (msg) {
		       alert('Password updation failed'); 
		}
		});
				}
		}else
			{
			
			event.preventDefault();
			}
	});
	
});
 

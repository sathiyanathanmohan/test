var name;
$().ready(function(){
	
	 code= checkCookie2(decodeURIComponent(document.cookie));
user= checkCookie(decodeURIComponent(document.cookie));
var designation=checkCookie3(decodeURIComponent(document.cookie));
if(user!=null)
	{
	if(designation!='project_manager'&&designation!='admin')
	{
	 location.href='empdashboard.jsp';
	}
	else if(designation!='admin'&& designation=='project_manager')
	{
	location.href='managerdashboard.jsp';
	}
	else
	{
	 var url = "rest/webservices/all_employee_details";

		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);
						
						var object=data.object;
						$("#empid option").remove();
						$("#empid")
						.append(' <option value=>Select</option>');
		            for ( var i in object) {

		            	$("#empid")
						.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');
		            }
					},
					error : function(msg) {
					
					}
				});
		   
		}
	}
else
	{
	 location.href='index.html';
	
	}
});
 
 
 $().ready(function(){
$('#empid').change(function() {
	 var url = "rest/webservices/getemployee?emp_code="+$('#empid').val();

		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);	
						var object=data.object;
						$("#empname").val(object[0].first_name);
						name=object[0].first_name;
						
					},
					error : function(msg) {
					
					}
				});


	});
});

 
 
 $().ready(function(){
	 
	 
	
		 
	 
	 $("#save").click(function (event){
		 if($("#empname").val().trim()!='')
{
		 if($("#designation").val()!='')
		 {
		 if($("#pass").val().trim()!=''){
		 var c=$('#empid').val();
//		 alert(c);
		 var url = "rest/webservices/logincreation";
			var data = $("#form").serialize();
			$.ajax({
				url: url,
			    type: 'POST',
			    data:data,
			    async:false,
			    success: function (data) {
			    	console.log("response:" + data.id);
			    	
			    	if(data.status==0){
			    		   alert("Login created successfully");
			    		   location.reload();
			    		   
			    	   }else{
			    		 
			    		   if(data.status==5)
			    			 {
			    			 console.log(data.errorMessage);
			    			 }
			    		 else	
			    	           {	   
			    			 alert("Login already created");
			    	         }
			    		   }
			    },
			    error: function (msg) {
			    	console.log(msg);
			        
			}
			});
		 }else{
			 alert("Enter password");
		 }
		 }else{
			 alert("Select role");
		 }
}
		 else
			 {
			 alert("Select employee ");
			 }
	 });
		
 });

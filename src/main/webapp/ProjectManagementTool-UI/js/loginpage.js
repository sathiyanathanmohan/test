function getlogin(){
	login();
	
}

$('#login').click(function(){
	login();
});


var assoicate="associate";
var manager="project_manager";
var c=0;
var pro_manager= '';
	 var emp_code;
	var role;
	 function login(){
		 var username=$('#username').val();
		 var password=$('#password').val();
//		var data = $("#form").serialize()
		    var url = "rest/webservices/getlogin?username="+username+"&password="+password;
//		    alert(url);

			$.ajax({
			        type: "POST",
			        dataType:"json",
			        url: url,
			        async:false,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
							for ( var i in object) {
								
								emp_code=object[i].emp_id;
								role=object[i].role;
							}
							
			           if(data.status==0){
			        	   alert("Login Successful");
			        	
			        	   document.cookie = "designation="+role;
//			        	   alert(role);

			        	      var url2 = "rest/webservices/getemployee?emp_code="+emp_code;

								$.ajax({
								
								        type: "GET",
								        dataType:"json",
								        url: url2,
								        success: function(data) {
								            console.log("response:" + data);
								           
												var object1=data.object;
												
								            for ( var i in object1) {
								            //	alert(object1[i].designation);
								            	 document.cookie = "username="+object1[i].first_name;
								            	
								            	 document.cookie = "emp_code="+object1[i].emp_code;
								            	 
//								            	 var re = new RegExp( object[i].designation);
								            									            	 
								            	 if(role=="associate")
								            		 {
//								            		 alert("associate");
								            		 
								            		 window.location.href="empdashboard.jsp";
								            		 
								            		 
								            		 
								            		 }
								            	 if(role=="project_manager")
							            		 {
								            		 var url3 = "rest/webservices/getallproject";
								            			
								            			$.ajax({
								            			
								            			        type: "GET",
								            			        dataType:"json",
								            			        url: url3,
								            			        success: function(data) {
								            			            console.log("response:" + data);
								            							var object1=data.object;
								            							c=0;
								            			            for ( var i in object1) {
								            			            	pro_manager=object1[i].project_manager;
								            			            	if(username.toLowerCase() === pro_manager.toLowerCase())
								            			            		{
								            			            		c=c+1;
								            			            		}
								            			            }
								            			            if(c>0)
										            				{
								            			            	window.location.href="managerdashboard.jsp";
											            				}
											            			else
											            				{
											            				window.location.href="projectlead.jsp";
											            				}
								            						},
								            						error : function(msg) {
								            							console.log(" emp_code not found", msg);
								            						}
								            					});
								            			
							            		 }
								            	 

								            	 if(role=="admin")
								            		 
							            		 {
						                        window.location.href="projectdashboard.jsp";
							            		 }
							            	
								            }
											},
											error : function(msg) {
												console.log(" emp_code not found", msg);
											}
										});
			        	      
			        	      
			        	      
			        	      
			        	      
			        	      
			        	      
			        	      
			        	      
			        	      
			        	      
			        	
			        	     // window.location("projectallocation.html");
			           
			           }	else{
			        	   alert("Username or Password mismatch ");
			           }           
			            	
						},
						error : function(msg) {
							alert("error"+msg);
							console.log("User username not found", msg);
						}
					});
		}
			 
	 
	
	 
	 
	 
	 
	 
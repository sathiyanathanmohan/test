/**
 * 
 */var activitycode='';
var activitycodetimesheet;
var rejected_reason=''; 
var rowcount=1;
var row;
var projectappend='';
var project_name9;
var approved='';
var emp_code='';
var designation='';
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
     emp_code=checkCookie2(decodeURIComponent(document.cookie));
     designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2==null){
		
		location.href='index.html'
	}
	else{
	
		 $('#welcomeuser').append("<b>Welcome "+user2.charAt(0).toUpperCase() + user2.slice(1)+" !!!</b>") ;
			
		 $('#approved_by').val(emp_code);
	 	//	alert(emp_code); 
		 
//		alert(designation);
		if(designation=='admin')
			{
			var url = "rest/webservices/timesheetapproval?project_manager="+emp_code;

			$.ajax({
			        type: "GET",
			        dataType:"json",
			        url: url,
			        success: function(data) {
			            console.log("response:" + data);
							
							var object=data.object;
							$("#selectcombo option").remove();
							$("#selectcombo")
							.append(' <option value=>Select</option><option value="all">Over All</option>');
			            for ( var i in object) {

			            	$("#selectcombo")
							.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].emp_name+'</option>');
			            }
						},
						error : function(msg) {
						
						}
					});
			}
		else
			{
			 var url = "rest/webservices/emptimesheet?project_manager="+emp_code;

				$.ajax({
				        type: "GET",
				        dataType:"json",
				        url: url,
				        success: function(data) {
				            console.log("response:" + data);
								
								var object=data.object;
								$("#selectcombo option").remove();
								$("#selectcombo")
								.append(' <option value=>Select</option><option value="all">Over All</option>');
				            for ( var i in object) {

				            	$("#selectcombo")
								.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].emp_name+'</option>');
				            }
							},
							error : function(msg) {
							
							}
						});
			} 
		
	 		
	}
	});
});
	
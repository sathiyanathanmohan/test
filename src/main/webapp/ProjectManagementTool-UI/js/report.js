/**
 * 
 */
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));

	if(user2!=null){
		 $('#welcomeuser').append("<b>Welcome "+user2.charAt(0).toUpperCase() + user2.slice(1)+" !!!</b>") ;
	
		 
		 var url = "rest/webservices/report1?project_code=ECB00002";
		 
		
		 alert(url);
		   $.ajax({
		       type: "GET",
		       dataType:"json",
		       url: url,
		       success: function(data) {
		           console.log("response:" + data);
		 				
		 				var object=data.object;
		 				var object2=object[0].employee;
		           for ( var i in object2) {

		           alert(object2[i].emp_name);
		           }
		 			},
		 			error : function(msg) {
		 			
		 			}
		 		});

		 
		 
		 
		 
		 
		 
		 
	}
	
});
});

$().ready(function(){
$('#etc').change(function() {
	var url = "rest/webservices/getallemployee?designation="+$("#etc").val();

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					$("#serach option").remove();
					$("#serach")
					.append(' <option value=>Select</option>');
	            for ( var i in object) {

	            	$("#serach")
					.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');
	            }
				},
				error : function(msg) {
				
				}
			});
});



$('#serach').change(function() {
  var url = "rest/webservices/report?emp_code="+$("#serach").val();
alert(url);
  $.ajax({
      type: "GET",
      dataType:"json",
      url: url,
      success: function(data) {
          console.log("response:" + data);
				
				var object=data.object;
				
          for ( var i in object) {

          
          }
			},
			error : function(msg) {
			
			}
		});


});



















});
	
function call(){
	
	
	
	

	
	}

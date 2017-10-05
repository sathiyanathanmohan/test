/**
 * 
 */$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	var code=checkCookie2(decodeURIComponent(document.cookie));
	if(user2!=null){
		
		  $('#example').DataTable();
		  if(designation!='project_manager'&&designation!='admin')
			  {
			  location.href='timesheetentry.html';
			  }
		  else if(designation=='admin')
			  {
			  location.href='projectdashboard.jsp'
			  }
		  else
		{
			$('#managerid1').append(code);
			$('#managername').append(user2);
			$('#designation').append(designation);
			 $('#welcomeuser').append("<b>Welcome "+user2+" !!!</b>") ;
			  var url = "rest/webservices/managerview?project_manager="+code;	
			  $.ajax({
			      type: "GET",
			      dataType:"json",
			      url: url,
			      success: function(data) {
			          console.log("response:" + data);
							
							var object=data.object;
							 if(data.object==''){
								 $("#c1 tr").remove();
								 alert('empty');
								 $('#example').DataTable();
							 }
							 else
								 {
								 $("#c1 tr").remove();
								 var k=1;	
								 for ( var i in object) {
									 $("#c1").append('<tr  align="center"><td>'+k+'<td>'+object[i].project_code+'<td>'+object[i].project_name+'<td align="center">'+object[i].location+'<td>'+object[i].start_date+'<td>'+object[i].end_date+'<td>'+object[i].effort+'<td>'+object[i].customer_code+'<td>'+object[i].company_name+'<td>'+object[i].count+'</tr>');
									 k++;
								 	}
						
								 $('#example').DataTable();
								 }
							 },
							 error : function(msg) {
						
						}
					});
		}
		
	}
	else{
		window.location.href='index.html';
	}
});
});
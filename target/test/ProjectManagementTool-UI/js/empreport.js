/**
 * 
 */
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	if(user2!=null){
		if(designation!='project_manager'&&designation!='admin')
		{
		 location.href='timesheetentry.html';
		}
	else{	
   $('#welcomeuser').append("<b>Welcome "+user2+" !!!</b>") ;
   
   var url = "rest/webservices/getallemployee?designation=associate";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					$("#empid1 option").remove();
					$("#empid1")
					.append(' <option value=>Select</option>');
	            for ( var i in object) {

	            	$("#empid1")
					.append(' <option value="'+object[i].emp_code+'">'+object[i].emp_code+"-"+object[i].first_name+'</option>');
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

$().ready(function(){
	  $('#example').DataTable();
$('#empid1').change(function() {
	  var url = "rest/webservices/report?emp_code="+$("#empid1").val();
	//alert(url);
	  $.ajax({
	      type: "GET",
	      dataType:"json",
	      url: url,
	      success: function(data) {
	          console.log("response:" + data);
					
					var object=data.object;
					 if(data.object==''){
						 $("#c1 tr").remove();
//						 alert("Not Any Project Allocated");
					$('#example').DataTable();
					
					 }
					 else{
					 $("#c1 tr").remove();
					var k=1;	
	          for ( var i in object) {
	        	  $("#empname b").remove();
					$("#empname").append('<b>'+object[0].first_name.toUpperCase()+'</b>');
					
					$("#designation b").remove();
					$("#designation").append('<b>'+object[0].designation.toUpperCase()+'</b>');

	        		$("#c1").append('<tr><td>'+k+'<td>'+object[i].project_code+'<td>'+object[i].project_name+'<td align="center">'+object[i].percentage_allocation+'<td>'+object[i].Start_date+'<td>'+object[i].end_date+'</tr>');
	        
	          k++;
	          }
				
	          $('#example').DataTable();
					 }
					 },
				error : function(msg) {
				
				}
			});


	});
});


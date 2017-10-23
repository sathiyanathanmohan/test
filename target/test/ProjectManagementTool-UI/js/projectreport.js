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
   
   var url = "rest/webservices/getallproject";

	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					$("#projectid1 option").remove();
					$("#projectid1")
					.append(' <option value=>Select</option>');
	            for ( var i in object) {

	            	$("#projectid1")
					.append(' <option value="'+object[i].project_code+'">'+object[i].project_code+"-"+object[i].project_name+'</option>');
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
	
	
	
//	$('#excel').click(function() {
//		alert("excel");
//	var blob = new Blob([document.getElementById('example').innerHTML], {
//        type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"
//    });
//saveAs(blob, "Report.xls");
//	
//	  });
//	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
$('#projectid1').change(function() {
	   
	   
	   var url = "rest/webservices/report1?project_code="+$("#projectid1").val();
		 
//		alert(url);
		
		   $.ajax({
		       type: "GET",
		       dataType:"json",
		       url: url,
		       success: function(data) {
		           console.log("response:" + data);
		           var object2;
		 				var object=data.object;
		 				 for ( var i in object) {
		 					object2=object[i].employee;
		 					$("#projectname b").remove();
		 					$("#projectname").append('<b>'+object[i].project_name+'</b>');
		 					
		 					$("#startdate b").remove();
		 					$("#startdate").append('<b>'+object[i].start_date+'</b>');
		 					
		 					$("#enddate b").remove();
		 					$("#enddate").append('<b>'+object[i].end_date+'</b>');
		 					
		 					$("#clientcode b").remove();
		 					$("#clientcode").append('<b>'+object[i].customer_code+'</b>');
		 					
		 					$("#clientname b").remove();
		 					$("#clientname").append('<b>'+object[i].company_name+'</b>');
		 					
		 					
		 					$("#location b").remove();
		 					$("#location").append('<b>'+object[i].location+'</b>');
		 					
		 					
		 			           }
		 				var k=1;
		 				  $("#c1 tr").remove();
		           for ( var i in object2) {

		        	 
	 					$("#c1").append('<tr><td>'+k+'<td>'+object2[i].emp_code+'<td>'+object2[i].emp_name+'<td align="center">'+object2[i].percentage_allocation+'<td>'+object2[i].start_date+'<td>'+object2[i].end_date+'</tr>');
		        	   k++;
		        	   
		        	   
		        	   
		        	   
		           
		           }
		           $('#example').DataTable();
		 			},
		 			error : function(msg) {
		 			
		 			}
		 		});
});
});





$().ready(function() {
	  $("#excel").click(function(e) {
	    e.preventDefault();

	    //getting data from our table
	    var data_type = 'data:application/vnd.ms-excel';
	    var table_div = document.getElementById('table_wrapper');
	  
	    var table_html = table_div.outerHTML.replace(/ /g, '%20');

	    var a = document.createElement('a');
	    a.href = data_type + ', ' + table_html;
	    a.download = 'exported_table_' + Math.floor((Math.random() * 9999999) + 1000000) + '.xls';
	    a.click();
	  });
	});
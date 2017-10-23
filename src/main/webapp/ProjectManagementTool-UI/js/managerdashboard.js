/**
 * 
 * 
 
 */
var code;
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	 code=checkCookie2(decodeURIComponent(document.cookie));
	if(user2!=null){
		
		  
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
			$("#managerid1 b").remove();
			$('#managerid1').append('<b>'+code.toUpperCase()+'</b>');
			$("#managername b").remove();
			$('#managername').append('<b>'+user2.toUpperCase()+'</b>');
			$("#designation b").remove();
			$('#designation').append('<b>'+designation.toUpperCase()+'</b>');
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
//								 alert('empty');
								 $('#example').DataTable();
							 }
							 else
								 {
								 $("#c1 tr").remove();
								 var k=1;	
								 
								 for ( var i in object) {
									 var pm=object[i].project_code;
									 var pn=object[i].project_name;
									 var e=object[i].id;
						               
									 //alert('code'+pm);
									 $("#c1").append('<tr  align="center"><td>'+k+'</td><td>'+object[i].project_code+'</td><td>'+object[i].project_name+'<td align="center">'+object[i].location+'</td><td>'+object[i].start_date+'</td><td>'+object[i].end_date+'</td><td>'+object[i].project_manager+'</td><td>'+object[i].delivery_manager+'</td><td>'+object[i].effort+'</td><td>'+object[i].company_name+'</td><td><a id="view" onclick="show(\'' + pn+ '\',\''+pm+'\');" href="javascript:void(0);">'+object[i].count+'</a>'+'</td><td ><a href="Projectallocation.html?a='+e+'";>Allocate</a></td></tr>');
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

	    
	
	    

 function show(na,id)
 {
	 
	 $().ready(function(){
	 var url = "rest/webservices/managerdashboard?project_code="+id+"&project_manager="+code;
		var k=1;
	
		$.ajax({
		        type: "GET",
		        dataType:"json",
		        url: url,
		        success: function(data) {
		            console.log("response:" + data);
						
						var object2=data.object;	
						$("#managerview tr").remove();
		            for ( var i in object2) {
	                
		            	
	         	$("#managerview").append('<tr align="center"><td>'+ k +'</td><td  >'+object2[i].emp_code.toUpperCase()+'</td><td  >'+object2[i].emp_name.toUpperCase()+'<td>'+object2[i].percentage_allocation+'</td><td>'+object2[i].start_date+'</td><td>'+object2[i].end_date+'</td></tr>');
		            				     
	         	 k=k+1;	
	              
	              }
		          
		           
		        
		        },
					error : function(msg) {
						console.log("User Favorites Details not found", msg);
					}
				});
	 $('#project_code1 b').remove();
	 $('#project_code1').append('<b>'+id.toUpperCase()+'</b>');
	 $('#project_name1 b').remove();
	 $('#project_name1').append('<b>'+na.toUpperCase()+'</b>');
	 modal.style.display = "block";
	 }); }
 
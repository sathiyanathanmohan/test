/**
 * 
 *//**
 * 
 */
var myJSON=[];
var some=[];
var arr=0;
$(document).ready(function(){
$(window).load(function() {
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation=checkCookie3(decodeURIComponent(document.cookie));
	var code=checkCookie2(decodeURIComponent(document.cookie));
	if(user2!=null){
		
			 $('#welcomeuser').append("<b>Welcome "+user2+" !!!</b>") ;
			 var url = "rest/webservices/getemployee?emp_code="+code;
			 $.ajax({
			      type: "GET",
			      dataType:"json",
			      url: url,
			      success: function(data) {
			          console.log("response:" + data);
			          var object1=data.object;
			          $("#empid1 b").remove();
						 $("#empid1").append('<b>'+object1[0].emp_code.toUpperCase()+'</b>');
						 $("#empname b").remove();
						 $("#empname").append('<b>'+object1[0].first_name.toUpperCase()+'</b>');
				
						 $("#designation b").remove();
						 $("#designation").append('<b>'+object1[0].designation.toUpperCase()+'</b>');
			     
			var url = "rest/webservices/report?emp_code="+code;
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
//								 alert("Not Any Project Allocated");
								 $('#example').DataTable();
							
							 }
							 else{
								 
								 $("#c1 tr").remove();
								 var k=1;	
								 var y='y';
								 for ( var i in object) {
							some.push('"'+object[i].project_code+'"');
							myJSON.push(object[i].percentage_allocation);
								arr=parseInt(object[i].percentage_allocation)+arr;
					
									 $("#c1").append('<tr><td>'+k+'<td>'+object[i].project_code+'<td>'+object[i].project_name+'<td align="center">'+object[i].percentage_allocation+'<td>'+object[i].Start_date+'<td>'+object[i].end_date+'</tr>');
			        
									 k++;
			          }
						
								 some.push('"Not Allocated"');
								arr=100-arr;
									myJSON.push(arr);      

								 $('#example').DataTable();
								 
								 
								 call();
							 }
							
							 },
							 error : function(msg) {
						
						}
					});
			      }
			 });
		}
		else
			{
			location.href='projectdashboard.jsp'
			}
	
	
	
	       

});
});
function call () {



new Chart(document.getElementById("pie-chart"), {
    type: 'polarArea',
    data: {
      labels: some,
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850",,"#3cba9f","#e8c3b9","#c45850",],
        data: myJSON
      }]
    },
    options: {
      title: {
        display: true,
        text: "Project Allocation in %"
      }
    }
});
}
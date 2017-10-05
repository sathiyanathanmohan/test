
var user;
$(document).ready(function(){
$( window ).load(function() {
	 
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	var designation= checkCookie3(decodeURIComponent(document.cookie));

 
		
		if(user2!=null){
			if(designation!='project_manager'&&designation!='admin')
			{
			 location.href='empdashboard.jsp';
			}
			if(designation=='project_manager')
			{
			 location.href='managerdashboard.jsp';
			}
	   $('#welcomeuser').append("Welcome "+user2+" !") ;
	var url = "rest/webservices/getallproject";
	var k=1,c,d,e;
//alert(url);
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					
	            for ( var i in object) {
                    c=object[i].project_code;
                    d=object[i].project_name;
                    e=object[i].id;
               
            	$("#c1")
	            	.append('<tr align="center"><td>'+ k +'</td><td  >'+object[i].project_code.toUpperCase()+'</td><td  >'+object[i].project_name.toUpperCase()+'</td><td>'+object[i].start_date+'</td><td>'+object[i].end_date+'</td>'
	            			+'<td ><a href="Projectallocation.html?a='+e+'";>Allocate</a></td><td><a href="projectedit.jsp?a='+e+'";>Edit</a></td><td><a href="projectview.jsp?a='+e+'";>View</a></td></tr>');	     
            	 k=k+1;	
                 
                 }
	            $('#example').DataTable();
	           
	        
	        },
				error : function(msg) {
					console.log("User Favorites Details not found", msg);
				}
			});
	    
		
	    
	    
	    }else{
	    	  location.href='index.html';
	    }
	    
});

});

 

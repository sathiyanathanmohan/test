/**
 * 
 */


var user;
$(document).ready(function(){
$( window ).load(function() {
	 
	
	var user2= checkCookie(decodeURIComponent(document.cookie));
	//alert(user2);
		if(user2!=null){
	    	
	   $('#welcomeuser').append("Welcome "+user2+" !!!") ;
	var url = "rest/webservices/getallcustomer";
	var k=1,c,d,e;
//alert(url);
	$.ajax({
	        type: "GET",
	        dataType:"json",
	        url: url,
	        success: function(data) {
	            console.log("response:" + data);
					
					var object=data.object;
					var location="";
	            for ( var i in object) {
                    c=object[i].customer_code;
                   
                    e=object[i].id;
                    if(object[i].customer_country!=null)
                    	{
                    	
                    	location=object[i].customer_country;
                    	 if(object[i].customer_state!=null){
                    		location= object[i].customer_state+'-'+location;
                    	 }
                    	}
               
            	$("#c1")
	            	.append('<tr align="center"><td>'+ k +'</td><td  >'+object[i].customer_code.toUpperCase()+'</td><td  >'+object[i].company_name.toUpperCase()+'</td><td>'+location+'</td><td><button  id="alloc" style="width:50px;height:20px" onclick=location.href="clientview.jsp?a='+e+'";>View</button></td>'
	            			+'<td ><button  id="alloc" style="width:50px;height:20px" onclick=location.href="clientedit.jsp?a='+e+'";>Edit</button></tr>');	     
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

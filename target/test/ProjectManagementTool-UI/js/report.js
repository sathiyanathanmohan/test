/**
 * 
 */
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
//	   $('#welcomeuser').append("Welcome "+user2+" !") ;
	
		 
		
		 
		 
		 
		 
		 
		 
		 
	}else{
  	  location.href='index.html';
    }
    
	
});
});


/**
 *  var user;
 */

 var user;
 var emp_code;
function getCookie(cname,url) {
	try{
	    var name = cname + "=";
	    var decodedCookie = url;
	    var ca = decodedCookie.split(';');
	    for(var i = 0; i < ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }
	    user=getCookie("username");
	    if (user != "") {
	      //  alert("Welcome  " + user);
	        return user;
	    } 
	
	    return null;
	}catch(err){
		return null;
	}
	
	}

	function checkCookie(url) {
	   user=getCookie("username",url);
	 
	    if (user != "") {
	      //  alert("Welcome  " + user);
	        return user;
	    } 
	
	    return null;
	}
	
	function checkCookie2(url) {
		   user=getCookie("emp_code",url);
		 
		    if (user != "") {
		      //  alert("Welcome  " + user);
		        return user;
		    } 
		
		    return null;
		}
	function checkCookie3(url) {
		   user=getCookie("designation",url);
		 
		    if (user != "") {
		      //  alert("Welcome  " + user);
		        return user;
		    } 
		
		    return null;
		}

	$().ready(function(){
	
	$('#logout').click(function()
			{
		
		
		
		document.cookie = "username" + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		document.cookie = "emp_code" + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		document.cookie = "designation" + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		alert("Logout successful");
		location.href='index.html';
		
		
		
			});
	});

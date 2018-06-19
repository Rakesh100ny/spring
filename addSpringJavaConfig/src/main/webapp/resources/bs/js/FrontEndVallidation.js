function registerValidation()
{
 var fname = document.getElementById("fname").value;
 var lname = document.getElementById("lname").value;
 var email = document.getElementById("mid").value;
 var password = document.getElementById("pass").value;

 if(fname=="" || lname=="" || email=="" || password=="")
 {
   alert('Blank Fields Not Allowed - All Fields Are Compulsory');	
 }
 else
 {	 
  if(fname.length<=10 && lname.length<=10 && isNaN(fname) && isNaN(lname))
  {
	  alert('User is Sucessfully Registered...!')	   
  }
  else
  {
	  if(fname.length>10)
	  {
	   alert('First Name Must Be In 10 Digit');
	  }
	  if(lname.length>10)
	  {
		alert('Last  Name Must Be In 10 Digit');
	  }
	  if(!isNaN(fname))
	  {
	   alert('First Name Must be String ');	  
	  }
	  if(!isNaN(lname))
	  {
	   alert('Last Name Must be String ');	  
	  }
  
  }
 }
}


function  loginValidation()
{
	 var email = document.getElementById("mid").value;
	 var password = document.getElementById("pass").value;

	 if(email=="" || password=="")
	 {
	   alert('Blank Fields Not Allowed - All Fields Are Compulsory');	
	 }
 }
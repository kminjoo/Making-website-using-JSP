/**
 * 
 */


function loginCheck(){
	if(document.login.mem_id.value==""){
		alert("Enter your ID.");
		document.login.mem_id.focus();
		return;
	}
	if(document.login.mem_passwd.value==""){
		alert("Enter your password.");
		document.login.mem_passwd.focus();
		return;
	}
	document.login.submit();
	
}

function memberReg(){
	location.href ="Register.jsp";
}
function idCheck(id){
	if(id == ""){
	alert("Enter your ID.");
	document.regForm.mem_id.focus();
	}else{
		url="IdCheck.jsp?mem_id=" + id;
		window.open(url,"post","width=300,height=150");
	}
}

function inputCheck(){
	if(document.regForm.mem_id.value==""){
		alert("Enter your ID.");
		document.regForm.mem_id.focus();
		return;
	}
	if(document.regForm.mem_password.value==""){
		alert("Enter your Password.");
		document.regForm.mem_password.focus();
		return;
	}
	if(document.regForm.mem_repasswd.value==""){
		alert("Enter your Password.");
		document.regForm.mem_repasswd.focus();
		return;
	}
	
	if(document.regForm.mem_password.value != document.regForm.mem_repasswd.value){
		alert("Passwords do not match.");
		document.regForm.mem_passwd.focus();
		return;
	}
	
	if(document.regForm.mem_firstname.value==""){
		alert("Enter your first name.");
		document.regForm.mem_firstname.focus();
		return;
	}
	if(document.regForm.mem_lastname.value==""){
		alert("Enter your last name.");
		document.regForm.mem_lastname.focus();
		return;
	}
	if(document.regForm.mem_email.value==""){
		alert("Enter your email address.");
		document.regForm.mem_email.focus();
		return;
	}
	if(document.regForm.mem_phone1.value==""){
		alert("Enter your phone number.");
		document.regForm.mem_phone1.focus();
		return;
	}
	if(document.regForm.mem_phone2.value==""){
		alert("Enter your phone number.");
		document.regForm.mem_phone2.focus();
		return;
	}
	if(document.regForm.mem_phone3.value==""){
		alert("Enter your phone number.");
		document.regForm.mem_phone3.focus();
		return;
	}
	
	var str = document.regForm.mem_email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var emailSize = str.length;
	
	if(atPos>1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 &&
			commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < emailSize );
	else{
		alert("This e-mail address is incorrectly formatted. \n\r Please try again.");
		document.regForm.mem_email.focus();
		return;
	}
	
	document.regForm.submit();
}

function inputCheck2(){
	if(document.regForm.mem_id.value==""){
		alert("Enter your ID.");
		document.regForm.mem_id.focus();
		return;
	}
	if(document.regForm.mem_password.value==""){
		alert("Enter your Password.");
		document.regForm.mem_password.focus();
		return;
	}
	
	if(document.regForm.mem_firstname.value==""){
		alert("Enter your first name.");
		document.regForm.mem_firstname.focus();
		return;
	}
	if(document.regForm.mem_lastname.value==""){
		alert("Enter your last name.");
		document.regForm.mem_lastname.focus();
		return;
	}
	if(document.regForm.mem_email.value==""){
		alert("Enter your email address.");
		document.regForm.mem_email.focus();
		return;
	}
	if(document.regForm.mem_phone1.value==""){
		alert("Enter your phone number.");
		document.regForm.mem_phone1.focus();
		return;
	}
	if(document.regForm.mem_phone2.value==""){
		alert("Enter your phone number.");
		document.regForm.mem_phone2.focus();
		return;
	}
	if(document.regForm.mem_phone3.value==""){
		alert("Enter your phone number.");
		document.regForm.mem_phone3.focus();
		return;
	}
	
	var str = document.regForm.mem_email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var emailSize = str.length;
	
	if(atPos>1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 &&
			commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < emailSize );
	else{
		alert("This e-mail address is incorrectly formatted. \n\r Please try again.");
		document.regForm.mem_email.focus();
		return;
	}
	
	document.regForm.submit();
}

function win_close()
{
	self.close();
}

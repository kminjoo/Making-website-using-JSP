# Making-website-using-JSP

Outline for this website:

1, Main function
RegisterBean.java::
      DAO for member information from sign up form DBConnectionMgr.javaConnection Pool (use open source)
MemberMgr.java:
	* Connection, 
	* check if id and password are correct
	* checkID()
	* memberInsert()

SessionMemberLogin.java:
	* Login page (and check if someone who's already logged in is trying to login)

SessionMemberLoginOk.java:
	* check if correct id and password exist in session

SessionLoginConfirm.jsp:
	* Login confirmation page

SessionLogOut.jsp:
	* session.invalidate();

Member.sql:
	* sql for member information and zipcode 

ZipcodeBean.java:
	* DAO for zipcode (address) information

Register.jsp:
	* Sign up form

script.js:
	* javascript (event handler) for sign up form 

IdCheck.jsp:
	* checking for existing ID

ZipCheck.jsp:
	* page for address check

RegisterProc.jsp:
	* used after clicking submit button in sign-up form
	* set all the member information in bean using DAO
	* and print out all the information user entered and user can edit it if needed

Login.jsp:
	* Welcome page if logged in
	* Log in page if not logged in

LoginProc.jsp:
	* if id and password exist in session, session.setAttribute and redirect
	* if doesn't exist, redirect to logError.jsp page

LogError.jsp:
	* Prints Log Error Message
	* and button to go back to login page



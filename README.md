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


------------------------------Making forum (in other words, list of posts)-----------------------------------------------

2. making FORUM
board.sql
	* sql file for board
	* name, email, homepage, title, content, password, date, hit

ConnectionFactory.java
	* Connects to DB

ConnectionPool.java
	1. constructor -- initializes member variables
	2. creates factory instance that connects DB
	3. add connection to vector
	4. getInstance() -- return an instance of connection pool
	5. getConnection() 
	6. releaseConnection()
	7. getPooledConnection() -- see if there is a connection to reuse. if yes, return connection. if not, return null
	8. createConnection() -- connec to oracle using connection factory

BoardBean.java
	* DAO for board ( forum )

BoardQuery.java
		1. DTO for board
		2. connects to DB automatically using constructor
		3. boardInsert(BoardBean boardbean) -- inserts contents to DB
		4. boardCount() -- counts the total number of posts
		5. getBoardList(int offset, int limit) -- return vector that contains board
		6. boardHitUp() -- increase views
		7. boardView(int idx) -- returns the contents
		1. used when you want to read the post using the index of post
		8. passwordCheck(int idx, String pwd) -- check for passwords
		9. boardUpdate(BoardBean boardBean) -- insert the edited post to bean
		10. boardDelete(int idx, String pwd) -- if password is correct, go ahead and delete the post
		11. boardCount(String find, String search) -- return number of result posts
		12. getSearchList(int offset, int limit, String find, String search) -- return vector containing searched posts

write.jsp
		 form for forum

write_ok.jsp
	1. insert all the contents to DAO using Bean
	2. redirect to list.jsp

list.jsp
	1. reads all the forums
	2. Pagination
	3. Search bar

PagingCount.java
	1. counts number of posts
	2. Pagination design
	3. Pagination manager


	* 
		1. go to first page
		2. go to last page
		3. show 10 pages before
		4. show 10 pages after



	1. showPaging(int pagelink, String pagename, String find, String search)


	* 
		1. paging design


content.jsp
	1. show the contents of post
	2. increase views
	3. edit / delete button

edit.jsp
	* edit page

edit_ok.jsp
	* check for correct passwordh
	* in order to edit the post, user needs to enter the password

del.jsp
	* delete form
	* input - password

del_ok.jsp
	* check for correct password

search.jsp
	1. pagination
	2. search by index, date, title, author, or views
	3. lists corresponding posts


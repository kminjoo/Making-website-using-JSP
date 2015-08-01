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

	* constructor -- initializes member variables
	* creates factory instance that connects DB
	* add connection to vector
	* getInstance() -- return an instance of connection pool
	* getConnection() 
	* releaseConnection()
	* getPooledConnection() -- see if there is a connection to reuse. if yes, return connection. if not, return null
	* createConnection() -- connec to oracle using connection factory

BoardBean.java

	* DAO for board ( forum )

BoardQuery.java

	* DTO for board
	* connects to DB automatically using constructor
	* boardInsert(BoardBean boardbean) -- inserts contents to DB
	* boardCount() -- counts the total number of posts
	* getBoardList(int offset, int limit) -- return vector that contains board
	* boardHitUp() -- increase views
	* boardView(int idx) -- returns the contents
	* 
		* used when you want to read the post using the index of post

	* passwordCheck(int idx, String pwd) -- check for passwords
	* boardUpdate(BoardBean boardBean) -- insert the edited post to bean
	* boardDelete(int idx, String pwd) -- if password is correct, go ahead and delete the post
	* boardCount(String find, String search) -- return number of result posts
	* getSearchList(int offset, int limit, String find, String search) -- return vector containing searched posts

write.jsp

	* form for forum

write_ok.jsp

	* insert all the contents to DAO using Bean
	* redirect to list.jsp

list.jsp

	* reads all the forums
	* Pagination
	* Search bar

PagingCount.java

	* counts number of posts
	* Pagination design
	* Pagination manager
	* 
		* go to first page
		* go to last page
		* show 10 pages before
		* show 10 pages after

	* showPaging(int pagelink, String pagename, String find, String search)
	* 
		* paging design

	* 


content.jsp

	* show the contents of post
	* increase views
	* edit / delete button

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

	* pagination
	* search by index, date, title, author, or views
	* lists corresponding posts



 


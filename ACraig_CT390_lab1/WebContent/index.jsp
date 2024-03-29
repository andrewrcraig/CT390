<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.answer {
	border: 1px solid blue;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lab 1 - Servlets</title>
</head>
<body>
<h1>Lab 1 - Servlets</h1>

<div>You should make use of the following resources for this lab
<ul>
	<li>Chapter 4 from the book</li>
	<li><a href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/package-summary.html">The JavaDocs</a>
	<li><a href="http://lmgtfy.com/?q=http+status+code">google</a></li>
</ul>
</div>

<h2>HTTP Basics</h2>
<div class="getpost">
	<p><a href="ExampleServlet">This link goes to  ExampleServlet</a></p>
	
	<p><form method="POST" action="ExampleServlet"><input type="submit" value="This button goes to ExampleServlet"/></form>
	
	<p class="question getpost">Both of those HTML elements above go to the same location, 
	you can see this by looking at the URL after you click it.  
	Explain why there is a different response for each.  
	</p>
	<p>
	Hints: 
	talk about static vs dynamic, http methods and how servlets handle http methods,
	look at ExampleServlet.java (From the menu: Navigate, Open Type, type in ExampleServlet and select it
	alternatively from the project explorer: expand Java Resources, src, edu and double click ExampleServlet), 
	</p>
	
  Edit index.jsp (under WebContent) and enter your answers in the "div" tags.
	<!-- put your answer inside the div tag below -->
	<div class="answer getpost">
	<p>
	The link is using the GET Http method, while the button is using the POST method. <br>
	The servlet is handling them similarly except for the HTTP methods being used.  The first <br>
	example being that it is a link is probably static as you are retrieving information, while <br>
	the button, used as like a submit, is sending data to the servlet.</p>
	</div>
</div>

<div class="methods">
	<p class="question methods">Explain the GET and POST HTTP methods:  
	What is the meaning behind it?  
	When is it used?
	What types of actions lead to a GET or POST.  
	Name and briefly describe two other HTTP methods.
	</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer methods">
	<ol>
		<li>GET is used for retrieving data <br>
			POST is used for sending data</li>
		<li>GET is used with Links <br>
			POST is used with Forms </li>
		<li>GET, action = click a link <br>
			POST, action = submit a form</li>
		<li>PUT and HEAD <br>
			PUT is creating or replacing a resource at a designated URI <br>
			HEAD is identical to GET except that the server must not return a message-body in the response</li>
	</ol>
	</div>
</div>

<div class="codes">
	<p class="question methods">Explain the following HTTP return codes: 200, 404, 500
	What is the meaning behind it?  
	When is it used?  </p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer methods">
	 <ul>
		<li>200: meaning = request was successful and the server was able to deliver.
		     Used to denote success
		     </li>
		<li>404: meaning = client error, requested URI does not exist on the server.
		     Used to denote that the request sent isn't good anymore
		     </li>
		<li>500: meaning = server error, request could not be processed.
		     Used to denote a problem with the server. 
		     </li>
	 </ul>
	</div>
</div>

<div class="parameters">
<h2>Sending Parameters</h2>
<p>For each of the links and buttons below, click it and view the URL and page.  Make sure you understand how the examples are different.</p>
<h3>Using HTML Links</h3>
	<p>Simple example:
	<a href="ParameterExampleServlet?foo=bar">one parameter named foo with value bar</a></p>
	
	<p>We can send multiple parameters at once:
	<a href="ParameterExampleServlet?foo=bar&baz=buz">two parameters named foo and baz with values bar and buz respectively</a></p>
	
	<p>We can send the same parameter multiple times: 
	<a href="ParameterExampleServlet?foo=bar&foo=blah">foo has two values: bar and blah</a></p>
	
<h3>Using FORMs</h3>
  <p>Make sure you view the source of the forms.</p>
	<div>Simple button with hidden parameters (foo=bar):
	<form action="ParameterExampleServlet">
		<input type="hidden" name="foo" value="bar">
		<input type="submit"/>
	</form>
	</div>
	
	<div>text parameters (foo=bar by default, but the user can change it):
	<form action="ParameterExampleServlet">
		Foo: <input type="text" name="foo" value="bar">
		<input type="submit"/>
	</form>
	</div>
	
	<div>multiple text parameters:
	<form action="ParameterExampleServlet">
		Foo: <input type="text" name="foo" value="bar">
		Baz: <input type="text" name="baz" value="buz">
		<input type="submit"/>
	</form>
	</div>
	
	<div>multiple select:
	<form action="ParameterExampleServlet">
		<select name="foo" multiple="multiple">
			<option value="bar" selected="selected">bar</option>
			<option value="baz" selected="selected">baz</option>
		</select>
		<input type="submit"/>
	</form>
	</div>
	
<h2>Servlet API</h2>
	<p class="question accessParams">What methods are used to get the parameters in a request?</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer accessParams">
	There are 3 methods used for retrieving parameters from request:
		<ol>
			<li>String getParameter()</li>
			<li>String[] getParameterValues()</li>
			<li>Enumeration getParameterNames()</li>
		</ol>
		</ol>
	</div>

	
	<p class="question direction">What are three ways you can get a user to another servlet?</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer direction">
	<p>
	<ol>
		<li>sendRedirect()</li>
		<li>Servlet.service</li>
		<li>RequestDispatcher interface which includes a forward method</li>
	</ol>
		
	</p>
	</div>
	
	<p class="question init">What is the init() method used for?  What might you do in there?  Who calls it and when?  Same for destroy()</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer init">
	<ul>
		<li>init() is used for servlet initialization.</li>
		<li>init() creates or loads objects that are used by the servlet in the handling of its requests.</li>  
		<li>init() is invoked when the servlet is loaded.</li> 
		<li>init() best used for resource heavy one-time operations.</li>
		<li>destroy() releases any resources the servlet is using.</li>
		<li>destroy() will also save any persistent state</li>
	</ul>
	</div>
	
	<p class="question binary">What method would we call if we wanted to send binary data back to the user (for example an image)</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer binary">
	<p>
	 ServletResponse.getOutputStream();
	 OutputStream.write(bytes);
	</p>
	</div>

	<p class="question header">What methods might we call if we wanted to add or set a header?  Why would we want to set a header?</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer header">
	<p>
		HttpServletResponse.setHeader("name", "value");
	</p>
	</div>

	<p class="question header">What are three scopes (or containers) for request attributes?  Explain their usage.</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer header">
		<ol>
		<li>Servlet-Request object</li>
		<li>HttpSession object</li>
		<li>ServletContext object</li>
	</ol>
	</div>
	
	<p class="question paramsVattributes">What is the difference between request parameters and attributes?</p>
	
	<!-- put your answer inside the div tag below -->
	<div class="answer paramsVattributes">
	<p>
	Parameter is the result of a form or query submission <br>
	Attribute is data stored in a value object, like a name - value pair
	</p>
	</div>
</div>

</body>
</html>

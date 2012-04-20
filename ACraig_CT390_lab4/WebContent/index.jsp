<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CT390 - lab4</title>
<style type="text/css">
.answer {
	border: 2px solid blue;
	padding: 2px;
}
.hint {
	color: grey;
}
</style>
</head>
<body>

<h1>Lab 4 - Filters, Listeners, Includes, Forwards</h1>

<p>Edit index.jsp putting your answers in the "answer" sections so they show up in the blue box.  <span class="hint">Hints appear in grey.</span></p>


<jsp:include page="WEB-INF/upperForm.html"></jsp:include>

<div class="wtf">
	<p>What happens when you submit "hello?" What happens when you submit "go away"?  What do you notice?  What do you wonder?  How/Why is this happening?
	<span class="hint">View the java files.  
	Search the project for the text you are looking for (in eclipse CTRL+H).  
	View the console in eclipse while you are submitting the form.</span></p>
	<div class="answer">
	<p>When submit 'hello': the jsp page <i>includes</i>the form upperform.html,<br>
    which then calls the uppercaseServlet
    </p>
    <p>and with Go Away: this action utilizes a filter which looks for input string of <br>
    'go away', then outputs the string of 'no you go away'
    </p>	
   	<p>The Filter and Servlet are stored in:<br>
     Java Resources > src > lab4 > ...
     </p>
	</div>
</div>

<div class="listenerVsFilter">
	<p>What is the difference between a filter and a listener?  What would you use to keep track of sessions?  Why?</p>
	<div class="answer">

         <ul>
            <li>Filter is used for monitoring request response to and from server</li>
            <li>Listener is used to 'listen' for events in web containers</li>
        </ul>
        <p>For the purpose of tracking sessions, that could either way.  I am thinking <br>
       that it would be cleaner and maybe more resource efficient to implement a filter<br>
       which would sit in front of the server monitoring the req / res to track sessions.<br>
       this would avoid having multiple listeners in multiple jsp pages.  Instead there <br>
       could be 'one' filter handling many sessions.
       </p>
</div>
</div>

<div class="include">
	<p>/WEB-INF/upperForm.html is the form responsible for posting to /UppercasingServlet included by both
	index.jsp (above) and UppercasingServlet.java.  Convince yourself of this by making an edit to 
	upperForm.html and viewing it in both places.  
	What is the code from UppercasingServlet.java that is responsible for this inclusion?</p>
	<div class="answer code">
	<p>okay did that, added to go grab, wait be right back, another beer</p>
	<p>code responsible: 	
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/upperForm.html");
		rd.include(request, response);
	</p>
	</div>
	
	<p>What is the difference between include() and forward()</p>
	<div class="answer includeVsForward">
	  <p>difference between include() and forward() is that in an include, the servlet or <br>
        jsp page is processed inline, and control remains in page where include is placed, <br>
        whereas with forward, the process is directed to the new servlet or jsp page
      </p>
	</div>
	
	<p>Why would we use include? <span class="hint">We're already seeing it in use in this lab.</span></p>
	<div class="answer includeVsForward">
	 <p>There would be several reasons to use includes.  It provides
          <ul>
            <li>cleaner code</li>
            <li>easier maintenance</li>
            <li>re-usability</li>
          </ul>
        </p>
	
	</div>
</div>

<div class="forwardingVsRedirect">
	<p>This link goes to a <a href="ForwardServlet?stuff=hi_there">forwarding servlet</a>.  
	Looks familiar right?  What is this servlet?
	<div class="answer where">
	<p>UppercasingServlet</p>
	</div></p>
	
	<p>What is the code responsible for forwarding?<span class="hint">view ForwardServlet.java</span></p>
	<div class="answer code">
		<p>
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/UppercasingServlet");<br>rd.forward(request, response);
		</p>
	</div>
	
	<p>We see that it is forwarding to the UppercasingServlet, what is the URL? </p>
	<span class="answer url">
	http://localhost:8080/lab4/ForwardServlet?stuff=hi_there
	</span>
	<p>With forwarding the user sees the same content at a different URL.  What is a scenario where this would be useful?</p>
	<div class="answer whyURL">
	<p>this may be useful if you want to hide the actual URL from the user and let them believe they are at the one listed in the URL bar.  </p>
	</div>
	
	<p>This link goes to a <a href="RedirectingServlet">redirecting servlet</a>.  View index.jsp, what is the URL for this link tag?</p>
	<span class="answer link">
		RedirectingServlet, which then redirects you to UppercasingServlet
	</span>
	<p>
	When you click on the link, what is the URL that you wind up at?</p>
	<span class="answer link2">
	http://localhost:8080/lab4/UppercasingServlet?stuff=redirected
	</span>
	
	<p>Why are they different? </p>
	<span class="hint">View the code for RedirectServlet</span>
	<div class="answer">
	<p>as stated above, the RedirectServlet redirects you to /lab4/UppercasingServlet?stuff=redirected</p>
	
	</div>

	<p>What is the difference between redirecting and forwarding?</p>
	<div class="answer">
		<ul>
			<li>redirecting is a two step process and is slower b/c the<br>
				browser has to make two requests, the first to the server, <br>
				then is instructed to send a request to another URL</li>
			<li>forwrarding is performed in the servlet independent of the <br>
				browser. Both the browser and user are unaware of the forward, <br>
				the URL is not affected</li>
	</div>
</div>

</body>
</html>

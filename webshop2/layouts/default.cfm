<cfsilent>
	<cfparam name="rc.pageTitle" default="Webstore">
	<cfparam name="rc.pageHeader" default="Webstore">
	<cfparam name="rc.pageDescription" default="">
	<cfparam name="rc.alertMessage" default="">
	<cfparam name="rc.isLoggedIn" default="0">
	<cfparam name="rc.isAdmin" default="0">
</cfsilent>
<cfoutput><!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>#rc.pageTitle#</title>
	<meta name="description" content="#rc.pageDescription#" />
	<link type="text/css" href="/assets/css/main.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper" id="wrapper">

		<cfif application.mode NEQ "production">
			<div style="padding:5px;background-color:##FFF200;">
				<div style="float:right;">
					<cfset actionparam = "">
					<cfif not isDefined("url.action")>
						<cfset actionparam = "action=main">
					</cfif>
					<cfif isDefined('url.reload')>
						<a href="/index.cfm?#actionparam##cgi.query_String#">Reload</a>
					<cfelse>
						<a href="/index.cfm?#actionparam##cgi.query_String#&reload=#variables.framework.password#">Reload</a>
					</cfif>
				</div>
				Application Mode: #application.mode#
			</div>
		</cfif>

		<div class="header" id="header">
			<h1 class="headerLogo">My Web Store</h1>
		</div>
		
		<div class="sideBar">
			<ul class="menu">
				<li class="selected"><a href="#buildUrl('main')#"><span>Home</span></a></li>
				<li><a href="#buildUrl('stats')#"><span>Missing Page</span></a></li>
				<li><a href="#buildUrl('demo')#"><span>Demo Error</span></a></li>
				<li><a href="#buildUrl('products')#"><span>Products</span></a></li>
				<li><a href="#buildUrl('demo.demoAJAXMissingView')#">AJAX w/ onMissingView()</a></li>
				<li><a href="#buildUrl('demo.ajaxContent')#">Content AJAX View</a></li>
				<li><a href="#buildUrl('users')#">Add User</a></li>
				<cfif rc.isLoggedIn>
					<li><a href="#buildUrl('security')#">Logout</a></li>
				<cfelse>
					<li><a href="#buildUrl('security')#">Login</a></li>
				</cfif>
				<cfif rc.isAdmin>
					<li><a href="#buildUrl('sysadmin')#"><span>Admin</span></a></li>
				</cfif>
			</ul>
			<div class="tweetBox">
				<h2>Recent Tweets</h2>
			<ul>
				<cfif isDefined("rc.tweets")>
				<cfloop query="rc.tweets">
					<li>#rc.tweets.content#</li>
				</cfloop>
				</cfif>
			</ul>
			</div>
		</div>
		
		<div class="mainWrapper" id="main">
			<h2 class="mainHeader">#rc.pageHeader#</h2>
			<div class="main">
				#body#
			</div>
		</div>

		<div class="footer" id="footer">
			<div class="footerText">
				Server: #createObject("java", "jrunx.kernel.JRun").getServerName()#
			</div>
		</div>
		
	</div>

	<cfif len(trim(rc.alertMessage))>
		<script type="text/javascript">alert('#rc.alertMessage#');</script>
	</cfif>
	
</body>
</html>
</cfoutput>
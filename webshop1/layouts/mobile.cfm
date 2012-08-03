<cfsilent>
	<cfparam name="rc.pageTitle" default="Webstore">
	<cfparam name="rc.pageHeader" default="Webstore">
	<cfparam name="rc.pageDescription" default="">
	<cfset request.layout = false><!--- Block layout cascading --->
</cfsilent>
<cfoutput><!DOCTYPE html>
<html>
<head>
	<title>#rc.pageTitle#</title>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
</head>
<body>
	<div data-role="page" id="jqm-home" class="type-home">

		<div data-role="header" data-theme="a">
			<h1>#rc.pageHeader#</h1>
		</div>
		
		<cfset section = getSection()>
		<cfset navList = "Home,products,missing">
		<cfoutput>
		<div data-role="navbar">
		<ul>
			<cfloop list="#navList#" index="link">
			<li>
				<cfif link EQ "home">
					<cfif section EQ link>
						<a href="/" class="ui-btn-active" data-ajax="false" >Home</a>
					<cfelse>
						<a href="/" data-ajax="false">Home</a>
					</cfif>
				<cfelse>
					<cfif section EQ link>
						<a href="#lcase(buildUrl(link))#" class="ui-btn-active" data-ajax="false">#link#</a>
					<cfelse>
						<a href="#lcase(buildUrl(link))#" data-ajax="false">#link#</a>
					</cfif>
				</cfif>
			</li>
			</cfloop>
		</ul>
		</div>
		</cfoutput>

		<div data-role="content">
			#body#
		</div>
	</div>
</body>
</html>
</cfoutput>
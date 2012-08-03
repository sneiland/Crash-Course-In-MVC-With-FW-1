<cfset gateways.email = createObject("component","email").init(
	mailServer = application.mailServer.server
	,serverPort = application.mailServer.serverPort
	,useSSL = application.mailServer.useSSL
	,username = application.mailServer.username
	,password = application.mailServer.password
)>
<cfset gateways.users = createObject("component","users").init(dsn=application.dsn)>
<cfset gateways.products = createObject("component","products").init(dsn=application.dsn)>
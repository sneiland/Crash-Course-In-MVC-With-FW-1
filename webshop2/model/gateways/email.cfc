<cfcomponent displayname="Email Gateway" output="false">
	
	
	<cffunction name="init">
		<cfargument name="mailServer">
		<cfargument name="serverPort">
		<cfargument name="useSSL">
		<cfargument name="username">
		<cfargument name="password">
		
		<cfset variables.instance.mailServer = arguments.mailServer>
		<cfset variables.instance.serverPort = arguments.serverPort>
		<cfset variables.instance.useSSL = arguments.useSSL>
		<cfset variables.instance.username = arguments.username>
		<cfset variables.instance.password = arguments.password>
		
		<cfreturn this>
	</cffunction>
	
	
	<cffunction name="sendEmail">
		<cfargument name="from">
		<cfargument name="to">
		<cfargument name="subject">
		<cfargument name="content">
		
		<cfmail 
			server="#variables.instance.mailServer#" 
			username="#variables.instance.username#" 
			password="#variables.instance.password#" 
			port="#variables.instance.serverPort#"
			useSSL="#variables.instance.useSSL#" 
			type="html"
			from="#arguments.from#" 
			to="#arguments.to#" 
			subject="#arguments.subject#">
				#arguments.content#
		</cfmail>
	</cffunction>
	
	
</cfcomponent>
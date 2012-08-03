<cfcomponent displayname="Users Gateway" output="false">
	
	<cfset variables.instance = {}>
	
	<cffunction name="init" output="false">
		<cfargument name="dsn" required="true" type="string">
		<cfset variables.instance.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
</cfcomponent>
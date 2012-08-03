<cffunction name="xIsUserInRole" access="public" output="false" returntype="boolean">
	<cfargument name="role" required="true">
	
	<cfreturn application.services.security.xIsUserInRole(arguments.role)>
</cffunction>
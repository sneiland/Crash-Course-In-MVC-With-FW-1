<cfcomponent output="false">
	<cffunction name="default" output="false">
	 	<cfargument name="name" required="false" type="string" default="anonymous">
        <cfreturn "so-called " & arguments.name>
    </cffunction>
</cfcomponent>
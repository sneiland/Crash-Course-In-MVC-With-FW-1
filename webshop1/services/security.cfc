<cfcomponent displayname="Security Service" output="false">
	
	
	<cffunction name="init" output="false">
		<cfreturn this>
	</cffunction>
		
	
	<cffunction name="getUser" access="public" output="false" returntype="any">
		<!--- First check if the user state object exists and create if it doesnt --->
		<cfif not isDefined("session.user.userId")>
			<cfset session.user = {
				userId=0
				,username=""
				,firstname=""
				,lastname=""
				,roles=""
				,isLoggedIn=0
			}>
		</cfif>
		
		<cfreturn session.user>
	</cffunction>
	
	
	<cffunction name="getUserId" access="public" output="false" returntype="any">
		<cfset var user = getUser()>
		<cfreturn user.userId>
	</cffunction>
	
	
	<cffunction name="xIsUserInRole" access="public" output="false" returnType="boolean">
		<cfargument name="role">
		
		<cfset var user = getUser()>
		<cfset var returnValue = 0>
		
		<cfif listFind(user.roles,arguments.role)>
			<cfset returnValue = 1>
		</cfif>
		
		<cfreturn returnValue>
	</cffunction>
	
	
	<cffunction name="xIsUserLoggedIn" access="public" output="false" returnType="boolean">
		<cfset var user = getUser()>	
		<cfreturn user.isLoggedIn>
	</cffunction>
	
	
	<cffunction name="authenticate" access="public" output="false" returntype="boolean">
		<cfargument name="username" required="false" type="string" default="">
		<cfargument name="password" required="false" type="string" default="">
		
		<cfset var loginSuccess = FALSE>
		
		<cfif arguments.username EQ "steven" AND arguments.password EQ "password">
			<cfset session.user = {
				userId=1
				,username="steven"
				,firstname="Steven"
				,lastname="Neiland"
				,roles="admin"
				,isLoggedIn=1
			}>
			<cfset loginSuccess = TRUE>
		</cfif>
		
		<cfreturn loginSuccess>
	</cffunction>
	
</cfcomponent>
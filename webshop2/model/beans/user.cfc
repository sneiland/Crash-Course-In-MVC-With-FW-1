<cfcomponent output="false" hint="User Bean">

	
	<!--- Create an instance struct to hold the properties --->
	<cfset variables.instance = {
			userId=0
			,username=""
			,roles=""
			,firstName=""
			,lastName=""
			,isLoggedIn=FALSE		
		}>
	
	
	<!--- Initialize the component --->
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this>
	</cffunction>
	
	
	<!--- 
		Setters/Getters 
	--->
	
	<cffunction name="getUser" access="public" output="false" returntype="struct" hint="Returns the entire user structure">
		<cfreturn variables.instance>
	</cffunction>
	
	
	<cffunction name="setUserId" access="public" output="false" returntype="void">
		<cfargument name="userId" required="true" type="numeric">
		<cfset variables.instance.userId = arguments.userId>
	</cffunction>
	<cffunction name="getUserId" access="public" output="false" returntype="numeric">
		<cfreturn variables.instance.userId>
	</cffunction>
	
	
	<cffunction name="setUsername" access="public" output="false" returntype="void">
		<cfargument name="username" required="false" type="string" default="">
		<cfset variables.instance.username = arguments.username>
	</cffunction>
	<cffunction name="getUsername" access="public" output="false" returntype="string">
		<cfreturn variables.instance.username>
	</cffunction>
	
	
	<cffunction name="setFirstName" access="public" output="false" returntype="void">
		<cfargument name="firstName" required="false" type="string" default="">
		<cfset variables.instance.firstName = arguments.firstName>
	</cffunction>
	<cffunction name="getFirstName" access="public" output="false" returntype="string">
		<cfreturn variables.instance.firstName>
	</cffunction>
	
	
	<cffunction name="setLastname" access="public" output="false" returntype="void">
		<cfargument name="lastName" required="false" type="string" default="">
		<cfset variables.instance.lastName = arguments.lastName>
	</cffunction>
	<cffunction name="getLastName" access="public" output="false" returntype="string">
		<cfreturn variables.instance.lastName>
	</cffunction>
	
	
	<cffunction name="setRoles" access="public" output="false" returntype="void">
		<cfargument name="roles" required="false" type="string" default="">
		<cfset variables.instance.roles = arguments.roles>
	</cffunction>
	<cffunction name="getRoles" access="public" output="false" returntype="string">
		<cfreturn variables.instance.roles>
	</cffunction>
	
	
	<cffunction name="setIsLoggedIn" access="public" output="false" returntype="void">
		<cfargument name="isLoggedIn" required="true" type="boolean">
		<cfset variables.instance.isLoggedIn = arguments.isLoggedIn>
	</cffunction>
	<cffunction name="getIsLoggedIn" access="public" output="false" returntype="boolean">
		<cfreturn variables.instance.isLoggedIn>
	</cffunction>
	
	
	<!--- 
		Public Functions
	 --->
	
	
	<cffunction name="getFullName" access="public" output="false" returntype="string">
		<cfreturn variables.instance.firstName & " " & variables.instance.lastName>
	</cffunction>
	
	
	<cffunction name="setupUser" access="public" output="false" returntype="void">
		<cfargument name="userId" required="false" type="numeric" default="0">
		<cfargument name="userName" required="false" type="string" default="">
		<cfargument name="firstName" required="false" type="string" default="">
		<cfargument name="lastName" required="false" type="string" default="">
		<cfargument name="roles" required="false" type="string" default="">
		<cfargument name="isLoggedIn" required="false" type="boolean" default="0">
	
		<cfset setUserId(arguments.userId)>
		<cfset setUsername(arguments.userName)>
		<cfset setFirstName(arguments.firstName)>
		<cfset setLastName(arguments.lastName)>
		<cfset setRoles(arguments.roles)>
		<cfset setIsLoggedIn(arguments.isLoggedIn)>
	</cffunction>
	
	
	<cffunction name="reset" access="public" output="false" returntype="void">
		<cfset setUserId(0)>
		<cfset setUsername()>
		<cfset setFirstName()>
		<cfset setLastName()>
		<cfset setRoles()>
		<cfset setIsLoggedIn(0)>
	</cffunction>
	
			
</cfcomponent>
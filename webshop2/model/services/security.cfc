<cfcomponent displayname="Security Service" output="false">
	
	
	<cffunction name="init" output="false">
		<cfargument name="dsn" required="true" type="string">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	
	<cffunction name="createUser" access="private" output="false" returntype="void" hint="Initialize the user bean in the session scope if it does not already exist">
		<cflock type="exclusive" timeout="10" scope="session">
			<cfif not structKeyExists(session,"userBean")>
				<cfset session.userBean = createObject("component","model.beans.user").init() />
			</cfif>
		</cflock>
	</cffunction>
	
	
	<cffunction name="getUser" access="public" output="false" returntype="any">
		<!--- First check if the user state object exists and create if it doesnt --->
		<cfif not structKeyExists(session,"userBean")>
			<cfset createUser()>
		</cfif>
		
		<cfreturn session.userBean>
	</cffunction>
	
	
	<cffunction name="getUserId" access="public" output="false" returntype="any">
		<!--- First check if the user state object exists and create if it doesnt --->
		<cfif not structKeyExists(session,"userBean")>
			<cfset createUser()>
		</cfif>
		
		<cfreturn session.userBean.getUserId()>
	</cffunction>
	
	
	<cffunction name="xIsUserInRole" access="public" output="false" returnType="boolean">
		<!--- First check if the user state object exists and create if it doesnt --->
		<cfif not structKeyExists(session,"userBean")>
			<cfset createUser()>
		</cfif>
		
		<cfreturn session.userBean.getUserId()>
	</cffunction>
	
	
	<cffunction name="xIsUserLoggedIn" access="public" output="false" returnType="boolean">
		<!--- First check if the user state object exists and create if it doesnt --->
		<cfif not structKeyExists(session,"userBean")>
			<cfset createUser()>
		</cfif>
		
		<cfreturn session.userbean.getIsLoggedIn()>
	</cffunction>
	
	
	<cffunction name="setupUser" access="public" output="false" returntype="void">
		<cfargument name="userId" required="false" type="numeric" default="0">
		<cfargument name="userName" required="false" type="string" default="">
		<cfargument name="firstName" required="false" type="string" default="">
		<cfargument name="lastName" required="false" type="string" default="">
		<cfargument name="roles" required="false" type="string" default="">
		<cfargument name="isLoggedIn" required="false" type="boolean" default="0">
		
		<!--- Get reference to user state object --->
		<cfset var user = getUser()>
		
		<!--- Pass user values to the bean --->
		<cfset user.setupUser(argumentCollection=arguments)>
	</cffunction>
	
	
	<cffunction name="authenticate" access="public" output="false" returntype="boolean">
		<cfargument name="username" required="false" type="string" default="">
		<cfargument name="password" required="false" type="string" default="">
		
		<cfset var loginSuccess = FALSE>
		
		<cfif arguments.username EQ "steven" AND arguments.password EQ "password">
			<cfset setupUser(
				userId=1
				,username="steven"
				,firstname="Steven"
				,lastname="Neiland"
				,roles="admin"
				,isLoggedIn=1
			)>
			<cfset loginSuccess = TRUE>
		</cfif>
		
		<cfreturn loginSuccess>
	</cffunction>
	
</cfcomponent>
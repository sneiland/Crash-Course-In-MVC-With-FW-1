<cfcomponent output="false" hint="Security Controller">
	
	
	<cfset variables.instance = {} />
	
	
	<cffunction name="init" access="public" returntype="void" output="false">
		<cfargument name="fw" type="any" required="yes" />
		<cfset variables.instance.fw = arguments.fw />
		<cfset variables.instance.securityService = application.services["security"]>
	</cffunction>
	
	
	<cffunction name="getCurrentSection" access="private" output="false">
		<cfreturn variables.instance.fw.getSection()>
	</cffunction>
	
	
	<cffunction name="getPublicSections" access="private" output="false">
		<!--- Define list of public sections which do not require login --->
		<cfreturn "security">
	</cffunction>
	
	
	<cffunction name="checkSectionAccess" access="private" output="false" returntype="boolean" 
				hint="This should really be in the security service but for now can reside here">
					
		<cfargument name="section" required="true" type="string">
		<cfargument name="roles" required="true" type="string">
		<cfargument name="loggedIn" required="false" type="boolean" default="FALSE">
		
		<cfset var accessGranted = FALSE>
		
		<cfif listFind(getPublicSections(),arguments.section) 
			OR (arguments.loggedin AND listFind(arguments.roles,"admin"))
			OR (arguments.loggedin AND arguments.section NEQ "sysadmin")
			>
			<!--- If public section, or user is logged in and is admin, or user is loggedin and section is not sysadmin --->
			<cfset accessGranted = TRUE>
		</cfif>
		
		<cfreturn accessGranted>
	</cffunction>
	
	
	<cffunction name="default" access="public" output="false">
		<cfargument name="rc">
		<cfset rc.pageTitle = "Login">
		<cfset rc.pageHeader = "Login">
		
		<!--- If user is already logged in then show the logout confirmation --->
		<cfif IsUserLoggedIn()>
			<cfset variables.instance.fw.redirect('#variables.instance.fw.getSection()#.logout')>
		</cfif>

		<cfset variables.instance.fw.setLayout('login')>
	</cffunction>
	
	
	<cffunction name="checkAuthorization" access="public" output="false">
		<cfargument name="rc">
		
		<!--- If permission for a section is not granted --->
		<cfset var permissionGranted = FALSE>
		
		<cfparam name="rc.isLoggedIn" default="0">
		<cfparam name="rc.isAdmin" default="0">
		
		<cfset rc.isLoggedIn = variables.instance.securityService.xIsUserLoggedIn()>
		
		<!--- If current section is not public OR security(login) then check permission --->
		<cfif NOT listFind(getPublicSections(),getCurrentSection()) AND NOT rc.isLoggedIn>
			<cfset variables.instance.fw.redirect('security.default')>
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="doLogin" hint="Do the actual login" output="false">
		<cfargument name="rc">
		
		<cfparam name="rc.username" default="">
		<cfparam name="rc.password" default="">
		
		<!--- Try login the user and set the user session struct --->
		<cfset loginSuccess = variables.instance.securityService.authenticate(username=rc.username,password=rc.password)>
		
		<cfif NOT loginSuccess>
			<cfset variables.instance.fw.redirect("#variables.instance.fw.getSection()#.default")>
		<cfelse>
			<cfset rc.user = variables.instance.securityService.getUser()>
			<cfset variables.instance.fw.setView("#variables.instance.fw.getSection()#.welcome")>
		</cfif>
	</cffunction>
	
	
	<cffunction name="logout" hint="The logout confirmation" output="false">
		<cfargument name="rc">
		<cfset rc.pageTitle = "Logout">
		<cfset rc.pageHeader = "Logout">
	</cffunction>
	
	
	<cffunction name="doLogout" hint="Do the actual logout" output="false">
		<cfargument name="rc">
		
		<!--- Reset the user session struct --->
		<cfset variables.instance.securityService.logout()>
		
		<cfset variables.instance.fw.redirect("security.default")>
	</cffunction>
	
</cfcomponent>
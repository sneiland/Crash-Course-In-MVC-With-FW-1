<cfcomponent displayname="Members Controller" output="false">
	
	
	<cffunction name="init" output="false">
		<cfargument name="fw">
		<cfset variables.fw = arguments.fw>	
	</cffunction>
	

	<cffunction name="default">
		<cfset var saveResult = "">
		
		<cfparam name="rc.firstname" default="">
		<cfparam name="rc.lastname" default="">
		<cfparam name="rc.age" default="">
		<cfparam name="rc.gender" default="">
		<cfparam name="rc.email" default="">

		<cfif isDefined("rc.saveUser")>
			<cfset saveResult = application.services.users.saveUser(form)>
			<cfset rc.errorFields = saveResult.errorFields>
			<cfset rc.newUserId = saveResult.userId>
		</cfif>
		
		<cfset rc.pageTitle = "Save User Form">
		<cfset rc.pageHeader = "Add a user">
	</cffunction>
	
	
	<cffunction name="couponReport" output="false">
		<cfset variables.fw.setLayout('window')>
	</cffunction>
</cfcomponent>
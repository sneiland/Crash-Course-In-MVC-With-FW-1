<cfcomponent output="false" displayname="Users Service">
	
	
	<cffunction name="init" output="false">
		<cfargument name="dsn" required="true" type="string">
		<cfargument name="emailGateway" required="true" type="component">
		
		<cfset variables.dsn = arguments.dsn>
		<cfset variables.emailGateway = arguments.emailGateway>
		
		<cfreturn this>
	</cffunction>
	
	
	<cffunction name="saveUser" output="true">
		<cfargument name="formData">
		
		<cfset var returnStruct = {
			errorFields = ""
			,userId = 0
		}>
		
		<cfset returnStruct.errorFields = validateUserForm(arguments.formData)>
		
		<cfif NOT listLen(returnStruct.errorFields)>
			<cfset returnStruct.userId = saveUserToDB(
				firstName=formData.firstName
				,lastName=formData.lastName
				,age=formData.age
				,gender=formData.gender
				,email=formData.email
			)>
			
			<cfset sendWelcomeEmail(formData.email)>
		</cfif>
		<cfreturn returnStruct>
	</cffunction>
	
	
	<!--- 
		PRIVATE FUNCTIONS
	 --->
	
	
	<cffunction name="validateUserForm">
		<cfargument name="formData">
		
		<cfset var errorList = "">
	
		<cfloop list="firstName,lastName,age,gender,email" index="listItem">
			<cfif not isDefined("form.#listItem#") OR form[listItem] EQ "">
				<cfset errorList = listAppend(errorList,listItem)>
			</cfif>
		</cfloop>
		
		<cfreturn errorList>
	</cffunction>
	
	
	<cffunction name="saveUserToDB" access="private" output="true" returntype="numeric">
		<cfargument name="firstName">
		<cfargument name="lastName">
		<cfargument name="age">
		<cfargument name="gender">
		<cfargument name="email">

		<cfset var qrysaveUserToDB = "" />
		<cfset var returnUserId = 0>
		<cfset var saveResult = "">
		
		<cfquery name="qrysaveUserToDB" datasource="#variables.dsn#" result="saveResult">
			INSERT INTO demoUsers (
				firstName
				,lastName
				,age
				,gender
				,email
			) VALUES (
				<cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">
				,<cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar">
				,<cfqueryparam value="#arguments.age#" cfsqltype="cf_sql_integer">
				,<cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">
				,<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
			)
		</cfquery>
		
		<cfset returnUserId = saveResult.identitycol>
	
		<cfreturn returnUserId/>
	</cffunction>
	
	
	<cffunction name="sendWelcomeEmail" access="private" output="true" returntype="void">
		<cfargument name="email">
		
		<cfset var emailContent = "">
		
		<cfsavecontent variable="emailContent">
			Hello valued new customer.
			Thank you for joining our webshop.
		</cfsavecontent>
		
		<cfset variables.emailGateway.sendEmail(
			from="welcome@webshop.com"
			,to=arguments.email
			,subject="welcome to our webshop"
			,content=emailContent
		)>
	</cffunction>
	
	
</cfcomponent>
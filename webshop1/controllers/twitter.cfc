<cfcomponent output="false">

	<cffunction name="init" output="false">
		<cfargument name="fw">
		<cfset variables.instance.fw = arguments.fw>	
	</cffunction>
	
	
	<cffunction name="getTweets">
		<cfset var tweets = queryNew("content","varchar")>
		
		<cfset queryaddrow(tweets,3)>
		<cfset querySetCell(tweets,"content","My first tweet",1)>
		<cfset querySetCell(tweets,"content","Is this thing on",2)>
		<cfset querySetCell(tweets,"content","Helloooooooo?",3)>
		
		<cfset rc.tweets = tweets>
	</cffunction>
	
	
	<cffunction name="default" output="false">
		<cfset rc.pageTitle = "Products">
		<cfset rc.pageHeader = "Showing Products By Category">
	</cffunction>
</cfcomponent>
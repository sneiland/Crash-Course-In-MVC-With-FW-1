<cfcomponent output="false">
	
	
	<cffunction name="init" output="false">
		<cfargument name="fw">
		<cfset variables.fw = arguments.fw>	
	</cffunction>
	
	
	<cffunction name="default" output="false">
		<!--- Get products on offer --->
		<cfset variables.fw.service("products.getProductsOnOffer","products")>

		<cfset rc.pageTitle = "Home Page">
		<cfset rc.pageHeader = "Products On Offer">
	</cffunction>
		
	
	<cffunction name="error" output="false">
		<cfset rc.pageTitle = "Some Error">
		<cfset rc.pageHeader = "Oops something went wrong">
	</cffunction>

</cfcomponent>
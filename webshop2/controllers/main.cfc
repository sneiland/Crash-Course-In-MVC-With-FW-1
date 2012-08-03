<cfcomponent output="false">
	
	
	<cffunction name="init" output="false">
		<cfargument name="fw">
		<cfset variables.instance.fw = arguments.fw>	
	</cffunction>
	
	
	<cffunction name="default" output="false">
		<cfset rc.products = application.services.products.getProductsOnOffer()>
		<!--- <cfset variables.instance.fw.redirect("signup")> --->
		<cfset rc.pageTitle = "Home Page">
		<cfset rc.pageHeader = "Products On Offer">
	</cffunction>
	
	
	<cffunction name="error" output="false">
		<cfset rc.pageTitle = "Some Error">
		<cfset rc.pageHeader = "Oops something went wrong">
	</cffunction>

</cfcomponent>
<cfcomponent displayname="Products Service" output="false">

	<cffunction name="init" output="false">
		<cfargument name="productsGateway" required="true" type="component">
		<cfargument name="emailGateway" required="true" type="component">
		<cfargument name="securityService" required="true" type="component">
		
		<cfset variables.instance.productsGateway = arguments.productsGateway>
		<cfset variables.instance.emailGateway = arguments.emailGateway>
		<cfset variables.instance.securityService = arguments.securityService>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getSecurityService" access="private" output="false">
		<cfreturn variables.instance.securityService>
	</cffunction>
	
	<cffunction name="getProductsGateway" access="private" output="false">
		<cfreturn variables.instance.productsGateway>
	</cffunction>
	
	<cffunction name="getEmailGateway" access="private" output="false">
		<cfreturn variables.instance.emailGateway>
	</cffunction>
	
	<cffunction name="getProductsOnOffer" access="public" output="false" returntype="query" hint="Get all the products currently on special offer">
		<cfreturn getProductsGateway().getProducts()>
	</cffunction>
	
	<cffunction name="buyProduct" access="public" output="false" returntype="query" hint="Processes a buy order for a product">
		
		<!--- Get the logged in user ID --->
		<cfset var userId = getSecurityService.getUserId()>
		
		<cfreturn getProductsGateway().getProducts()>
	</cffunction>
	
</cfcomponent>
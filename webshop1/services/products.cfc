<cfcomponent displayname="Products Service" output="false">


	<cffunction name="init" output="false">
		<cfreturn this>
	</cffunction>
	
	
	<cffunction name="getProducts" access="public" output="false" returntype="query" hint="Gets some products">
		<cfargument name="productId" required="false" type="numeric" default="0">
		
		<cfset var qrygetProducts = "">
	
		<cfquery name="qryGetProducts" datasource="#application.dsn#">
			SELECT
				TOP 100
				p1.Name AS productName
			FROM
				Production.Product AS p1
			<cfif arguments.productId>
			WHERE
				p1.productId = <cfqueryparam value="#arguments.productId#" cfsqltype="cf_sql_integer">
			</cfif>
		</cfquery>
	
		<cfreturn qrygetProducts>
	</cffunction>
	
	
	<cffunction name="getProductsOnOffer" access="public" output="false" returntype="query" hint="Gets some products">
		<cfreturn getProducts()>
	</cffunction>
	
</cfcomponent>
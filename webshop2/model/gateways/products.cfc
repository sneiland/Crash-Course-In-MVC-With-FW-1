<cfcomponent displayname="Products Gateway" output="false">
	
	
	<cfset variables.instance = {}>
	
	
	<cffunction name="init" output="false">
		<cfargument name="dsn" required="true" type="string">
		<cfset variables.instance.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	
	<cffunction name="getDSN" access="private" output="false" returntype="string">
		<cfreturn variables.instance.dsn>
	</cffunction>
	
	
	<cffunction name="getProducts" access="public" output="false" returntype="query" hint="Gets some products">
		<cfargument name="productId" required="false" type="numeric" default="0">
		
		<cfset var qrygetProducts = "">
	
		<cfquery name="qrygetProducts" datasource="#getDSN()#">
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
	
	
</cfcomponent>
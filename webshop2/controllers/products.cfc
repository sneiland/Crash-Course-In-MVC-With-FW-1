<cfcomponent output="false">
	
	
	<cffunction name="init" output="false">
		<cfargument name="fw">
		<cfset variables.instance.fw = arguments.fw>	
	</cffunction>
	
	
	<cffunction name="before" output="false" hint="This runs before the called method">
		<cfset var productCategories = queryNew("categoryId,categoryName","Integer,varchar")>
		<cfset queryaddrow(productCategories,3)>
		<cfset querySetCell(productCategories,"categoryId",1,1)>
		<cfset querySetCell(productCategories,"categoryId",2,2)>
		<cfset querySetCell(productCategories,"categoryId",3,3)>
		<cfset querySetCell(productCategories,"categoryName","Toy Cars",1)>
		<cfset querySetCell(productCategories,"categoryName","Model Planes",2)>
		<cfset querySetCell(productCategories,"categoryName","Scale Trains",3)>
		
		<cfset rc.productCategories = productCategories>
	</cffunction>
	
	
	<cffunction name="default" output="false">
		<cfset rc.pageTitle = "Products">
		<cfset rc.pageHeader = "Showing Products By Category">
	</cffunction>
		
	
	<cffunction name="buy" output="false">
		<cfset rc.pageTitle = "Purchase Product">
		<cfset rc.pageHeader = "Please review your order">
	</cffunction>
	

	<cffunction name="processOrder" output="false">
		<cfset rc.pageTitle = "Purchase Complete">
		<cfset rc.pageHeader = "Purchase Complese">
	</cffunction>
	
	
	<cffunction name="after" output="false" hint="This runs after the called method">
		<!--- Run after the called method --->
	</cffunction>
	
	
</cfcomponent>
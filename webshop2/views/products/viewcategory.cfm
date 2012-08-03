<cfswitch expression="#rc.categoryID#">
	<cfcase value="1">
		<cfset message = "Toy car">	
	</cfcase>
	<cfcase value="2">
		<cfset message = "Model Plane">
	</cfcase>
	<cfcase value="3">
		<cfset message = "Train">
	</cfcase>
</cfswitch>
<cfoutput>
	<p>Display a list of products of type: #message#</p>
	<br/>
	<p><a href="#buildUrl('products.buy')#&categoryId=#rc.categoryID#" style="padding:5px;border:solid 1px ##aaa;color:red;">Buy A #message#</a></p>
</cfoutput>
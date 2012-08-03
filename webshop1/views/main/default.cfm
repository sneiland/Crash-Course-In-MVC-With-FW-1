<style>
	.productList {
		list-style-type:none;
	}
	
	.productList li {
		padding:10px;
		border-bottom:solid 1px #aaa;
	}
</style>

<cfoutput>
	<ul class="productList">
	<cfloop query="rc.products">
		<li>#rc.products.productName#</li>
	</cfloop>
	</ul>
</cfoutput>
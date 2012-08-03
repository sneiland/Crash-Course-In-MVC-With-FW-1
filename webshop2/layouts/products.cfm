<cfoutput>
	<div class="productTabs">
	<ul>
	<cfloop query="rc.productCategories">
		<li><a href="#buildUrl('#getSection(action)#.viewCategory')#&categoryId=#rc.productCategories.categoryId#">#rc.productCategories.categoryName#</a></li>
	</cfloop>
	</ul>
	</div>
	
	<div class="productmain">
		#body#
	</div>
</cfoutput>
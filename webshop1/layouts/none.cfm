<cfsilent>
	<!--- 
		Use this layout when you want to render content without putting in a layout
		For example rendering html to be sent via ajax
	 --->
	 <cfsetting showdebugoutput="false">
	 <cfset request.layout = false><!--- Block layout cascading --->
</cfsilent><cfoutput>#body#</cfoutput>
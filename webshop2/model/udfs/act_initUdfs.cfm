<cfif NOT IsDefined("xIsUserinRole")>
	<cfinclude template="xIsUserInRole.cfm">
</cfif>

<cfif NOT IsDefined("xIsUserLoggedIn")>
	<cfinclude template="xIsUserLoggedIn.cfm">
</cfif>
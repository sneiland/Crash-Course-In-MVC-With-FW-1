<cfcomponent output="false">
	
	
	<cffunction name="init" output="false">
		<cfargument name="fw">
		<cfset variables.fw = arguments.fw>	
	</cffunction>
		
	
	<cffunction name="demoAJAXMissingView" output="false">
		<cfset rc.data = {
			name="steven"
			,age="30"
			,awesomename="infinity"
		}>
	</cffunction>
	
	
	<cffunction name="ajaxContent" output="false">
		<cfset variables.fw.setLayout('none')>
	</cffunction>
	

</cfcomponent>
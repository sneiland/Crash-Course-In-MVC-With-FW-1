<cfcomponent extends="org.corfield.framework" output="false">
	
	<cfset this.name = "webstore1">
	<cfset this.clientmanagement = FALSE>
	<cfset this.Sessionmanagement = TRUE>
	<cfset this.Sessiontimeout= createtimespan(0,1,0,1)>
	<cfset this.applicationtimeout= createtimespan(0,1,0,1)>
	<cfset this.loginstorage="session">
	<cfset this.scriptProtect=FALSE>
	
	<!--- START: FW1 Settings --->
	<cfset variables.framework.reload = "reload">
	<cfset variables.framework.password = "true">
	<cfset variables.framework.suppressImplicitService = false>
	<cfset variables.framework.defaultSection = 'main'>
	<!---  
		action = 'action',
		usingSubsystems = false,
		defaultItem = 'default',
		subsystemDelimiter = ':',
		siteWideLayoutSubsystem = 'common',
		home = 'main.default', // defaultSection & '.' & defaultItem
		// or: defaultSubsystem & subsystemDelimiter & defaultSection & '.' & defaultItem
		error = 'main.error', // defaultSection & '.error'
		// or: defaultSubsystem & subsystemDelimiter & defaultSection & '.error'
		  reloadApplicationOnEveryRequest = false,
		generateSES = false,
		SESOmitIndex = false,
		// base = omitted so that the framework calculates a sensible default
		baseURL = 'useCgiScriptName',
		// cfcbase = omitted so that the framework calculates a sensible default
		suppressImplicitService = true, // this used to be false in FW/1 1.x
		unhandledExtensions = 'cfc',
		unhandledPaths = '/flex2gateway',
		preserveKeyURLKey = 'fw1pk',
		maxNumContextsPreserved = 10,
		cacheFileExists = false,
		applicationKey = 'org.corfield.framework'
	--->
	<!--- END: FW1 Settings --->
	
	
	<cffunction name="setupApplication" returntype="any" access="public" output="false" hint="">
				
		<!--- 
			Application modes are:
				dev: Show testing data
				dev-full-reload: Reload all the application scoped singletons at the start of each page request
				production: normal operation
		--->
		<cfparam name="application.mode" default="production">
		
		<!--- Start in dev mode when on developer machine --->
		<cfif right(cgi.http_host,9) EQ "localhost">
			<cfset application.mode = "dev">
		</cfif>
		
		<cfset application.startTime = now()>
		<cfset application.appDir = getDirectoryFromPath(getCurrentTemplatePath()) />
		<cfset application.dsn = "adventureworks">
		
		<!--- Create a salt value and persistenly store in application scope for reuse --->
		<cfset application.salt = GenerateSecretKey("AES")>
		
		<!--- Configure mail server settings --->
		<cfif application.mode EQ "production">
			<cfset application.mailServer = {
					server="smtp.gmail.com"
					,serverPort=465
					,useSSL=1
					,username="someone@somewhere.com"
					,password="hideme"
					,from="someone@somewhere.com"
				}>
		<cfelse>
			<!--- Local test server settings --->
			<cfset application.mailServer = {
					server="127.0.0.1"
					,serverPort=25
					,useSSL=0
					,username="someone@somewhere.com"
					,password="hideme"
					,from="someone@somewhere.com"
				}>
		</cfif>
	</cffunction>

	
	<cffunction name="setupSession" output="false">
		<!---<!--- Setup user session structure --->
		<!--- <cfset controller('security.setupUserSession')> --->--->
		<cfparam name="session.startTime" default="#now()#">
	</cffunction> 
	
	
	<cffunction name="setupRequest" output="false">
		<cfset var isMobile = 0>
		
		<cfparam name="application.mode" default="production"><!--- If not already defined then set application mode to production --->
		<cfparam name="url.mobileoff" default="">
		<cfparam name="session.mobileoff" default="0">
		
		<!--- Switch application mode --->
		<cfif structKeyExists(url, "mode") and listFind("dev,production",url.mode)>			
			<cfset application.mode = url.mode>
		</cfif>
	    		
		<!--- Check if a user is authorized to view the current action --->
		<cfset controller('security.checkAuthorization')>
	
		<!--- Manually override the standard mobile detector --->
		<cfif url.mobileoff EQ "true">
			<cfset session.mobileoff = 1>
		<cfelseif url.mobileoff EQ "false">
			<cfset session.mobileoff = 0>
		</cfif>
		
		<!--- If we have not turned off the mobile layout --->
		<cfif NOT session.mobileoff>
			<!--- Try detect if this is a mobile device --->
			<cfif 
				reFindNoCase("android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino",CGI.HTTP_USER_AGENT) GT 0 
				OR reFindNoCase("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-",Left(CGI.HTTP_USER_AGENT,4)) GT 0>
				<cfset isMobile = 1>
			</cfif>
		
			<cfif isMobile>
				<cfif NOT left(cgi.http_host, 1) EQ "m">
				    <cflocation url="http://m.neiland.net/index.cfm?#cgi.query_string#" addToken="false">
				</cfif>
			</cfif>
		</cfif>
		
		<!--- Handle mobile subdomain layout and flag--->
		<cfif left(cgi.http_host,2) EQ "m." AND NOT session.mobileoff>
			<cfset rc.mobile = true>
			<cfset setLayout('mobile')>
		<cfelse>
			<cfset rc.mobile = false>
			
			<!--- Load tweet cache --->
			<cfset controller('twitter.getTweets')>
		</cfif>
		
		
	</cffunction>


	<cffunction name="before">
		<!--- Run before the controller --->
		<cfset service("security.xIsUserLoggedIn","isLoggedIn")>
	</cffunction>
	
	
	<cffunction name="setupView" output="false">
  		<!--- pre-rendering logic --->
	</cffunction>

	<cffunction name="after">
		<!--- Run after the controller --->
	</cffunction>
	

	<cffunction name="setupResponse" output="false">
		<!--- end of request processing --->
	</cffunction>


	<cffunction name="onMissingView" output="false">
		<cfargument name="rc" type="struct">
		
		<!--- If a data key exists assume this is for ajax and render as json --->
		<cfif structKeyExists(rc,"data")>
			<cfset request.layout = false><!--- Turn off default layout --->
			<cfsetting showDebugOutput="No"><!--- Suppress debugging output on dev machines --->
			<cfreturn serializeJSON( rc.data )><!--- Convert data to json --->
		<cfelse>
			<cfreturn view( 'main/pageNotFound' )><!--- Set view to the missing page message --->
		</cfif>
	</cffunction>


</cfcomponent>
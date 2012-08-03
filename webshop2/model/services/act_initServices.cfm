<cfset services.security = createObject("component","security").init(dsn=application.dsn)>
<cfset services.parties = createObject("component","shoppingCart").init(dsn=application.dsn)>

<cfset services.users = createObject("component","users").init(
	dsn=application.dsn
	,emailGateway=gateways.email
)>

<cfset services.products = createObject("component","products").init(
	productsGateway=gateways.products
	,emailGateway=gateways.email
	,securityService=services.security
)>
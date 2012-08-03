<cfparam name="rc.errorFields" default="">
<cfparam name="rc.newUserId" default="0">

<cfoutput>
	<cfif rc.newUserId GT 0>
		<p>Wow new user saved</p>
	</cfif>
	
	<form name="saveUser" action="#buildUrl('users')#" method="post">
	
	<label>First Name</label>
	<input name="firstname" type="text" value="#rc.firstName#"> <cfif listFindNoCase(rc.errorFields,"firstname")>First Name Is Required</cfif><br/>
	
	
	<label>Last Name</label>
	<input name="lastname" type="text" value="#rc.lastname#"> <cfif listFindNoCase(rc.errorFields,"lastname")>Last Name Is Required</cfif><br/>
		
	<label>Age</label>
	<input name="age" type="text" value="#rc.age#"> <cfif listFindNoCase(rc.errorFields,"age")>Age Is Required</cfif><br/>
	
	
	<label>Gender</label>
	<input name="gender" type="text" value="#rc.gender#"> <cfif listFindNoCase(rc.errorFields,"gender")>Gender Is Required</cfif><br/>

	<label>Email</label>
	<input name="email" type="email" value="#rc.email#"> <cfif listFindNoCase(rc.errorFields,"email")>Email Is Required</cfif><br/>
	
	<input type="submit" name="saveUser" value="Save User">
	</form>
</cfoutput>
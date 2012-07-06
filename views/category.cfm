<cfparam name="params.qCatItems" type="query">

<cfdump var="#params#">

<cfoutput>
	
	<cfloop query="#params.qCatItems#">
	
		#params.qCatItems.itemName#<br><br>	
	
	</cfloop>
	
</cfoutput>
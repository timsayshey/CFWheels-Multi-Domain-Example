<cfscript>
/**
* @hint This is the parent controller file that all your controllers should extend.
*		You can add functions to this file to make them globally available in all your controllers.
*		Do not delete this file.
*/
component extends="Wheels" 
{	

	public any function init()
	{
		// Sets currentSite and activeSite for every request
		filters(through="setActiveSite"); 
		
		// Sets currentView for every request
		filters(through="setCurrentView", type="after");		
		
		// Sets the layout based on current site (activeSite)
		usesLayout("setLayout"); 			
	}		
	
	/**
	* @hint Sets the current view based on folders
	*/ 
	public any function setCurrentView() 
	{	
		if (FileExists(ExpandPath('/multiwheels/views/#params.activeSiteAbrv#/#params.action#.cfm'))) 
		{
			renderPage(template='/#params.activeSiteAbrv#/#params.action#');			
		} 
		else if (FileExists(ExpandPath('/multiwheels/views/#params.action#.cfm'))) 
		{
			renderPage(template='/#params.action#');				
		}		
	}
		
	/**
	* @hint Sets the layout to the current company layout
	*/ 
	public any function setLayout()
	{
	    if (params.activeSite eq "bar") 
	    {	    	
	        return "/Layouts/b.layout";
	    } 
	    else 
	    {	    	
	    	return "/Layouts/f.layout";	    	
		}
	}
	
	/**
	* @hint Translates URL so we know what company we're on
	*/ 
	public any function setActiveSite() 
	{
		var activeSite = ListFirst(CGI.HTTP_HOST,'.'); // Active site
		var currentSite = CGI.HTTP_HOST; // Set currentSite to FQDN
		
		// If activeSite is "www" we still need to get the domain name
		if (activeSite is "www") 
		{
			activeSite = ListGetAt(CGI.HTTP_HOST,2,'.');
		}

		// ...but use whatever is already stored in the RC if available
		if (isDefined("currentSite")) 
		{
			currentSite = currentSite;
			
			// Fix any "currentSite" that somehow slipped by with a leading "www"
			if (ListFirst(currentSite,'.') == "www") 
			{
				currentSite = ListGetAt(currentSite,2,'.') & ".mysite.com";
			}
		}
		
		// Set the abbreviation for company
		switch (activeSite) 
		{
			case "foo":
				activeSiteAbrv = 'F';
				break;
				
			case "bar":
				activeSiteAbrv = 'B';
				break;
		}
		
		params.currentSite = currentSite;
		params.activeSite = activeSite;
		params.activeSiteAbrv = activeSiteAbrv;
		
		//writeDump(params); abort;
	}
	
	/**
	* @hint Overrides default renderPage
	*/
	/*
	public any function renderPage(string template="")
	{		
		if(not Len(arguments.template)) {		
			arguments.template = "/#params.activeSiteAbrv#/#params.action#";			
		}
		
		//writeDump(arguments); abort;
		
		renderPage(argumentCollection=arguments);		
	}
	*/	
}
</cfscript>
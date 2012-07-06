<cfscript>
/**
 * @hint This is the show controller which handles most site requests
 */
component extends="Controller"
{
	/**
	 * @hint Runs before functions
	 */
	public void function init()
	{
		super.init(); //Include Parent Controller Init Function		
		
		filters(through="atStart",type="before");
		filters(through="atEnd",type="before");		
	}
	
	
	/**
	 * @hint Sets Controller-wide variables on start
	 */	
	private function atStart()
	{
		// Placeholder - Set start vars here
	}
	
	/**
	 * @hint Sets Controller-wide variables on end
	 */	
	private function atEnd()
	{
		// Placeholder - Set end vars here
	}
	
	/**
	 * @hint Homepage placeholder
	 */	
	public any function home()
	{
		// Set home logic
	}
	
	/**
	 * @hint Handles page.
	 */
	public any function contact()
	{
		if (activeSiteAbrv == "F") { // Is Foo
			params.address = "123 Fun Rd, Beverly Hills, CA 90210";
		} else { // Is Bar
			params.address = "212 Unfun Rd, Springfield, MO 65392";
		}
		
		if (isDefined("params.email") {
			// Put email logic here
		}
	}

}
</cfscript>
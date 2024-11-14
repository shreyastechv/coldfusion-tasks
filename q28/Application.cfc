<cfcomponent>
    <cfset this.name = "SimpleCMS">
    <cfset this.sessionManagement = "true">
    <cfset this.dataSource = "test_sql_server">

    <cffunction name="onRequest" returnType="void">
        <cfargument name="requestPage" required="true">
        <cfset local.excludePages = ["/shreyas/tasks/q28/signup.cfm","/shreyas/tasks/q28/login.cfm"]>
         <cfif ArrayContains(local.excludePages,arguments.requestPage)>
            <cfinclude template="#arguments.requestPage#">
        <cfelseif structKeyExists(session, "userRole")>
            <cfinclude template="#arguments.requestPage#">
        <cfelse>
            <cfinclude template="login.cfm">
        </cfif>
    </cffunction>
</cfcomponent>
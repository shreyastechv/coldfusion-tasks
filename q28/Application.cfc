<cfcomponent>
    <cfset this.name = "SimpleCMS">
    <cfset this.sessionManagement = "true">
    <cfset this.dataSource = "test_sql_server">

    <cffunction name="onRequest" returnType="void">
        <cfargument name="requestPage" required="true">
        <cfset local.excludePages = ["/shreyas/tasks/q28/signup.cfm","/shreyas/tasks/q28/login.cfm"]>

        <cfif StructKeyExists(session, "userRole")>
            <cfif ListFind("admin,editor", session.userRole)>
                <cfinclude template="admin.cfm">
            <cfelse>
                <cfinclude template="index.cfm">
            </cfif>
        <cfelse>
            <cfif ArrayContains(local.excludePages,arguments.requestPage)>
                <cfinclude template="#arguments.requestPage#">
            <cfelse>
                <cfinclude template="index.cfm">
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>
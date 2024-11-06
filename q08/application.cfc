<cfcomponent>
    <cfset This.sessionManagement="Yes">

    <cffunction name="onSessionStart" returnType="void">
        <cfset session.results = StructNew()>
    </cffunction>
</cfcomponent>
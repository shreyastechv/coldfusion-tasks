<cfcomponent>
    <cfset This.sessionManagement="Yes">

    <cffunction name="onSessionStart" returnType="void">
        <cfset Session.results = StructNew()>
    </cffunction>
</cfcomponent>
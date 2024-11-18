<cfcomponent>
    <cffunction name="logOut" returnType="boolean" returnFormat="json" access="remote">
        <cfif StructKeyExists(session, "userRole")>
            <cfset StructClear(session)>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>
</cfcomponent>
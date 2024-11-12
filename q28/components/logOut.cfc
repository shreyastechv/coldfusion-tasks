<cfcomponent>
    <cffunction name="logOut" returnType="void" access="remote">
        <cfif StructKeyExists(session, "userRole")>
            <cfset StructDelete(session, "userRole")>
        </cfif>
        <cflocation url="../index.cfm" addToken="no">
    </cffunction>
</cfcomponent>
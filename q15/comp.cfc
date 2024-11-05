<cfcomponent>
    <cffunction name="multiply" returnType="string" access="public">
        <cfset sum = 1>
        <cfloop array="#arguments#" item="item">
            <cfset sum = sum * item>
        </cfloop>
        <cfreturn sum>
    </cffunction>
</cfcomponent>
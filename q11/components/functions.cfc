<cfcomponent>
    <cffunction name="multiply" returnType="string" access="public">
        <cfset product = 1>
        <cfloop array="#arguments#" item="num">
            <cfset product = product * num>
        </cfloop>
        <cfreturn product>
    </cffunction>
</cfcomponent>
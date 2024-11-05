<cfcomponent>
    <cffunction name="printNumbers" returnType="array" access="public">
        <cfargument required="true" type="string" name="rows">
        <cfargument required="true" type="string" name="columns">

        <cfset array = ArrayNew(2)>
        <cfset value = 1>

        <cfloop from="1" to="#rows#" index="m">
            <cfloop from="1" to="#columns#" index="n">
                <cfset array[n][m] = value>
                <cfset value += 1>
            </cfloop>
        </cfloop>

        <cfreturn array>
    </cffunction>
</cfcomponent>
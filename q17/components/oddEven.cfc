<cfcomponent>
    <cffunction name="getOddEven" returnType="array" access="public">
        <cfargument required="true" type="string" name="number">

        <cfset local.arrayOfSpans = []>
        <cfloop from="1" to="#arguments.number#" index="i">
            <cfif i%2 IS 0>
                <cfset ArrayAppend(local.arrayOfSpans, "<span style='color: green;'>#i#</span>")>
            <cfelse>
                <cfset ArrayAppend(local.arrayOfSpans, "<span style='color: blue;'>#i#</span>")>
            </cfif>
        </cfloop>
        <cfreturn local.arrayOfSpans>
    </cffunction>
</cfcomponent>
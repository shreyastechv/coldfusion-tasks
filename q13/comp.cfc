<cfcomponent>
    <cffunction name="search" returnType="string" access="public">
        <cfargument required="true" type="string" name="keyword">
        <cfset string = "the quick brown fox jumps over the lazy dog">
        <cfset count=0>
        <cfloop list=#string# item="word" delimiters=" ">
            <cfif word IS keyword>
                <cfset count += 1>
            </cfif>
        </cfloop>
        <cfreturn count>
    </cffunction>
</cfcomponent>
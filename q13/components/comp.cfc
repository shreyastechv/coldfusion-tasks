<cfcomponent>
    <cffunction name="search" returnType="string" access="public">
        <cfargument required="true" type="string" name="keyword">
        <cfset local.string = "the quick brown fox jumps over the lazy dog">
        <cfset local.count=0>
        <cfloop list="#local.string#" item="word" delimiters=" ">
            <cfif word IS arguments.keyword>
                <cfset local.count += 1>
            </cfif>
        </cfloop>
        <cfreturn local.count>
    </cffunction>
</cfcomponent>
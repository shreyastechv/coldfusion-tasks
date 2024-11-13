<cfcomponent>
    <cffunction name="checkNum" returnType="string" access="public">
        <cfargument required="true" type="integer" name="num">
        <cfset local.result = "">
        <cfswitch expression="#arguments.num#">
            <cfcase value="5">
                <cfset local.result = "Very Good">
            </cfcase>
            <cfcase value="4">
                <cfset local.result = "Good">
            </cfcase>
            <cfcase value="3">
                <cfset local.result = "Fair">
            </cfcase>
            <cfcase value="2,1">
                <cfset local.result = "OK">
            </cfcase>
            <cfdefaultcase>
                <cfset local.result = "Invalid Input">
            </cfdefaultcase>
        </cfswitch>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>
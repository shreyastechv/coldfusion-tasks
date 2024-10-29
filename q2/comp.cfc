<cfcomponent>
    <cffunction name="checkNum" returnType="string" access="public">
        <cfargument required="true" type="integer" name="num">
        <cfswitch expression="#num#">
            <cfcase value="5">
                <cfreturn "Very Good">
            </cfcase>
            <cfcase value="4">
                <cfreturn "Good">
            </cfcase>
            <cfcase value="3">
                <cfreturn "Fair">
            </cfcase>
            <cfcase value="2,1">
                <cfreturn "OK">
            </cfcase>
            <cfdefaultcase>
                <cfreturn "Invalid Input">
            </cfdefaultcase>
        </cfswitch>
    </cffunction>
</cfcomponent>
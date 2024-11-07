<cfcomponent>
    <cffunction name="generateRandomText" returnType="string" access="public">
        <cfset local.chars="ABCDEFGHIJKLMNOPQRST0123456789">
        <cfset local.randomString = "">
        <cfloop index="i" from="0" to="5">
            <cfset randomString &= Mid(chars, RandRange(1, len(chars)), 1)>
        </cfloop>
        <cfreturn local.randomString>
    </cffunction>

    <cffunction name="validateCaptcha" returnType="string" access="public">
        <cfargument required="true" type="string" name="userCaptcha">

        <cfset local.result = "">
        <cfif session.randomText IS NOT arguments.userCaptcha>
            <cfset local.result = "Captcha is Wrong">
        <cfelse>
            <cfset local.result = "Email address successfully subscribe our newsletter">
        </cfif>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>
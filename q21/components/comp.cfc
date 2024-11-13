<cfcomponent>
    <cffunction name="sendEmail" returnType="void" access="public">
        <cfargument required="true" type="string" name="name">
        <cfargument required="true" type="string" name="email">
        <cfargument required="true" type="string" name="bdayMessage">
        <cfargument required="true" type="string" name="greetingsImage">
        <cffile action="upload" destination="#ExpandPath("../images")#" nameConflict="MakeUnique">
        <cfset local.imgName = cffile.clientFile>
        <cfset local.serverImgPath = ExpandPath("../images/#local.imgName#")>

        <cfmail to="#email#" from="user@coldfission.com" subject="Birthday Greetings" mimeattach="#local.serverImgPath#">
            Hi #name#,
            #bdayMessage#
        </cfmail>
    </cffunction>
</cfcomponent>
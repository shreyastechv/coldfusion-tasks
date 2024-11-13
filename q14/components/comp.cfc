<cfcomponent>
    <cffunction name="uploadImage" returnType="struct" access="remote">
        <cfif StructKeyExists(form, "submit")>
            <cffile action="upload" destination="#ExpandPath('../images')#" accept="image/jpeg, image/gif, image/png" fileField="form.imageFile" nameconflict="makeunique">
            <cfset local.imageName = cffile.clientFile>
            <cfset session.imagePath = ExpandPath("../images/#local.imageName#")>
            <cfset session.imageName = form.imageName>
            <cfset session.imageDesc = form.imageDesc>
            <cflocation url="../list.cfm" addToken="no">
        </cfif>
    </cffunction>
</cfcomponent>
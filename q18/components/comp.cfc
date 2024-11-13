<cfcomponent>
    <cffunction name="makeQuery" returnType="query" access="public">

        <cfset local.listColumnNames = "id,name,email">
        <cfset local.listColumnTypes = "Integer,VarChar,VarChar">
        <cfset local.rowData = [
            {"id":"101", "name":"Tony Stark", "email":"tony@starkindustries.io"},
            {"id":"102", "name":"Wade Wilson", "email":"wade@deadpool.org"},
            {"id":"103", "name":"Bruce Banner", "email":"bruce@hulk.com"}
        ]>

        <cfset local.newQuery = QueryNew(local.listColumnNames, local.listColumnTypes, local.rowData)>

        <cfreturn local.newQuery>
    </cffunction>
</cfcomponent>
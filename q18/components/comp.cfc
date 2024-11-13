<cfcomponent>
    <cffunction name="makeQuery" returnType="query" access="public">

        <cfset listColumnNames = "id,name,email">
        <cfset listColumnTypes = "Integer,VarChar,VarChar">
        <cfset rowData = [
            {"id":"101", "name":"Tony Stark", "email":"tony@starkindustries.io"},
            {"id":"102", "name":"Wade Wilson", "email":"wade@deadpool.org"},
            {"id":"103", "name":"Bruce Banner", "email":"bruce@hulk.com"}
        ]>

        <cfset local.newQuery = QueryNew(listColumnNames, listColumnTypes, rowData)>

        <cfreturn local.newQuery>
    </cffunction>
</cfcomponent>
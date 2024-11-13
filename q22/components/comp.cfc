<cfcomponent>
    <cffunction name="makeQuery" returnType="query" access="public">

        <cfset local.listColumnNames = "name,age,location">
        <cfset local.listColumnTypes = "VarChar,Integer,VarChar">
        <cfset local.rowData = [{"name":"saravanan","age":27,"location":"dubai"},{"name":"Ram","age":26,"location":"Kovilpatti"}]>

        <cfset local.newQuery = QueryNew(local.listColumnNames, local.listColumnTypes, local.rowData)>

        <cfreturn local.newQuery>
    </cffunction>
</cfcomponent>
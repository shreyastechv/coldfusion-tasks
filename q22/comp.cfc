<cfcomponent>
    <cffunction name="makeQuery" returnType="query" access="public">

        <cfset listColumnNames = "name,age,location">
        <cfset listColumnTypes = "VarChar,Integer,VarChar">
        <cfset rowData = [{"name":"saravanan","age":27,"location":"dubai"},{"name":"Ram","age":26,"location":"Kovilpatti"}]>

        <cfset local.newQuery = QueryNew(listColumnNames, listColumnTypes, rowData)>

        <cfreturn local.newQuery>
    </cffunction>
</cfcomponent>
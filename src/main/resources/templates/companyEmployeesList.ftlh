<#import "parts/common.ftlh" as c>

<@c.page>
    <h2>List of all ${company.name}`s employees</h2>
    <table>
        <thead>
        <tr>
            <th>UserName</th>
            <th>Role</th>
            <th>Email</th>
            <th>First Name</th>
            <th>Second Name</th>
            <th>Statistics</th>
            <th>Fire</th>
        </tr>
        </thead>
        <tbody>
        <#list employees as employee>
            <tr>
                <th>${employee.username}</th>
                <th><#if employee.position??>${employee.position}</#if></th>
                <th><#if employee.email??>${employee.email}</#if></th>
                <th><#if employee.firstName??>${employee.firstName}</#if></th>
                <th><#if employee.secondName??>${employee.secondName}</#if></th>
                <th><a href="/company/statistics/${employee.id}">statistics</a></th>
                <th><a href="/company/fire/${employee.id}">fire</a></th>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>
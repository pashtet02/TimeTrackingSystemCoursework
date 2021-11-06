<#import "parts/common.ftlh" as c>

<@c.page>
<h2>Users list</h2>
<table>
    <thead>
    <tr>
        <th>UserName</th>
        <th>First Name</th>
        <th>Second Name</th>
    </tr>
    </thead>
    <tbody>
    <#list employees as employee>
    <tr>
        <th>${employee.username}</th>
        <th><#if employee.firstName??>${employee.firstName}</#if></th>
        <th><#if employee.secondName??>${employee.secondName}</#if></th>
        <th><a href="/employer/invite/${employee.id}">Invite user to a company</a></th>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
<#import "parts/common.ftlh" as c>

<@c.page>
<h2>List of all application users</h2>
<table>
    <thead>
    <tr>
        <th>UserName</th>
        <th>Role</th>
        <th>Email</th>
        <th>First Name</th>
        <th>Second Name</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <th>${user.username}</th>
        <th><#list user.roles as role>${role}<#sep>, </#list></th>
        <th>email</th>
        <th><#if user.firstName??>${user.firstName}</#if></th>
        <th><#if user.secondName??>${user.secondName}</#if></th>
        <th><a href="/user/${user.id}">edit</a></th>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
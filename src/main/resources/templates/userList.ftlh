<#import "parts/common.ftlh" as c>
<#import "/spring.ftl" as spring/>

<@c.page>
<h2><@spring.message "userList.header"/></h2>
<table>
    <thead>
    <tr>
        <th><@spring.message "userList.username"/></th>
        <th><@spring.message "userList.Role"/></th>
        <th><@spring.message "userList.Email"/></th>
        <th><@spring.message "userList.FirstName"/></th>
        <th><@spring.message "userList.SecondName"/></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <th>${user.username}</th>
        <th><#list user.roles as role>${role}<#sep>, </#list></th>
        <th><#if user.email??>${user.email}</#if></th>
        <th><#if user.firstName??>${user.firstName}</#if></th>
        <th><#if user.secondName??>${user.secondName}</#if></th>
        <th><a class="btn btn-primary" href="/user/${user.id}"><@spring.message "userList.edit"/></a></th>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
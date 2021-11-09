<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <#if message??>
        <span>${message}</span>
    </#if>
<@l.login "/login" false/>
</@c.page>
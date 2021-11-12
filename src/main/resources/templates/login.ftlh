<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<#include "parts/security.ftlh">

<@c.page>
    <#if message??>
        <span>${message}</span>
    </#if>
<@l.login "/login" false/>
</@c.page>
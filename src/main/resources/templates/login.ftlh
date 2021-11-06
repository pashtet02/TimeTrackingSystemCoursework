<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<h3>Login page</h3>
    ${message!}
<@l.login "/login"/>
<a href="/registration">New here? Register!</a><br>
</@c.page>
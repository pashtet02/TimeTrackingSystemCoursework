<#import "parts/common.ftlh" as c>
<@c.page>
shit it`s 400 error dude!

    <div>
        <#if error??>
            <span>${error}</span>
        </#if>
    </div>

<a href="/">Click</a>
</@c.page>
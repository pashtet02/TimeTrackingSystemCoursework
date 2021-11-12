<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    isEmployer = user.isEmployer()
    isEmployee = user.isEmployee()
    hasCompany = user.hasCompany()
    >
<#else>
    <#assign
    name = ""
    isAdmin = false
    isEmployer = false
    isEmployee = false
    hasCompany = false
    >
</#if>
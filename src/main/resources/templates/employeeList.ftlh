<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h2>Invite an employee</h2>
    <div class="mt-2">
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">NickName</th>
                <th scope="col">First name</th>
                <th scope="col">Second Name</th>
                <th scope="col">Invite</th>
            </tr>
            </thead>
            <tbody>
            <#list employees as employee>
                <tr>
                    <th scope="row">${employee.id}</th>
                    <th>${employee.username}</th>
                    <th><#if employee.firstName??>${employee.firstName}</#if></th>
                    <th><#if employee.secondName??>${employee.secondName}</#if></th>
                    <th>
                        <form action="/employer/inviteEmployee/${employee.id}?companyName=<#if company.name??>${company.name}<#else>not-found</#if>"
                              method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <div>
                                <input class="btn btn-primary btn-sm" type="submit" value="Invite employee"/>
                            </div>
                        </form>
                    </th>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</@c.page>
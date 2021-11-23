<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<#import "/spring.ftl" as spring/>

<@c.page>
    <h2><@spring.message "employeeList.header"/></h2>
    <div class="mt-2">
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col"><@spring.message "employeeList.hashTag"/></th>
                <th scope="col"><@spring.message "employeeList.NickName"/></th>
                <th scope="col"><@spring.message "employeeList.FirstName"/></th>
                <th scope="col"><@spring.message "employeeList.SecondName"/></th>
                <th scope="col"><@spring.message "employeeList.Invite"/></th>
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
                                <input class="btn btn-primary btn-sm" type="submit" value="<@spring.message "employeeList.inviteButton"/>"/>
                            </div>
                        </form>
                    </th>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</@c.page>
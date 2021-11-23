<#import "parts/common.ftlh" as c>
<#import "/spring.ftl" as spring/>

<@c.page>
<div class="mb-1"><@spring.message "registration.header"/></div>
<#if message??>
    <span>${message}</span>
</#if>

<form action="/registration" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"><@spring.message "registration.UserName"/></label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="<@spring.message "registration.userNamePlaceHolder"/>" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"><@spring.message "registration.password"/></label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="<@spring.message "registration.passwordPlaceHolder"/>" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"><@spring.message "registration.firstName"/></label>
        <div class="col-sm-6">
            <input type="text" name="firstName" class="form-control" placeholder="<@spring.message "registration.firstNamePlaceHolder"/>" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"><@spring.message "registration.secondName"/></label>
        <div class="col-sm-6">
            <input type="text" name="secondName" class="form-control" placeholder="<@spring.message "registration.secondNamePlaceHolder"/>" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"><@spring.message "registration.email"/></label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="some@some.com" />
        </div>
    </div>
    <div class="form-group row">
        <label for="inputRole" class="col-sm-2 col-form-label"><@spring.message "registration.roleHeader"/></label>
        <div class="col-sm-2">
        <select id="inputRole" name="role" class="form-control">
            <option value="employee"><@spring.message "registration.employee"/></option>
            <option value="employer"><@spring.message "registration.employer"/></option>
        </select>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input class="btn btn-primary" type="submit" value="<@spring.message "registration.createButton"/>"/></div>
</form>
</@c.page>
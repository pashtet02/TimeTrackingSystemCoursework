<#import "parts/common.ftlh" as c>
<@c.page>
<div class="mb-1">Add new user</div>
<#if message??>
    <span>${message}</span>
</#if>

<form action="/registration" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">User Name :</label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="User name" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Password" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">First name:</label>
        <div class="col-sm-6">
            <input type="text" name="firstName" class="form-control" placeholder="First Name" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Last name:</label>
        <div class="col-sm-6">
            <input type="text" name="secondName" class="form-control" placeholder="Last Name" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="some@some.com" />
        </div>
    </div>
    <div class="form-group row">
        <label for="inputRole" class="col-sm-2 col-form-label">Role:</label>
        <div class="col-sm-2">
        <select id="inputRole" name="role" class="form-control">
            <option value="employee">Employee</option>
            <option value="employer">Employer</option>
        </select>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input class="btn btn-primary" type="submit" value="Create an account"/></div>
</form>
</@c.page>
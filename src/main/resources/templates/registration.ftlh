<#import "parts/common.ftlh" as c>
<@c.page>
<h3>Add new user</h3>
<#if message??>
    <span>${message}</span>
</#if>

<form action="/registration" method="post">
    <div><label> User Name : <input type="text" name="username"/> </label></div>
    <div><label> Password: <input type="password" name="password"/> </label></div>
    <div><label> First name: <input type="text" name="firstName"/> </label></div>
    <div><label> Second name: <input type="text" name="secondName"/> </label></div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="some@some.com" />
        </div>
    </div>
    <div><label> Role: <select name="role" id="role">
                <option value="employee">Employee</option>
                <option value="employer">Employer</option></select></label></div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input type="submit" value="Sign In"/></div>
</form>
</@c.page>
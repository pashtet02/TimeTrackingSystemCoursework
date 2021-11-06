<#import "parts/common.ftlh" as c>

<@c.page>
    <h2>Company Creator</h2>
    <form action="/company" method="post" enctype="multipart/form-data">
        <input type="text" name="companyName" placeholder="Enter company name"/><br>
        <label>
            <input type="text" name="companyCountry" placeholder="Enter company country"/>
        </label><br>
        <input type="file" name="image"/><br>
        <input type="hidden" value="${_csrf.token}" name="_csrf"/><br>
        <button type="submit">Create a company</button>
    </form>
</@c.page>
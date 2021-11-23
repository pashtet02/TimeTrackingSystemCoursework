<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<#import "/spring.ftl" as spring/>

<@c.page>
    <div class="page-wrap d-flex flex-row align-items-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <span class="display-1 d-block"><@spring.message "greeting.header"/></span>
                    <div class="mb-4 lead"><@spring.message "greeting.welcome"/><br>
                    <a class="btn btn-primary mt-4" href="/main"><@spring.message "greeting.goToReports"/></a>
                </div>
            </div>
        </div>
    </div>
</@c.page>
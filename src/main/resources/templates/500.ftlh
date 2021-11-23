<#import "parts/common.ftlh" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <div class="page-wrap d-flex flex-row align-items-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <span class="display-1 d-block"><@spring.message "errorPage.code"/></span>
                    <div class="mb-4 lead"><@spring.message "errorPage.notFound"/><br>
                        <#if error??>${error}</#if></div>
                    <a href="/" class="btn btn-link"><@spring.message "errorPage.backToHome"/></a>
                </div>
            </div>
        </div>
    </div>
</@c.page>
<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group">
        <label for="exampleInputEmail1"> Username : </label>
        <div class="col-sm-6">
            <input class="form-control${(usernameError??)?string(' is-invalid', '')}" <#if user??>value="${user.username}"</#if> type="text" name="username" placeholder="Username"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1"> Password: </label>
        <div class="col-sm-6">
            <input class="form-control${(passwordError??)?string(' is-invalid', '')}"  type="password" name="password" placeholder="Password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="form-group">
            <label for="exampleInputPassword1"> Password confirmation: </label>
            <div class="col-sm-6">
                <input class="form-control${(passwordConfirmationError??)?string(' is-invalid', '')}" type="password" name="passwordConfirmation" placeholder="Retype password"/>
                <#if passwordConfirmationError??>
                    <div class="invalid-feedback">
                        ${passwordConfirmationError}
                    </div>
                </#if>
            </div>
        </div>
    <div class="form-group">
        <label for="exampleInputPassword1"> Email: </label>
        <div class="col-sm-6">
            <input class="form-control${(emailError??)?string(' is-invalid', '')}" type="email" name="email" placeholder="somemails@example.com"/>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </div>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <#if !isRegisterForm> <a href="/registration">Register</a></#if>
    <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit" class="btn btn-primary">Log out</button>
</form>
</#macro>
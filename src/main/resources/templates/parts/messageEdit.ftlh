<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Edit message
</a>
<form method="post" class="collapse row row-cols-lg-auto mt-3 g-4 align-items-center<#if textError??> show<#elseif tagError??> show</#if>" id="collapseExample" enctype="multipart/form-data">
        <div class="col-12">
            <input type="text" class="form-control${(textError??)?string(' is-invalid', '')}"
                    <#if message??>
                        value="${message.text}"
                    </#if>
                   name="text" placeholder="Some text">
            <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
            </#if>
        </div>
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-text" id="basic-addon1">#</span>
                <input type="text" name="tag" class="form-control${(tagError??)?string(' is-invalid', '')}" aria-describedby="basic-addon1"
                        <#if message??>
                            value="${message.tag}"
                        </#if>
                       placeholder="Some tag" >
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="col-12">
            <input type="file" class="form-control" name="file">
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
    </form>
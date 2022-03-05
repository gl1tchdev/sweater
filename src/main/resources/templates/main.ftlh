<#import "parts/common.ftlh" as c>
<@c.page>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>

<form method="get" class="row row-cols-lg-auto g-3 align-items-center" action="/main">
    <div class="col-12">
        <div class="input-group">
            <span class="input-group-text" id="basic-addon1">#</span>
            <input type="text" name="filter" class="form-control" aria-describedby="basic-addon1" placeholder="Search by tag" value="${message?ifExists}">
        </div>
    </div>
    <div class="col-12">
        <button class="btn btn-primary" type="submit">Search</button>
    </div>
    <div>
        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add new message
        </a>
    </div>
</form>

<form method="post" class="collapse row row-cols-lg-auto mt-3 g-4 align-items-center" id="collapseExample" enctype="multipart/form-data">
    <div class="col-12">
        <input type="text" class="form-control" name="text" placeholder="Some text">
    </div>
    <div class="col-12">
        <div class="input-group">
            <span class="input-group-text" id="basic-addon1">#</span>
            <input type="text" name="tag" class="form-control" aria-describedby="basic-addon1" placeholder="Some tag" >
        </div>
    </div>
    <div class="col-12">
        <input type="file" class="form-control" name="file">
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Add</button>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
</form>
 <div class="row" data-masonry='{"percentPosition": true }'>
    <#list messages as message>
        <div class="col-sm-4 col-md-3 py-3">
        <div class="card border-primary">
            <#if message.filename??>
                <img class="card-img-top" src="/img/${message.filename}" alt=""/>
            </#if>
            <div class="card-body">
                <div class="card-text m-2">
                    <span>${message.text}</span>
                    <i>#${message.tag}</i>
                </div>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>
        </div>
        </div>
        <#else>
        No messages
    </#list>
</div>
</@c.page>
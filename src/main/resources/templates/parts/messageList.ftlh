<#include "security.ftlh">
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
    <div class="row" data-masonry='{"percentPosition": true }'>
        <#list messages as message>
            <div class="col-sm-4 col-md-3 py-3">
                <div class="card border-primary">
                    <#if message.filename??>
                        <img class="card-img-top" src="/img/${message.filename}" alt=""/>
                    </#if>
                    <div class="card-body">
                        <div class="card-text m-2">
                            <span>${message.text}</span><br/>
                            <i>#${message.tag}</i>
                        </div>
                    </div>
                    <div class="card-footer text-muted">
                        <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                        <#if message.author.id == currentUserId>
                            <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">edit</a>
                                </#if>
                    </div>
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>

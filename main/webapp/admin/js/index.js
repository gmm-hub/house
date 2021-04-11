// 实现分页效果
//首页
function firstPage(url,query){
    var pageNow = $("#pageNow").val();
    pageNow=1;
    window.location.href=url+"page="+pageNow+"&searchName="+query;
}
//末页
function lastPage(myPages,url,query){
    var pageNow = $("#pageNow").val();
    pageNow=myPages;
    window.location.href=url+"page="+pageNow+"&searchName="+query;
}
//上一页
function prePage(url,query){
    var pageNow = $("#pageNow").val();
    if(pageNow>1){
        pageNow = pageNow-1;
    }else if(pageNow == 1){
        pageNow = 1;
        alert("已至首页");
    }
    window.location.href=url+"page="+pageNow+"&searchName="+query;
}
//下一页
function nextPage(myPages,url,query){
    var pageNow = $("#pageNow").val();
    if(pageNow < myPages){
        pageNow = pageNow-(-1);
    }else if(pageNow == myPages){
        pageNow = myPages;
        alert("已至末页");
    }
    window.location.href=url+"page="+pageNow+"&searchName="+query;
}
//跳转
/*页面跳转*/
function skipPage(url,myPages,query){
    var pageNow = $("#pageNow").val();
    if(pageNow>=1 && pageNow<=myPages){
        window.location.href=url+"page="+pageNow+"&searchName="+query;
    }else{
        alert("超出页数范围");
    }
}
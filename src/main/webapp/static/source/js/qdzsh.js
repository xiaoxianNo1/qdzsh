
//获取cookie
function getCookie(cname) {
    var name =cname+"=";
    var ca= document.cookie.split(';');
    for(var i=0;i<ca.length;i++){
        var c=ca[i].trim();
        if(c.indexOf(name)==0)
            return c.substring(name.length,c.length);
    }
    return "";
}

//从当前窗口返回上一页
function backClick() {
    history.go(-1);
}

//从当前窗口打开窗口
function loadPage(pageAddress) {
    window.location.href='<%=path%>'+pageAddress;
}

function loadWinOpen(pageAddress) {
    window.open('<%=path%>'+pageAddress);
}
function closeThisWindow() {
    window.close();
}

//把日期字符串转换为日期格式
function timestampToTime(timestamp) {
    var date =new Date(timestamp);
    Y=date.getFullYear()+'-';
    M=(date.getMonth()+1<10?'0'+(date.getMonth()+1):date.getMonth()+1)+'-';
    D=date.getDate()+' ';
    h=date.getHours()+':';
    m=date.getMinutes()+':';
    s=date.getSeconds();
    return Y+M+D+h+m+s;
}
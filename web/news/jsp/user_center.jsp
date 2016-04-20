<%@ page import="com.xieyan.news.bean.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta charset="utf-8">
<meta name="viewport"
      content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
<title></title>
<link rel="stylesheet" type="text/css" href="<c:url value='/news/css/api.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/news/css/common.css'/>"/>
<style>
    body, html {
    }

    .login-header-btn {
        display: inline-block;
        padding: 30px;
        /*width: 80px;*/
        height: 80px;
        background-size: 50px;
        background-repeat: no-repeat;
        background-position: center;
    }

    .close {
        background-image: url("/news/image/close_icon_normal@2x.png");
    }

    .setting {
        background-image: url("/news/image/setting_icon_normal@2x.png");
    }

    .login-header .nologin-user {
        -webkit-transform: rotateY(0deg);
        background-image: url("/news/image/user_defaulthead@2x.png");
    }

    .login-header .login-user {
        -webkit-transform: rotateY(0deg);
        background-image: url("/news/image/92.png");
    }

    .login-header .prize {
        -webkit-transform: rotateY(180deg);
        background-image: url("/news/image/user_defaultgift@2x.png");
    }

    .flip {
        -webkit-transition-property: -webkit-transform, background-image;
        -webkit-transition-duration: 1.5s, 0.1s;
        -webkit-transition-delay: 0.1s;
    }

    .login-header {
        height: 35%;
        background-color: #1C1515;
    }

      .title {
        text-align: center;
        padding-top: 20px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
    }

    .login {
        color: #FFFFFF;
        font-size: 18px;
    }

    .score {
        padding-top: 7px;
        color: #EFED84;
    }

    .mine {
        background-color: #1C1515;
        padding-top: 5px;
    }

    .mine li, .bottom li {
        display: inline-block;
        width: 32%;
        text-align: center;
        padding: 20px 0 6px;
        background-size: 30px;
        background-repeat: no-repeat;
        background-position: top;
    }

    .bottom li {
        width: 19%;
        background-size: 30px;
    }

    .mine li span {
        margin: 15px 10px 0 10px;
        color: #737377;
    }

    .bottom li span {
        margin: 15px 10px 0 10px;
        color: #737377;
        font-size: 12px;
    }

    .read {
        background-image: url("/news/image/user_reading_circle@2x.png");
    }

    .star {
        background-image: url("/news/image/user_favor_circle@2x.png");
    }

    .comment {
        background-image: url("/news/image/user_comment_circle@2x.png");
    }

    .activity {
        margin: 0 10px;
    }

    .activity li {
        padding: 15px 0;
        background-size: 8px;
        background-repeat: no-repeat;
        background-position: right;
        background-image: url("/news/image/setting_cell_arrow@2x.png");
        border-bottom: 1px solid #F6F6F6;
    }

    .activity li:last-child {
        border-bottom: none;
    }

    .subtitle {
        font-size: 16px;
        margin-left: 10px;
    }

    .tag {
        color: #FFFFFF;
        padding: 2px;
        font-size: 13px;
        border-radius: 2px;
    }

    .a1 {
        background-color: #FB000D;
    }

    .a2 {
        background-color: #2CA6E6;
    }

    .a3 {
        background-color: #FC5E48;
    }

    .a4 {
        background-color: #04BC6F;
    }

    .plugin {
        background-image: url("/news/image/plugin_icon_setting@2x.png");
    }

    .offline {
        background-image: url("/news/image/pluginboard_icon_offline@2x.png");
    }

    .night {
        background-image: url("/news/image/pluginboard_icon_night@2x.png");
    }

    .search {
        background-image: url("/news/image/pluginboard_icon_search@2x.png");
    }

    .more {
        background-image: url("/news/image/pluginboard_icon_more@2x.png");
    }

    .login-user {
        background-image: url("/news/image/user_weiboimage_netease@2x.png");
    }
</style>
<script type="text/javascript">
    function backNewsList() {
        window.location.href = "${IP}/news?type=newsBack";
    }
</script>
</head>
<body>
<header>
    <div class="login-header header ">
        <div class="login-header-btn"><a style="color: #ffffff" onclick="backNewsList()">< 返回</a></div>
        <div class="hidden title">
            <div class="login-header-btn login-user" tapmode="" onclick="toSetting()"></div>
            <div class="login">xxxx</div>
            <div class="score">720金币 6个任务未完成</div>
        </div>
        <div class=" title">
            <%
                User user = (User) request.getSession().getAttribute("CLIENT_USER");
                if (null != user) { //已经进行登录
            %>
            <div class="login-header-btn" id="user" tapmode="">
                <img src="/news/image/92.png" style="width: 80px;height: 80px;">
            </div>
            <div class="login">欢迎:<%=user.getUserName()%>
            </div>
            <%
            } else {
            %>
            <div class="login-header-btn nologin-user" id="user" tapmode="" onclick="toLogin()"></div>
            <div class="login">立即登录</div>
            <div class="score">赢积分抢大礼!</div>
            <%
                }
            %>
        </div>
        <div class="login-header-btn setting hidden-v" tapmode=""></div>
    </div>
</header>
<ul class="mine">
    <li class="read" onclick="toSetting()" tapmode="">
        <span>
            阅读
        </span>
    </li>
    <li class="star" onclick="toSetting()" tapmode="">
        <span>
            收藏
        </span>
    </li>
    <li class="comment" onclick="toSetting()" tapmode="">
        <span>
            跟帖
        </span>
    </li>
</ul>
<ul class="activity">
    <li onclick="toSetting()" tapmode="">
        <span class="a1 tag">商城</span>
        <span class="subtitle">敬孝心,带着爸妈免费体检</span>
    </li>
    <li onclick="toSetting()" tapmode="">
        <span class="a2 tag">活动</span>
        <span class="subtitle">办证：挖掘机技术专业证</span>
    </li>
    <li onclick="toSetting()" tapmode="">
        <span class="a3 tag">应用</span>
        <span class="subtitle">挖金币技术哪里强</span>
    </li>
    <li onclick="toSetting()" tapmode="">
        <span class="a4 tag">游戏</span>
        <span class="subtitle">该升级了 带着礼包奔跑吧</span>
    </li>
</ul>
<ul class="bottom hidden">
    <li class="plugin">
        <span>
            13°/-1°
        </span>
    </li>
    <li class="offline">
        <span>
            离线
        </span>
    </li>
    <li class="night">
        <span>
            夜间
        </span>
    </li>
    <li class="search">
        <span>
            搜索
        </span>
    </li>
    <li class="more">
        <span>
            更多
        </span>
    </li>
</ul>
<script src="<c:url value='/news/script/zepto.min.js'/>"></script>
<script>
    /*setTimeout(function () {
     $("#user").addClass('prize flip');
     }, 500)
     setTimeout(function () {
     $("#user").removeClass('prize');
     }, 2000)*/
    apiready = function () {
        checkUserId();
        fixIos7Bar($(".header"));
    };

    function checkUserId() {
        if (localStorage.getItem("userId")) {
            $(".login-user").parent().removeClass("hidden");
            $(".nologin-user").parent().addClass("hidden");
            $(".setting").removeClass('hidden-v').off('click').on('click', function () {
                toSetting()
            })
        } else {
            $(".login-user").parent().addClass("hidden");
            $(".nologin-user").parent().removeClass("hidden");
            $(".setting").addClass('hidden-v').off('click');
        }
    }

    function closeWin() {
        api.closeWin({})
    }
    function toLogin() {
        api.openWin({
            name: 'login',
            url: 'win_login.html'
        })
    }
    function toSetting() {
        api.openWin({
            name: 'setting',
            url: 'win_setting.html'
        })
    }
</script>
</body>
</html>
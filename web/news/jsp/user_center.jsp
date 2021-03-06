<%@ page import="com.xieyan.news.bean.User" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="taglibs.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/news/css/api.css"/>
    <link rel="stylesheet" type="text/css" href="/news/css/common.css"/>
    <style>
        body, html {
        }

        .login-header-btn {
            display: inline-block;
            padding: 30px;
            background-size: 50px;
            background-repeat: no-repeat;
            background-position: center;
        }

        .close {
            background-image: url("../image/close_icon_normal@2x.png");
        }

        .setting {
            background-image: url("../image/setting_icon_normal@2x.png");
        }

        .login-header .nologin-user {
            -webkit-transform: rotateY(0deg);
            background-image: url("../image/user_defaulthead@2x.png");
        }

        .login-header .prize {
            -webkit-transform: rotateY(180deg);
            background-image: url("../image/user_defaultgift@2x.png");
        }

        .flip {
            -webkit-transition-property: -webkit-transform, background-image;
            -webkit-transition-duration: 1.5s, 0.1s;
            -webkit-transition-delay: 0.1s;
        }

        .login-header {
            height: 240px;
            background-color: #1C1515;
        }

        .title {
            height: 200px;
            text-align: center;
            padding-top: 15px;
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
            background-image: url("../image/user_reading_circle@2x.png");
        }

        .star {
            background-image: url("../image/user_favor_circle@2x.png");
        }

        .comment {
            background-image: url("../image/user_comment_circle@2x.png");
        }

        .activity {
            margin: 0 10px;
        }

        .activity li {
            padding: 15px 0;
            background-size: 8px;
            background-repeat: no-repeat;
            background-position: right;
            background-image: url("../image/setting_cell_arrow@2x.png");
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
            background-image: url("../image/plugin_icon_setting@2x.png");
        }

        .offline {
            background-image: url("../image/pluginboard_icon_offline@2x.png");
        }

        .night {
            background-image: url("../image/pluginboard_icon_night@2x.png");
        }

        .search {
            background-image: url("../image/pluginboard_icon_search@2x.png");
        }

        .more {
            background-image: url("../image/pluginboard_icon_more@2x.png");
        }

        .login-user {
            background-image: url("../image/user_weiboimage_netease@2x.png");
        }
    </style>
</head>
<body>
<header>
    <div class="login-header header ">
        <div class="login-header-btn close" tapmode="" onclick="goNewsList()"></div>

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
            <div class="login" onclick="toLogin()">立即登录</div>
            <%
                }
            %>
        </div>
        <div class="login-header-btn setting hidden-v" tapmode=""></div>
    </div>
</header>
<ul class="mine">

    <%
        if (null != user) {
    %>
    <li class="star" onclick="listCollection('<%=user.getId()%>')" 　tapmode="">
        <span>
            收藏
        </span>
    </li>
    <%
    } else {
    %>
    <li class="star" onclick="goLogin()" tapmode="">
        <span>
            收藏
        </span>
    </li>
    <%

        }
    %>

</ul>

<script src="../script/zepto.min.js"></script>
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

    function toLogin() {
        window.location.href = '${IP}/news/jsp/login.jsp';
    }
    function toSetting() {
        api.openWin({
            name: 'setting',
            url: 'win_setting.html'
        })
    }

    function listCollection(userId) {
        window.location.href = '${IP}/app/news?type=listCollection&userId=' + userId;
    }

    function goNewsList() {
        window.location.href = '${IP}/app/news?type=newsBack';
    }
</script>
</body>
</html>
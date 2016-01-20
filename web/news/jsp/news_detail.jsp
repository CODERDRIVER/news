﻿<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="../css/api.css"/>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
</head>
<style>
    body {
        display: -webkit-box;
        -webkit-box-orient: vertical;
    }

    .content {

    }

    .footer {
        background-color: #F5F5F6;
    }

    .detail-header {
        border-bottom: 1px solid #CDCDCD;
    }

    .back {
        background-image: url("../image/previous_arrow@2x.png");
        background-position: right !important;

    }

    .replycount {

        border-radius: 10px;
        -webkit-border-top-right-radius: 0;
        background-color: #CB393C;
        color: #FFFFFF;
        padding: 5px
    }

    .detail-header .reply {
        padding: 10px;

    }

    .footer {
        display: -webkit-box;
    }

    .footer a {
        display: inline-block;

        padding: 23px;
    }

    .share {
        background-size: 40px;
        background-image: url("../image/night_top_navigation_shareicon@2x.png");
        background-position: center;;
        background-repeat: no-repeat no-repeat;
    }

    .star {
        background-size: 30px;
        background-image: url("../image/night_icon_star_full@2x.png");
        background-position: center;;
        background-repeat: no-repeat no-repeat;
    }

    .replytext {
        margin-top: 5px;
        padding-left: 10px;
        height: 40px;
        margin-left: 10px;
        display: block;
        -webkit-box-flex: 1;
        border: 1px solid #C7C7C7;
        border-radius: 20px;
        background-color: #FFFFFF;
    }
    .title{
        line-height: 44px;
        text-align: center;
        margin-left: 49px;
    }
</style>
<body>
<header>
    <div class="header detail-header">
        <div class="btn back" tapmode="" onclick="api.closeWin()"></div>
        <div class="title" id="title">新闻详情</div>
        <div class="reply" tapmode="" onclick="reply()"><span class="replycount">7168跟帖</span></div>
    </div>
</header>
<div class="content">

</div>
<script src="../script/zepto.min.js"></script>
<script>

    apiready = function () {
        fixIos7Bar($("header"));
        var $headerH = $("header").height();
        var url = 'http://news.163.com/15/0212/19/AI9EI4TR0001124J.html';
        api.openFrame({
            name: 'detail-con',
            url: url,
            rect: {
                x: 0,
                y: $headerH,
                w: 'auto',
                h: 'auto'
            },
            showProgress: 'true'
        });
    }
    function reply(){
        api.openWin({
            name:'win_reply',
            url:'win_reply.html'
        })
    }
</script>
</body>
</html>
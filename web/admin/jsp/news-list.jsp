<%@ page import="com.xieyan.news.bean.News" %>
<%@ page import="java.util.List" %>
<%@ include file="/admin/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="utf-8"/>
    <title>News</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/admin/assets/css/font-awesome.min.css"/>
    <!-- fonts -->
    <link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:400,300"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/admin/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/admin/assets/css/ace-skins.min.css"/>

    <script type="text/javascript">

        function newsUpdate(element) {

            var parentTr = element.parentNode.parentNode;

            function NewsInfo() {
                this.id = parentTr.cells[0].innerHTML.trim("");
                this.newsTitle = parentTr.cells[1].innerHTML.trim("");
                this.newsAuthor = parentTr.cells[2].innerHTML.trim("");
                this.newsKind = parentTr.cells[3].innerHTML.trim("");
            }

            news = new NewsInfo();
            $('#updateNewsModalID').modal({
                keyboard: true
            });

            //为修改框modal中的设置默认的值
            $('#newsTitleID').attr('value', news.newsTitle);
            $('#newsUpdateID').attr('value', news.id);
            $('#newsKindID').attr('value', news.newsKind);
            //设置flightType的select中的值
            if (news.valid + '' == 1) {
                $("#newsKind").attr("value", 1);
            } else if (news.valid + '' == 2) {
                $('#newsKind').attr('value', 2);
            } else if (news.valid + '' == 3) {
                $('#newsKind').attr('value', 3);
            }
            $('#newsAuthorID').attr('value', news.newsAuthor);
            var btnAdd = $('#saveAdd');
            if (btnAdd == null) {
                alert("not found");
            } else {
                btnAdd.on('click', function () {
                    var form = $('#updateNewsFormID');
                    modalUpdateRequest('${pageContext.request.contextPath}/newsedit', form)
                    $('#updateNewsModalID').modal('hide');

                    alert("修改新闻信息成功！2秒后自动跳转到列表界面!");
                    sleep(2000);
                    window.location.href = '${pageContext.request.contextPath}/newsedit?type=list';
                });
            }
        }

        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }

        function newsDelete(element) {

            var confirmDeleteDialog = $('<div class="modal fade"><div class="modal-dialog">'
                    + '<div class="modal-content"><div class="modal-header"><button type="button" class="close" '
                    + 'data-dismiss="modal" aria-hidden="true">&times;</button>'
                    + '<h4 class="modal-title">确认删除</h4></div><div class="modal-body">'
                    + '<div class="alert alert-warning">确认要删除吗？删除之后无法恢复哦！</div></div><div class="modal-footer">'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>'
                    + '<button type="button" class="btn btn-success" id="deleteOK">删除</button></div></div>'
                    + '</div></div>');

            confirmDeleteDialog.modal({
                keyboard: false
            }).on({
                'hidden.bs.modal': function () {
                    $(this).remove();
                }
            });

            var deleteConfirm = confirmDeleteDialog.find('#deleteOK');
            deleteConfirm.on('click', function () {
                confirmDeleteDialog.modal('hide'); //隐藏dialog
                //需要回调的函数
                var idToDel = element.parentNode.parentNode.cells[0].innerHTML.trim("")
                var url = '${pageContext.request.contextPath}/newsedit?type=delete&id=' + idToDel;

                $.get(url, function (result) {

                }, "json");
                alert("删除用户成功！3秒后自动跳转到列表界面!");
                sleep(2000);
                window.location.href = '${pageContext.request.contextPath}/newsedit?type=list';
            });
        }

    </script>

</head>

<body>

<div class="modal" id="mymodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">模态弹出窗标题</h4>
            </div>
            <div class="modal-body">
                <p>模态弹出窗主体内容</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="navbar navbar-default" style="height: 30px;" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    News后台管理系统
                </small>
            </a>
        </div>

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="/admin/assets/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>欢迎光临,</small>
									ADMIN
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a href="#"><i class="icon-cog"></i>设置</a></li>
                        <li><a href="#"><i class="icon-user"></i>个人资料</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="icon-off"></i>退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div>

            <ul class="nav nav-list">
                <li class="active">
                    <a href="<c:url value='/admin/jsp/admin-index.jsp'/>">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> News后台管理系统 </span>
                    </a>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-desktop"></i>
                        <span class="menu-text"> 用户管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/user?type=list">
                                <i class="icon-double-angle-right"></i>
                                用户列表
                            </a>
                        </li>
                        <li>
                            <a href="user-add.jsp">
                                <i class="icon-double-angle-right"></i>
                                新增用户
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 新闻管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="news-edit.jsp">
                                <i class="icon-double-angle-right"></i>
                                新闻编辑
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/newsedit?type=list">
                                <i class="icon-double-angle-right"></i>
                                新闻列表
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-edit"></i>
                        <span class="menu-text"> 管理员设置 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin?type=list">
                                <i class="icon-double-angle-right"></i>
                                管理员列表
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/jsp/admin-add.jsp">
                                <i class="icon-double-angle-right"></i>
                                添加管理员
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                    <li class="active">News后台管理系统</li>
                </ul>
            </div>

            <div class="page-header">
                <h1>
                    News后台管理系统
                    <small>
                        <i class="icon-double-angle-right"></i>
                        用户列表
                    </small>
                </h1>
            </div>

            <div class="col-xs-12">
                <div class="alert alert-block alert-success">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="icon-remove"></i>
                    </button>
                    <i class="icon-ok green"></i>
                    欢迎使用
                    <strong class="green">
                        News后台管理系统
                    </strong>
                    用户列表
                </div>
            </div>

            <!-- 显示具体的界面信息 start-->
            <div id="userAddFormId">
                <%--搜索框 开始--%>
                <div class="container" style="height: 140px;">
                    <form name="form" target="_self" method="get" action="${pageContext.request.contextPath}/newsedit">
                        <input type="hidden" name="type" value="list">
                        <input type="hidden" name="page.currentPage" value="1">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <div class="form-group" style="text-align: center; line-height: 32px">
                                        <label class="control-label" style="width:50px;float:left;">标题:&nbsp;</label>

                                        <div style="margin-left:15px;float:left;">
                                            <input name="newsTitle" class="form-control" type="text"
                                                   style="width:120px;" value="${param.newsTitle}"/>
                                        </div>

                                        <label class="control-label" style="width:50px;float:left;">作者:&nbsp;</label>

                                        <div style="margin-left:15px;float:left;">
                                            <input name="newsAuthor" class="form-control" type="text"
                                                   value="${param.newsAuthor}"
                                                   style="width:120px;"/>
                                        </div>

                                        <label class="control-label" style="width:80px;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;新闻类别:&nbsp;</label>

                                        <div style="margin-left:15px;float:left;">
                                            <select name="newsKind" class="form-control">

                                                <c:if test="${param.newsKind == 1}">
                                                    <option value="1" selected="selected">科技</option>
                                                    <option value="2">计算机</option>
                                                    <option value="3">人文</option>
                                                </c:if>
                                                <c:if test="${param.newsKind == 2}">
                                                    <option value="1">科技</option>
                                                    <option value="2" selected="selected">计算机</option>
                                                    <option value="3">人文</option>
                                                </c:if>
                                                <c:if test="${param.newsKind == 3}">
                                                    <option value="1">科技</option>
                                                    <option value="2">计算机</option>
                                                    <option value="3" selected="selected">人文</option>
                                                </c:if>
                                                <c:if test="${param.newsKind != 1 && param.newsKind != 2 && param.newsKind != 3}">
                                                    <option value="1">科技</option>
                                                    <option value="2">计算机</option>
                                                    <option value="3">人文</option>
                                                    <option value="" selected="selected">全部</option>
                                                </c:if>

                                            </select>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div style="margin-left:15px;float:left;">
                                        <button id="search" type="submit" class="btn btn-primary">查询</button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <%--搜索框 结束--%>
                <%--白名单展示列表 开始--%>
                <div class="container" style="text-align: center;">
                    <table class="table">
                        <tr class="table-hover form-horizontal">
                            <td class="info">新闻ID</td>
                            <td class="info">新闻标题</td>
                            <td class="info">新闻作者</td>
                            <td class="info">新闻类别</td>
                            <td class="info">创建时间</td>
                            <td class="info">操作</td>
                        </tr>
                        <%
                            List<News> news = (List<News>) request.getAttribute("newsList");
                            for (News n : news) {
                        %>
                        <tr>
                            <td><%=n.getId()%>
                            </td>
                            <td><%=n.getNewsTitle()%>
                            </td>
                            <td><%=n.getNewsAuthor()%>
                            </td>
                            <td><%=n.getNewsKind()%>
                            </td>
                            <td><%=n.getDate()%>
                            </td>
                            <td>
                                <a onclick="newsUpdate(this)">修改</a>
                                <a onclick="newsDelete(this)">删除</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <!--分页效果的  开始-->
                    <%--分页数大于1的时候才显示--%>
                    <c:if test="${requestScope.totalPage >1}">
                        <c:if test="${param.cur == null}">
                            <a href="/newsedit?type=list&cur=1&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">首页</a>
                            <a href="/newsedit?type=list&cur=${param.cur + 2}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">下一页</a>
                        </c:if>

                        <c:if test="${param.cur != 1 && param.cur != null}">
                            <a href="/newsedit?type=list&cur=1&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">首页</a>
                            <a href="/newsedit?type=list&cur=${param.cur - 1}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">上一页</a>
                        </c:if>

                        <c:if test="${param.cur != requestScope.totalPage && param.cur != null}">
                            <a href="/newsedit?type=list&cur=${param.cur + 1}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">下一页</a>
                            <a href="/newsedit?type=list&cur=${requestScope.totalPage}&newsTitle=${param.newsTitle}&newsAuthor=${param.newsAuthor}&newsKind=${param.newsKind}">尾页</a>
                        </c:if>

                        <%--展示下边的信息--%>
                        <c:if test="${param.cur == null}">
                            <p>
                                当前第1页 总共${requestScope.totalPage}页
                            </p>
                        </c:if>
                        <c:if test="${param.cur != null}">
                            <p>
                                当前第${param.cur}页 总共${requestScope.totalPage}页
                            </p>
                        </c:if>
                    </c:if>
                    <!--分页效果的  结束-->
                </div>
            </div>
            <!-- 显示具体的界面信息 end-->
        </div>

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; 选择皮肤</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                    <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                    <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                    <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                    <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                    <label class="lbl" for="ace-settings-add-container">
                        切换窄屏
                        <b></b>
                    </label>
                </div>
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>

<%--修改的modal--%>
<div class="modal fade" id="updateNewsModalID">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">修改</h4>
            </div>
            <div class="modal-body" style="width: 80%">
                <%--表单的开始--%>
                <form id="updateNewsFormID" enctype="multipart/form-data">
                    <input type="hidden" name="type" value="update">
                    <input type="hidden" name="id" id="newsUpdateID">
                    <table>
                        <tr>
                            <td>
                                <label>新闻名称：</label>
                            </td>
                            <td>
                                <input type="text" name="newsTitle" id="newsTitleID">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>新闻类型：</label>
                            </td>
                            <td>
                                <select name="newsKind" id="newsKindID" class="form-control">
                                    <option value="1">科技</option>
                                    <option value="2">计算机</option>
                                    <option value="3">人文</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>新闻作者：</label>
                            </td>
                            <td>
                                <input type="text" name="newsAuthor" id="newsAuthorID">
                            </td>
                        </tr>
                    </table>
                </form>
                <%--表单的结束--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" id="saveAdd">保存</button>
            </div>
        </div>
    </div>
</div>
<%--modal结束--%>
<script type="text/javascript">

</script>
<!--显示成功、失败的modal-->
<%@include file="/admin/commons/modal-custom.jsp" %>
<script src="/admin/js/jquery-1.8.3.min.js"></script>
<script src="/admin/js/modal-operate.js"></script>
<script src="/admin/assets/js/bootstrap.min.js"></script>


<script src="/admin/js/jquery-form.js"></script>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: Brown
  Date: 2016/6/3
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html style="height:42px;">
<head>
<link href="/css/backstage/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/style-metro.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/style.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<%--<link href="/css/backstage/uniform.default.css" rel="stylesheet" type="text/css"/>--%>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="/css/backstage/jquery.gritter.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/daterangepicker.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/fullcalendar.css" rel="stylesheet" type="text/css"/>
<link href="/css/backstage/jqvmap.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="/css/backstage/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- END PAGE LEVEL STYLES -->
<link rel="shortcut icon" href="/images/backstage/favicon.ico"/>
</head>
<body>

<div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="navbar-inner">
        <div class="container-fluid">
            <!-- BEGIN LOGO -->
            <a class="brand">
                <img src="/images/backstage/logo.png" alt="logo"/>
            </a>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                <img src="/images/backstage/menu-toggler.png" alt=""/>
            </a>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <ul class="nav pull-right">
                <!-- BEGIN USER LOGIN DROPDOWN -->
                <li class="dropdown user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img alt="" src="/images/backstage/avatar1_small.jpg"/>
                        <c:if test="${manager1 != null}">
                            <span class="username">你好，${manager1.managerName} 管理员!</span>
                        </c:if>
                        <c:if test="${manager2 != null}">
                            <span class="username">你好，${manager2.managerName} 管理员!</span>
                        </c:if>
                        <c:if test="${teacher != null}">
                            <span class="username">你好，${teacher.teacherName} 老师!</span>
                        </c:if>
                        <c:if test="${student != null}">
                            <span class="username">你好，${student.studentName} 同学!</span>
                        </c:if>
                    </a>
                </li>
                <li class="dropdown user">
                    <a href="/index/logout" target="main">
                        <i class="icon-key"></i>登出
                    </a>
                </li>
                <!-- END USER LOGIN DROPDOWN -->
            </ul>
            <!-- END TOP NAVIGATION MENU -->
        </div>
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>

<script src="/js/backstage/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="/js/backstage/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="/js/backstage/bootstrap.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="/js/backstage/excanvas.min.js"></script>
<script src="/js/backstage/respond.min.js"></script>
<![endif]-->
<script src="/js/backstage/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.cookie.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="/js/backstage/jquery.vmap.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.world.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.flot.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.flot.resize.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="/js/backstage/date.js" type="text/javascript"></script>
<script src="/js/backstage/daterangepicker.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.gritter.js" type="text/javascript"></script>
<script src="/js/backstage/fullcalendar.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.easy-pie-chart.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/js/backstage/app.js" type="text/javascript"></script>
<script src="/js/backstage/index.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
        Index.init();
        Index.initJQVMAP(); // init index page's custom scripts
        Index.initCalendar(); // init index page's custom scripts
        Index.initCharts(); // init index page's custom scripts
        Index.initChat();
        Index.initMiniCharts();
        Index.initDashboardDaterange();

    });
</script>
</body>
<!-- END BODY -->
</html>



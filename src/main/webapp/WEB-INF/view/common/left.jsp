<%--
  Created by IntelliJ IDEA.
  User: Brown
  Date: 2016/6/3
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="margin-top: 10px">
<!-- BEGIN HEAD -->
<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES /css/backstage/bootstrap.min.css-->
    <link href="/css/backstage/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="/css/backstage/uniform.default.css" rel="stylesheet" type="text/css"/>
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
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="background-color: #3d3d3d;width: 225px">
<!-- BEGIN HEADER -->
<!-- END HEADER -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar nav-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <ul class="page-sidebar-menu">
            <li>
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler hidden-phone"></div>
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            </li>
            <li class="start active ">
                <a href="main.action" target="main">
                    <i class="icon-home"></i>
                    <span class="title">主页</span>
                    <span class="selected"></span>
                </a>
            </li>

            <c:if test="${role == 'manager1'}">
                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">导入信息</span>
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="/admin/batchImport" target="rightFrame">导入信息</a>
                        </li>
                            <%--<li>--%>
                            <%--<a href="addDevice.action" target="rightFrame">导入导师信息</a>--%>
                            <%--</li>--%>
                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">导出信息</span>
                        <span class="arrow "></span>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a href="/admin/exportVoluntaryInfo?optype=manager1" target="rightFrame">导出全部导师选择信息</a>
                        </li>
                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">信息维护管理</span>
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="">
                            <a href="javascript:;">
                                <i class="icon-file-text"></i>
                                <span class="title">学生信息维护</span>
                                <span class="arrow "></span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="/admin/findAllStudent" target="rightFrame">查看全部信息</a>
                                </li>
                            </ul>
                        </li>


                        <li class="">
                            <a href="javascript:;">
                                <i class="icon-file-text"></i>
                                <span class="title">导师信息维护</span>
                                <span class="arrow "></span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="/admin/findAllTeacher" target="rightFrame">查看全部信息</a>
                                </li>
                            </ul>
                        </li>
                        <li class="">
                            <a href="javascript:;">
                                <i class="icon-file-text"></i>
                                <span class="title">学生负责人信息维护</span>
                                <span class="arrow "></span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="/admin/findAllManager2" target="rightFrame">查看全部信息</a>
                                </li>
                            </ul>
                        </li>
                        <li class="">
                            <a href="javascript:;">
                                <i class="icon-file-text"></i>
                                <span class="title">学科专业信息维护</span>
                                <span class="arrow "></span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="/admin/findAllMajor" target="rightFrame">查看全部信息</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">系统功能管理</span>
                        <span class="arrow "></span>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a href="/admin/systemFunction" target="rightFrame">志愿填报功能管理</a>
                        </li>
                    </ul>
                </li>
            </c:if>

            <c:if test="${role == 'student'}">
                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">查看导师信息</span>
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="/student/teacherInfo?majorId=${student.majorId}" target="rightFrame">查看本专业导师信息</a>
                        </li>
                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">志愿管理</span>
                        <span class="arrow "></span>
                    </a>

                    <ul class="sub-menu">
                        <c:if test="${sysfunction == 1}">
                            <li>
                                <a href="/student/fillTeacher?majorId=${student.majorId}&studentId=${student.studentId}"
                                   target="rightFrame">填报志愿</a>
                            </li>
                        </c:if>
                        <c:if test="${sysfunction != 1}">
                            <li>
                                <a>未开放此功能</a>
                            </li>
                        </c:if>
                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">个人信息维护</span>
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="/student/editPasswordView?" target="rightFrame">修改密码</a>
                        </li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${role == 'teacher'}">
                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">学生志愿管理</span>
                        <span class="arrow "></span>
                    </a>

                    <ul class="sub-menu">
                        <c:if test="${sysfunction == 1}">
                            <li>
                                <a href="/teacher/showIntentionByTeacher?teacherId=${teacher.teacherId}"
                                   target="rightFrame">筛选预选学生</a>
                            </li>
                        </c:if>
                        <c:if test="${sysfunction != 1}">
                            <li>
                                <a>未开放此功能</a>
                            </li>
                        </c:if>
                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">个人信息维护</span>
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="addDevice.action" target="rightFrame">修改密码</a>
                        </li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${role == 'manager2'}">
                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">查看志愿填报情况</span>
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <c:if test="${sysfunction == 1}">
                            <li>
                                <a href="/admin/findStudentByManager2?collegeName=${manager2.collegeName}" target="rightFrame">学生填报志愿情况</a>
                            </li>
                            <li>
                                <a href="/admin/findTeacherByManager2?collegeName=${manager2.collegeName}" target="rightFrame">导师互选学生情况</a>
                            </li>
                        </c:if>
                        <c:if test="${sysfunction != 1}">
                            <li>
                                <a>未开放此功能</a>
                            </li>

                        </c:if>
                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">志愿管理</span>
                        <span class="arrow "></span>
                    </a>

                    <ul class="sub-menu">
                <c:if test="${sysfunction == 1}">
                        <li>
                            <a href="/admin/volunteerRecognitionView?collegeName=${manager2.collegeName}"
                               target="rightFrame">志愿确认</a>
                        </li>
                        <li>
                            <a href="/admin/voluntarySwapView?collegeName=${manager2.collegeName}" target="rightFrame">志愿调剂</a>
                        </li>
                        <li>
                            <a href="/admin/exportVoluntaryInfo?collegeName=${manager2.collegeName}&optype=manager2" target="rightFrame">导出志愿信息</a>
                        </li>
                    </c:if>
                        <c:if test="${sysfunction != 1}">
                            <li>
                                <a href=""
                                   target="rightFrame">未开放此功能</a>
                            </li>
                        </c:if>
                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="icon-file-text"></i>
                        <span class="title">个人信息维护</span>
                        <span class="arrow "></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="addDevice.action" target="rightFrame">修改密码</a>
                        </li>
                    </ul>
                </li>
            </c:if>

        </ul>
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
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
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>


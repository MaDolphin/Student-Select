<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>志愿意向信息</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/css/backstage/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/bootstrap-responsive.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="/css/backstage/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/default.css" rel="stylesheet" type="text/css"
          id="style_color"/>
    <link href="/css/backstage/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="/css/backstage/select2_metro.css"/>
    <link rel="stylesheet" href="/css/backstage/DT_bootstrap.css"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="/images/backstage/favicon.ico"/>
</head>

<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="background-color: white;line-height: 0px">


<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <!-- BEGIN PAGE CONTAINER-->
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <h3 class="page-title">
                        志愿意向信息：
                        <%--&nbsp;&nbsp;<input name="teacherId" id="teacherId" value="" type="text">--%>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li><a href="#">志愿意向信息</a></li>
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet-body">

                        <table class="table table-striped table-bordered table-hover" id="table_collage">
                            <thead>
                            <tr>
                                <th style="width:8px;">
                                    <input type="checkbox" class="group-checkable"
                                           data-set="#table_collage .checkboxes"/>
                                </th>
                                <th class="hidden-480">准考证号</th>
                                <th class="hidden-480">学生姓名</th>
                                <th class="hidden-480">所报专业</th>
                                <th class="hidden-480">第一志愿</th>
                                <th class="hidden-480">第二志愿</th>
                                <th class="hidden-480">第三志愿</th>
                                <th class="hidden-480">第一志愿情况</th>
                                <th class="hidden-480">第二志愿情况</th>
                                <th class="hidden-480">第三志愿情况</th>
                                <th class="hidden-480">分配志愿</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${intentionList}" var="intention">
                                <%--<form action="" id="form1" target="rightFrame" method="post" class="form-horizontal">--%>
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td class="hidden-480">${intention.studentId}</td>
                                    <td class="hidden-480">${intention.student.studentName}</td>
                                    <td class="hidden-480">${intention.major.majorName}</td>
                                        <%--第一志愿--%>
                                    <c:if test="${intention.firstIntention == ''}">
                                        <td class="hidden-480">当前志愿没有填写</td>
                                    </c:if>
                                    <c:if test="${intention.firstIntention != null}">
                                        <c:forEach items="${intention.teacher}" var="teacher">
                                            <c:if test="${intention.firstIntention == teacher.teacherId}">
                                                <td class="hidden-480">${teacher.teacherName}</td>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                        <%--第二志愿--%>
                                    <c:if test="${intention.secondIntention == ''}">
                                        <td class="hidden-480">当前志愿没有填写</td>
                                    </c:if>
                                    <c:if test="${intention.secondIntention != null}">
                                        <c:forEach items="${intention.teacher}" var="teacher">
                                            <c:if test="${intention.secondIntention == teacher.teacherId}">
                                                <td class="hidden-480">${teacher.teacherName}</td>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                        <%--第三志愿--%>
                                    <c:if test="${intention.thirdIntention == ''}">
                                        <td class="hidden-480">当前志愿没有填写</td>
                                    </c:if>
                                    <c:if test="${intention.thirdIntention != null}">
                                        <c:forEach items="${intention.teacher}" var="teacher">
                                            <c:if test="${intention.thirdIntention == teacher.teacherId}">
                                                <td class="hidden-480">${teacher.teacherName}</td>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${intention.firstOpttype == 0}">
                                        <td class="hidden-480">未确认</td>
                                    </c:if>
                                    <c:if test="${intention.firstOpttype != 0}">
                                        <td class="hidden-480">第${intention.firstOpttype}个确认</td>
                                    </c:if>
                                    <c:if test="${intention.secondOpttype == 0}">
                                        <td class="hidden-480">未确认</td>
                                    </c:if>
                                    <c:if test="${intention.secondOpttype != 0}">
                                        <td class="hidden-480">第${intention.firstOpttype}个确认</td>
                                    </c:if>
                                    <c:if test="${intention.thirdOpttype == 0}">
                                        <td class="hidden-480">未确认</td>
                                    </c:if>
                                    <c:if test="${intention.thirdOpttype != 0}">
                                        <td class="hidden-480">第${intention.firstOpttype}个确认</td>
                                    </c:if>

                                    <td class="hidden-480">
                                        <select style="width: 130px;height: 34px" name="selectTeacher"
                                                id="selectTeacher" class="select_field">
                                            <option value="" style="color:#999999" selected>
                                                -请选择导师-
                                            </option>
                                                <%--第一志愿--%>
                                            <c:if test="${intention.firstIntention != null}">
                                                <c:forEach items="${intention.teacher}" var="teacher">
                                                    <c:if test="${intention.firstIntention == teacher.teacherId}">
                                                        <option value="${teacher.teacherId}"
                                                                style="color:#999999">
                                                            第一志愿
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                                <%--第二志愿--%>
                                            <c:if test="${intention.secondIntention != null}">
                                                <c:forEach items="${intention.teacher}" var="teacher">
                                                    <c:if test="${intention.secondIntention == teacher.teacherId}">
                                                        <option value="${teacher.teacherId}"
                                                                style="color:#999999">
                                                            第二志愿
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                                <%--第三志愿--%>
                                            <c:if test="${intention.thirdIntention != null}">
                                                <c:forEach items="${intention.teacher}" var="teacher">
                                                    <c:if test="${intention.thirdIntention == teacher.teacherId}">
                                                        <option value="${teacher.teacherId}"
                                                                style="color:#999999">
                                                            第三志愿
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <option value="0" style="color:#999999">调剂</option>
                                        </select>
                                    </td>

                                    <td class="hidden-480">

                                        <a href="javascript:if(document.getElementById('selectTeacher').value == ''){alert('请选择一名导师或者调剂');}else if(confirm('确定分配该志愿吗?'))  {window.location='/admin/volunteerRecognition?studentId=${intention.studentId}&collegeName=${intention.major.collegeName}&selectTeacher='+document.getElementById('selectTeacher').value;}"
                                           class="btn mini green" target="rightFrame">
                                            <i class="icon-ok"></i>分配志愿
                                        </a>
                                    </td>
                                </tr>
                                <%--</form>--%>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
            <!-- END PAGE CONTAINER-->
        </div>
        <!-- END PAGE -->
    </div>
</div>
<!-- END CONTAINER -->


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
<script type="text/javascript" src="/js/backstage/select2.min.js"></script>
<script type="text/javascript" src="/js/backstage/jquery.dataTables.js"></script>
<script type="text/javascript" src="/js/backstage/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/js/backstage/app.js"></script>
<script src="/js/backstage/table-managed.js"></script>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();
    });
</script>

</body>
<!-- END BODY -->
</html>

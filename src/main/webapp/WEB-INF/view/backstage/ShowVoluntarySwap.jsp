<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>志愿分配信息</title>
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
<script>
    function select() {
        alert("!!!!!!");
        document.getElementById('teacherId').value = document.getElementById('selectTeacher').value;
    }
</script>
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
                        志愿分配信息：
                        <%--&nbsp;&nbsp;<input name="teacherId" id="teacherId" value="" type="text">--%>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li><a href="#">志愿分配信息</a></li>
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet-body">

                        <table class="table table-striped table-bordered table-hover" id="table_3">
                            <thead>
                            <tr>
                                <th style="width:8px;">
                                    <input type="checkbox" class="group-checkable"
                                           data-set="#table_3 .checkboxes"/>
                                </th>
                                <th class="hidden-480">准考证号</th>
                                <th class="hidden-480">学生姓名</th>
                                <%--<th class="hidden-480">所报专业</th>--%>
                                <th class="hidden-480">志愿调剂</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${studentList}" var="student">
                                    <%--<form action="" id="form1" target="rightFrame" method="post" class="form-horizontal">--%>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1"/></td>
                                        <td class="hidden-480">${student.studentId}</td>
                                        <td class="hidden-480">${student.studentName}</td>
                                            <%--<td class="hidden-480">${student.major.majorName}</td>--%>
                                        <td class="hidden-480">
                                            <select style="width: 130px;height: 34px" name="selectTeacher"
                                                    id="selectTeacher" class="select_field">
                                                <option value="" style="color:#999999" selected onchange="select()">
                                                    -请选择导师-
                                                </option>
                                                <c:forEach items="${student.teacher}" var="teacher">
                                                    <option value="${teacher.teacherId}" style="color:#999999">
                                                            ${teacher.teacherName}(${teacher.majorId})
                                                    </option>
                                                    <%--<option value="${student.teacher.get(1).getTeacherId()}" style="color:#999999">--%>
                                                    <%--第二志愿--%>
                                                    <%--</option>--%>
                                                    <%--<option value="${student.teacher.get(2).getTeacherId()}" style="color:#999999">--%>
                                                    <%--第三志愿--%>
                                                    <%--</option>--%>
                                                </c:forEach>
                                                    <%--<c:forEach items="${student.teacher}" var="teacherList">--%>
                                                    <%--<c:if test="${teacherList.teacherId == student.firstIntention}">--%>
                                                    <%--<option value="${teacherList.teacherId}" style="color:#999999">--%>
                                                    <%--第一志愿--%>
                                                    <%--</option>--%>
                                                    <%--</c:if>--%>
                                                    <%--<c:if test="${teacherList.teacherId == student.secondIntention}">--%>
                                                    <%--<option value="${teacherList.teacherId}" style="color:#999999">--%>
                                                    <%--第二志愿--%>
                                                    <%--</option>--%>
                                                    <%--</c:if>--%>
                                                    <%--<c:if test="${teacherList.teacherId == student.thirdIntention}">--%>
                                                    <%--<option value="${teacherList.teacherId}" style="color:#999999">--%>
                                                    <%--第三志愿--%>
                                                    <%--</option>--%>
                                                    <%--</c:if>--%>
                                                    <%--<option value="" style="color:#999999" selected>调剂${teacherList.teacherId}</option>--%>
                                                    <%--</c:forEach>--%>
                                                    <%--<option value="0" style="color:#999999">调剂</option>--%>
                                            </select>
                                        </td>

                                        <td class="hidden-480">

                                            <a href="javascript:if(confirm('确定调剂该志愿吗?'))  {alert(document.getElementById('selectTeacher').value);window.location='/admin/volunteerRecognition?studentId=${student.studentId}&collegeName=${student.major.collegeName}&selectTeacher='+document.getElementById('selectTeacher').value;}"
                                               class="btn mini green" target="rightFrame">
                                                <i class="icon-ok"></i>调剂志愿
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

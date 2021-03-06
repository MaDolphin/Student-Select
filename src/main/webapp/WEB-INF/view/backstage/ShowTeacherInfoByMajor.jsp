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
<script>
    function select(){
        alert("!!!!!!");
        document.getElementById('teacherId').value=document.getElementById('selectTeacher').value;
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
                        本专业导师信息：
                        <%--&nbsp;&nbsp;<input name="teacherId" id="teacherId" value="" type="text">--%>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li><a href="#">本专业导师信息</a></li>
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet-body">

                        <table class="table table-striped table-bordered table-hover" id="table_6">
                            <thead>
                            <tr>
                                <th style="width:8px;">
                                    <input type="checkbox" class="group-checkable"
                                           data-set="#table_6 .checkboxes"/>
                                </th>
                                <th class="hidden-480">导师编号</th>
                                <th class="hidden-480">导师姓名</th>
                                <th class="hidden-480">专业编号</th>
                                <th class="hidden-480">专业名称</th>
                                <th class="hidden-480">所属学院</th>
                                <th class="hidden-480">老师介绍</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${teacherList}" var="teacher">
                                <%--<form action="" id="form1" target="rightFrame" method="post" class="form-horizontal">--%>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1"/></td>
                                        <td class="hidden-480">${teacher.teacherId}</td>
                                        <td class="hidden-480">${teacher.teacherName}</td>
                                        <td class="hidden-480">${teacher.majorId}</td>
                                        <td class="hidden-480">${teacher.major.majorName}</td>
                                        <td class="hidden-480">${teacher.major.collegeName}</td>
                                        <td class="hidden-480">${teacher.teacherIntroduction}</td>
                                        <td class="hidden-480" ></td>
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

<%--
  Created by IntelliJ IDEA.
  User: Brown
  Date: 2016/6/4
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<title>单元间隔信息</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet"
		type="text/css" />
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="css/style-metro.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/style-responsive.css" rel="stylesheet" type="text/css" />
	<link href="css/default.css" rel="stylesheet" type="text/css"
		id="style_color" />
	<link href="css/uniform.default.css" rel="stylesheet" type="text/css" />
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="css/select2_metro.css" />
	<link rel="stylesheet" href="css/DT_bootstrap.css" />
	<link rel="stylesheet" href="css/button.css" />
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="images/favicon.ico" />
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
                    	单元间隔信息：
                    </h3>
                    
                    <ul class="breadcrumb">
                    
                     
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li>
                            <a href="#">单元间隔管理</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li><a href="#">单元间隔信息</a></li>
                       	<li class="nav pull-right">
                       		<a  href="substationDetails.action?substationNo=${substationNo}" target="rightFrame" class="button button-glow button-rounded button-caution" style="font-family: 微软雅黑;color: white; margin-top:-10px;margin-left:-20px;">变电站详情</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_ShowUnitInterval">
                            <thead>
                            <tr>
                                <th style="width:8px;">
                                    <input type="checkbox" class="group-checkable" data-set="#table_ShowUnitInterval .checkboxes"/>
                                </th>
                                <th class="hidden-480">单元编号</th>
                                <!-- <th class="hidden-480">设备编号</th>
                                <th class="hidden-480">设备类型</th> -->
                                <th class="hidden-480">所属变电站</th>
                                <th class="hidden-480">单元状态</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${unitIntervallist}" var="unitInterval">
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td class="hidden-480">${unitInterval.unitNo}</td>
                                    <td class="hidden-480">${unitInterval.substationNo}</td>
                                    <c:if test="${unitInterval.unitStatus == 1}">
                                    	<td ><span class="label label-success">投运</span></td>
                                    </c:if>
                                    <c:if test="${unitInterval.unitStatus == 0}">
                                    	<td ><span class="label label-warning">新建</span></td>
                                    </c:if>
                                    <c:if test="${unitInterval.unitStatus == 2}">
                                    	<td ><span class="label label-default">报废</span></td>
                                    </c:if>
                                    <td>
                                    	<a href="deviceDetails.action?unitNo=${unitInterval.unitNo}&substationNo=${substationNo}" class="btn mini blue">设备详情</a>
                                    	<c:if test="${user == 'manager'}">
	                                    	<c:if test="${unitInterval.unitStatus == 0 or unitInterval.unitStatus == 2 }">
												<a href="javascript:if(confirm('确定删除吗?'))window.location='deleteUnitIntervalMethod.action?unitNo=${unitInterval.unitNo}'" class="btn mini gray" target="rightFrame"><i class="icon-trash"></i> 删除</a>
											</c:if>
										</c:if>
                                    </td>
                                </tr>
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
	<script src="js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="js/excanvas.min.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="js/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="js/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="js/jquery.uniform.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="js/select2.min.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="js/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="js/app.js"></script>
	<script src="js/table-managed.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableManaged.init();
		});
	</script>
	</body>
<!-- END BODY -->
</html>

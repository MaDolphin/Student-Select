<%--
  Created by IntelliJ IDEA.
  User: Brown
  Date: 2016/6/4
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<title>设备信息</title>
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
                    	设备信息：
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li><a href="#">设备信息</a></li>
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_ShowDevice">
                            <thead>
                            <tr>
                                <th style="width:8px;">
                                    <input type="checkbox" class="group-checkable" data-set="#table_ShowDevice .checkboxes"/>
                                </th>
                                <th class="hidden-480">设备编号</th>
                                <th class="hidden-480">设备名称</th>
                                <th class="hidden-480">设备型号</th>
                                <th class="hidden-480">设备规格</th>
                                <th class="hidden-480">设备类型</th>
                                <th class="hidden-480">生产厂家</th>
                                <th class="hidden-480">生产日期</th>
                                <th class="hidden-480">数量</th>
                                <th class="hidden-480">单位</th>
                                <th class="hidden-480">所属变电站</th>
                                <th class="hidden-480">首次投运日期</th>
                                <th class="hidden-480">再次投运日期</th>
                                <th class="hidden-480">报废日期</th>
                                <th class="hidden-480">设备状态</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${devicelist}" var="device">
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td class="hidden-480">${device.deviceNo}</td>
										<td class="hidden-480">${device.deviceName}</td>
										<td class="hidden-480">${device.deviceModel}</td>
										<td class="hidden-480">${device.deviceNorm}</td>
										<td class="hidden-480">${device.deviceType}</td>
										<td class="hidden-480">${device.deviceProducer}</td>
										<td class="hidden-480"><fmt:formatDate type="date" value="${device.produceDate}" dateStyle="default" /></td> 
										<td class="hidden-480">${device.amount}</td>
										<td class="hidden-480">${device.unit}</td>
										<td class="hidden-480">${device.substationNo}</td>
										<td class="hidden-480"><fmt:formatDate type="date" value="${device.firstRunDate}" dateStyle="default" /></td>
										<td class="hidden-480"><fmt:formatDate type="date" value="${device.secondRunDate}" dateStyle="default" /></td>
										<td class="hidden-480"><fmt:formatDate type="date" value="${device.invalidatedDate}" dateStyle="default" /></td>
                                    
		                                    <c:if test="${device.deviceStatus == 0}">
		    									<td ><span class="label label-info">新设备</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 1}">
											    <td ><span class="label label-warning">投运审核</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 2}">
											    <td ><span class="label label-success">投运</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 3}">
											    <td ><span class="label label-warning">退役审核</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 4}">
											    <td ><span class="label label-danger">退役</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 5}">
											    <td ><span class="label label-warning">重新投运审核</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 6}">
											    <td ><span class="label label-success">重新投运</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 7}">
											    <td ><span class="label label-warning">报废审核</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 8}">
											    <td ><span class="label label-default">报废</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 9}">
											    <td ><span class="label label-warning">投运审核不通过</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 10}">
											    <td ><span class="label label-warning">退役审核不通过</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 11}">
											    <td ><span class="label label-warning">重新投运审核不通过</span></td>
											</c:if>
											<c:if test="${device.deviceStatus == 12}">
											    <td ><span class="label label-warning">报废审核不通过</span></td>
											</c:if>
										
									
                                    	<td class="hidden-480">
                                    		<a href="findParameterDetails.action?deviceType=${device.deviceType}&deviceModel=${device.deviceModel}" class="btn mini green" target="rightFrame"><i class="label label-success"></i>技术参数详情</a>
                                    		<c:if test="${user == 'employee'}">
		                                        <c:if test="${device.deviceStatus == 0}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=1" class="btn mini green"><i class="icon-share"></i>申请投运</a>
												</c:if>
												<c:if test="${device.deviceStatus == 2}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=3" class="btn mini orange"><i class="icon-share"></i>申请退役</a>
												</c:if>
												<c:if test="${device.deviceStatus == 4}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=5" class="btn mini blue"><i class="icon-share"></i>申请重新投运</a>
												</c:if>
												<c:if test="${device.deviceStatus == 6}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=7" class="btn mini gray"><i class="icon-share"></i>申请报废</a>
												</c:if>
												<c:if test="${device.deviceStatus == 9}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=1" class="btn mini green"><i class="icon-share"></i>申请投运</a>
												</c:if>
												<c:if test="${device.deviceStatus == 10}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=3" class="btn mini orange"><i class="icon-share"></i>申请退役</a>
												</c:if>
												<c:if test="${device.deviceStatus == 11}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=5" class="btn mini blue"><i class="icon-share"></i>申请重新投运</a>
												</c:if>
												<c:if test="${device.deviceStatus == 12}">
												    <a href="editDeviceAction.action?deviceId=${device.deviceId}&optype=7" class="btn mini gray"><i class="icon-share"></i>申请报废</a>
												</c:if>
										 	</c:if>
										 	
										 	<c:if test="${user == 'manager'}">
												<c:if test="${device.deviceStatus == 1}">
												    <a href="javascript:if(confirm('确认通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=2'" class="btn mini green" target="rightFrame"><i class="icon-ok"></i>通过</a>
												    <a href="javascript:if(confirm('确认不通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=9'" class="btn mini red" target="rightFrame"><i class="icon-remove"></i>不通过</a>
												</c:if>
												<c:if test="${device.deviceStatus == 3}">
												    <a href="javascript:if(confirm('确认通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=4'" class="btn mini green" target="rightFrame"><i class="icon-ok"></i>通过</a>
												    <a href="javascript:if(confirm('确认不通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=10'" class="btn mini red" target="rightFrame"><i class="icon-remove"></i>不通过</a>
												</c:if>
												<c:if test="${device.deviceStatus == 5}">
												    <a href="javascript:if(confirm('确认通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=6'" class="btn mini green" target="rightFrame"><i class="icon-ok"></i>通过</a>
												    <a href="javascript:if(confirm('确认不通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=11'" class="btn mini red" target="rightFrame"><i class="icon-remove"></i>不通过</a>
												</c:if>
												<c:if test="${device.deviceStatus == 7}">
												    <a href="javascript:if(confirm('确认通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=8'" class="btn mini green" target="rightFrame"><i class="icon-ok"></i>通过</a>
												    <a href="javascript:if(confirm('确认不通过吗?'))window.location='managerEditDeviceAction.action?deviceId=${device.deviceId}&optype=12'" class="btn mini red" target="rightFrame"><i class="icon-remove"></i>不通过</a>
												</c:if>
												<c:if test="${device.deviceStatus == 0 or device.deviceStatus == 4 or device.deviceStatus == 8}">
												 	<a href="javascript:if(confirm('确定删除吗?'))window.location='deleteDeviceByType.action?deviceId=${device.deviceId}&deviceNorm=${device.deviceNorm}&deviceType=${device.deviceType}'" class="btn mini gray" target="rightFrame"><i class="icon-trash"></i> 删除</a>
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

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
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
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="css/chosen.css" />
<link rel="stylesheet" type="text/css" href="css/select2_metro.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css" />
<link rel="stylesheet" type="text/css" href="css/clockface.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="css/timepicker.css" />
<link rel="stylesheet" type="text/css" href="css/colorpicker.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-toggle-buttons.css" />
<link rel="stylesheet" type="text/css" href="css/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="css/datetimepicker.css" />
<link rel="stylesheet" type="text/css" href="css/multi-select-metro.css" />
<link href="css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<link rel="shortcut icon" href="images/favicon.ico" />
</head>
<!-- END HEAD -->

			<script type="text/javascript">
				function myfun(){
					var id = document.getElementById("abc").value;
					if(id==""){
						id="-请选择-";
					}
					document.getElementById("substationNo").value = id;
				};
			
				function getDeviceModel() {
					var sub = document.getElementById("substationNo").value;
					if(sub != ""){
						var url = "changeAddUnitInterval.action?substationNo=" + sub;
						open(url,'rightFrame');
					}
				};
			</script>

<!-- BEGIN BODY -->
<body style="background-color: white" onload="myfun()">
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<h3 class="page-title">单元间隔添加：</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="">主页</a> <span
								class="icon-angle-right"></span></li>
							<li><a href="#">单元间隔添加</a></li>
						</ul>
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<c:if test="${substationNo != null}">
					<input type="hidden" id="abc" value="${substationNo}" />
				</c:if>
				<c:if test="${substationNo == null}">
					<input type="hidden" id="abc" value="" />
				</c:if>
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">
						<div class="portlet-body form" style="margin-top: 40px;">
							<div class="tabbable portlet-tabs">
								<div class="tab-content">
									<div class="tab-pane active" id="portlet_tab1"
										style="margin-left: -50px">
										<!-- BEGIN FORM-->
										<form action="addUnitIntervalMethod.action"
											target="rightFrame" method="post" class="form-horizontal">
											<div class="row-fluid">
												<div class="span6 ">
													<div class="control-group ">
														<label class="control-label">所属变电站</label>
														<div class="controls">
															<select style="width: 320px;height: 34px"
																name="substationNo" id="substationNo"
																class="select_field" onchange="getDeviceModel();">
																<option value="-请选择-" style="color:#999999">-请选择-</option>
																<c:forEach items="${substationList}"
																	var="substationlist">
																	<option value="${substationlist.substationNo}">${substationlist.substationNo}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="row-fluid">
												<div class="span6 ">
													<div class="control-group ">
														<label class="control-label">单元编号</label>
														<div class="controls">
															<input type="text" name="unitNo" id="unitNo" placeholder=""
																class="m-wrap large" style="width: 320px;height: 34px"
																required />
															<strong id="div_show" style="font-size:14px;color:red;align:center;line-height:34px;height:34px;"></strong>
														</div>
													
													</div>
												</div>
											</div>
											<div class="row-fluid">
												<div class="control-group">
													<label class="control-label">设备编号</label>
													<div class="controls">
														<select multiple="multiple" id="my_multi_select2"
															name="deviceNo_select">
															<c:forEach items="${deviceTypeList}" var="type">
																<optgroup label="${type.deviceType}">
																	<c:forEach items="${unitDeviceNoList}" var="unit">
																		<c:if test="${unit.deviceType == type.deviceType}">
																			<option value="${unit.deviceNo }">${unit.deviceNo
																				}</option>
																		</c:if>
																	</c:forEach>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="form-actions">
												<button type="submit" class="btn blue" id="submit">
													<i class="icon-ok"></i>提交
												</button>
												<button type="reset" class="btn">重置</button>
											</div>
										</form>
										<!-- END FORM-->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<!-- END FOOTER -->
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
	<script type="text/javascript" src="js/ckeditor.js"></script>
	<script type="text/javascript" src="js/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="js/select2.min.js"></script>
	<script type="text/javascript" src="js/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript" src="js/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript" src="js/jquery.tagsinput.min.js"></script>
	<script type="text/javascript" src="js/jquery.toggle.buttons.js"></script>
	<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="js/clockface.js"></script>
	<script type="text/javascript" src="js/date.js"></script>
	<script type="text/javascript" src="js/daterangepicker.js"></script>
	<script type="text/javascript" src="js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript" src="js/bootstrap-timepicker.js"></script>
	<script type="text/javascript" src="js/jquery.inputmask.bundle.min.js"></script>
	<script type="text/javascript"
		src="js/jquery.input-ip-address-control-1.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.multi-select.js"></script>
	<script src="js/bootstrap-modal.js" type="text/javascript"></script>
	<script src="js/bootstrap-modalmanager.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="js/app.js"></script>
	<script src="js/form-components.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
	    jQuery(document).ready(function() {
	        // initiate layout and plugins
	        App.init();
	        FormComponents.init();
	    });
	    
	</script>
	<script type="text/javascript">
		$("#unitNo").blur(function () {
	        $.ajax({
	            type: "post",
	            url: "checkUnitIntervalNoAvailable.action",
	            data: {unitNo: $("#unitNo").val()},
	            dataType: "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	            success: function (data) {
	                json = eval("(" + data + ")");
	                if (json.result == "true") {
	                    $("#div_show").text("该单元间隔号已存在");
	                    $("#unitNo").css({
	                        "outline": "none",
	                        "border-color": "#E86455",
	                        "-webkit-box-shadow": "inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #E86455",
	                        "-moz-box-shadow": "inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #E86455",
	                        "box-shadow": "inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #E86455"
	                    });
	                    $("#submit").attr("disabled", true); 
	                }
	            }
	        });
    	});
	    $("#unitNo").focus(function (){
	        $("#div_show").text(" ");
	        $("#unitNo").css({
	            "outline": "none",
	            "color": "#525864",
	            "border-color": "#84c0ee",
	            "-webkit-box-shadow": "inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec",
	            "-moz-box-shadow": "inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec",
	            "box-shadow": "inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec"
	        });
	        $("#submit").attr("disabled", false); 
	    });
	</script>
	

	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script>
</body>
<!-- END BODY -->
</html>

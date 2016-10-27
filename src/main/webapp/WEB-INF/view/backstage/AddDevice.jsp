<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="shortcut icon" href="images/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="background-color: white">
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
                    	 设备添加：
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li>
                            <a href="#">设备添加</a>
                        </li> 
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <div class="portlet-body form" style="margin-top: 40px;">
                        <div class="tabbable portlet-tabs">
                            <div class="tab-content">
                                <div class="tab-pane active" id="portlet_tab1" style="margin-left: -50px">
                                    <!-- BEGIN FORM-->
                                    <form action="addDeviceMethod.action" target="rightFrame" method="post" class="form-horizontal" >
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">设备编号</label>
                                                    <div class="controls">
                                                        <input type="text" name="device.deviceNo" id="deviceNo" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                        <strong id="div_show" style="font-size:14px;color:red;align:center;line-height:34px;height:34px;"></strong>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">设备名称</label>
                                                    <div class="controls">
                                                        <input type="text" name="device.deviceName" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">设备类型</label>
                                                    <div class="controls">
                                                        <select style="width: 320px;height: 34px" name="device.deviceType"  id="deviceType"  class="select_field" onchange="getDeviceModel(this)">  
									                        <option value=""  style="color:#999999">-请选择-</option>  
									                        <c:forEach items="${deviceTypeList}" var="deviceTypelist" >
									                        	<option value="${deviceTypelist.deviceType}">${deviceTypelist.deviceType}</option>  
									                        </c:forEach>
									                        <option value="" disabled>————————————————</option>
									                        <option value="addParameter.action">新增设备参数</option> 
									                    </select>
									                    <font color="red">*</font>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">设备型号</label>
                                                    <div class="controls">
                                                        <select  id="deviceModel" style="width: 320px;height: 34px" class="select_field" name="device.deviceModel" >  
							                            	<option value="" style="color:#999999">-请选择-</option>
							                        	</select>
							                        	<font color="red">*</font>  
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">设备规格</label>
                                                    <div class="controls">
                                                        <select name="device.deviceNorm" id="device.deviceNorm" style="width: 320px;height: 34px">
                                                            <option value="大类" selected>大类</option>
                                                            <option value="中类" >中类</option>
                                                            <option value="小类" >小类</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">生产厂家</label>
                                                    <div class="controls">
                                                        <input type="text" name="device.deviceProducer" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">生产日期</label>
                                                    <div class="controls" >
                                                        <input class="span3 m-wrap m-ctrl-medium " size="16" type="date" value="" id="device.produceDate" name="device.produceDate" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">数量</label>
                                                    <div class="controls">
                                                        <input type="number" name="device.amount" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">单位</label>
                                                    <div class="controls">
                                                        <input type="text" name="device.unit" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">所属变电站</label>
                                                    <div class="controls">
                                                        <select style="width: 320px;height: 34px" name="device.substationNo"  id="substationNo"  class="select_field">  
									                        <option value=""  style="color:#999999">-请选择-</option>  
									                        <c:forEach items="${substationList}" var="substationlist" >
									                        	<option value="${substationlist.substationNo}">${substationlist.substationNo}</option>  
									                        </c:forEach>  
									                    </select>
									                    <font color="red">*</font>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <button type="submit" class="btn blue" id="submit"><i class="icon-ok"></i>提交</button>
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
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
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
<script src="js/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<script src="media/js/app.js"></script>
<script>
    jQuery(document).ready(function() {
        // initiate layout and plugins
        App.init();
    });
</script>

<script type="text/javascript">
	function getDeviceModel(obj) {
		$("#deviceModel").empty();//清空  
		var deviceType = document.getElementById("deviceType").value;
		if(deviceType != "addParameter.action"){
			var url = "findDeviceModel.action?deviceType=" + deviceType;
			$.ajax({
				type : "POST",
				url : url,
				data : {},
				dataType : "JSON",
				success : function(data) {
					$.each(data,function(i,list){
						var _tr = $("<option value='"+list.deviceModel+"'>" + list.deviceModel + "</option>");  
	                    $("#deviceModel").append(_tr);  
	                })
				}
			})
		}
		else{
			var docurl =obj.options[obj.selectedIndex].value;
			open(docurl,'rightFrame');
			obj.selectedIndex=0;
			obj.blur();
		}
	}
	

    $("#deviceNo").blur(function () {
        $.ajax({
            type: "post",
            url: "checkDeviceNoAvailable.action",
            data: {deviceNo: $("#deviceNo").val()},
            dataType: "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
            success: function (data) {
                json = eval("(" + data + ")");
                if (json.result == "true") {
                    $("#div_show").text("该设备编号已存在");
                    $("#deviceNo").css({
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
    $("#deviceNo").focus(function (){
        $("#div_show").text(" ");
        $("#deviceNo").css({
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
<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>
<!-- END BODY -->
</html>

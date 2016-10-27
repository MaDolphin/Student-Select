<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="../css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="../css/uniform.default.css" rel="stylesheet" type="text/css"/>
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
                    	  变电站添加：
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li>
                            <a href="#">变电站添加</a>
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
                                    <form action="addSubstation.action" target="rightFrame" method="post" class="form-horizontal" >
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">变电站编号</label>
                                                    <div class="controls">
                                                        <input type="text" name="substation.substationNo" id="substationNo" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                        <strong id="div_show" style="font-size:14px;color:red;align:center;line-height:34px;height:34px;"></strong>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">变电站名称</label>
                                                    <div class="controls">
                                                        <input type="text" name="substation.substationName" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">电压等级</label>
                                                    <div class="controls">
                                                        <select style="width: 320px;height: 34px" name="substation.voltageGrade"  id="voltageGrade"  class="select_field">  
									                        <option value=""  style="color:#999999">-请选择-</option>  
									                        
									                        <option value="35KV">35KV</option> 
									                        <option value="110KV">110KV</option> 
									                        <option value="220KV">220KV</option> 
									                        <option value="500KV">500KV</option> 
									                        <option value="800KV">800KV</option> 
									                        <option value="1000KV">1000KV</option> 
									                    </select>
									                    <font color="red">*</font>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">主变数量</label>
                                                    <div class="controls">
                                                        <input type="number" name="substation.voltageNumber" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">变电站地址</label>
                                                    <div class="controls">
                                                        <input type="text" name="substation.substationAddress" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
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
<script src="../js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="../js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/excanvas.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<script src="../js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="../js/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<script src="../media/js/app.js"></script>
<script>
    jQuery(document).ready(function() {
        // initiate layout and plugins
        window.parent.frames["wholeFrame"].location.reload(); 
        App.init();
    });
</script>

<script type="text/javascript">	

    $("#substationNo").blur(function () {
        $.ajax({
            type: "post",
            url: "checkSubstationNoAvailable.action",
            data: {substationNo: $("#substationNo").val()},
            dataType: "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
            success: function (data) {
                json = eval("(" + data + ")");
                if (json.result == "true") {
                    $("#div_show").text("该变电站编号已存在");
                    $("#substationNo").css({
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
    $("#substationNo").focus(function (){
        $("#div_show").text(" ");
        $("#substationNo").css({
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

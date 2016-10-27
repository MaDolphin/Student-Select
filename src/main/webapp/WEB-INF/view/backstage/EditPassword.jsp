<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/css/backstage/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style.css" rel="stylesheet" type="text/css"/>
    <link href="../style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="/css/backstage/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="shortcut icon" href="images/favicon.ico" />
</head>
<!-- END HEAD -->
<script>
    function editPassword() {
        var pwd = document.getElementById("pwd").value;
        var oldPassword = hex_md5(editForm.oldPassword.value);
        var newPassword = editForm.newPassword.value;
        var checkPassword = editForm.checkPassword.value;
        if(oldPassword != pwd){
            alert("初始密码不正确，请重新输入！")
        }else if(newPassword != checkPassword){
            alert("新密码与确认密码不一致，请重新输入！")
        }else{
            editForm.submit();
        }
    }

</script>
<!-- BEGIN BODY -->
<body style="background-color: white">
<input type="hidden" value="${student.studentPwd}" id="pwd" name="pwd">
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
                    	  密码修改：
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="/index/backMain">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li>
                            <a href="#">修改用户密码</a>
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
                                    <form action="/student/editPassword?student=${student}" name="editForm" id="editForm" target="rightFrame" method="post" class="form-horizontal" >
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">原始密码</label>
                                                    <div class="controls">
                                                        <input type="password" name="oldPassword" id="oldPassword" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                        <strong id="div_show" style="font-size:14px;color:red;align:center;line-height:34px;height:34px;"></strong>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">新密码</label>
                                                    <div class="controls">
                                                        <input type="password" name="newPassworde" id="newPassworde" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6 ">
                                                <div class="control-group " >
                                                    <label class="control-label">确认密码</label>
                                                    <div class="controls">
                                                        <input type="password" name="checkPassworde" id="checkPassword" placeholder="" class="m-wrap large" style="width: 320px;height: 34px" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div
                                        <div class="row-fluid">
                                        </div>

                                        <div class="form-actions">
                                            <button type="button" class="btn blue" id="submit" onclick="editPassword()"><i class="icon-ok"></i>提交</button>
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
<script src="/js/backstage/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="/js/backstage/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="/js/backstage/bootstrap.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/excanvas.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<script src="/js/backstage/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.cookie.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.uniform.min.js" type="text/javascript" ></script>
<script src="/js/backstage/MD5.js" type="text/javascript" ></script>
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

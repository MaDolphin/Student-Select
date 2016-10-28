<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/css/backstage/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style.css" rel="stylesheet" type="text/css"/>
    <link href="style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="/css/backstage/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="shortcut icon" href="/images/backstage/favicon.ico"/>
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
                        填报志愿：
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li>
                            <a href="#">填报志愿</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <%--<div class="row-fluid">--%>
            <div class="span12">
                <div class="portlet-body form" style="margin-top: 40px;">
                    <div class="tabbable portlet-tabs">
                        <div class="tab-content">
                            <div class="tab-pane active" id="portlet_tab1" style="margin-left: -50px">
                                <!-- BEGIN FORM-->
                                <form action="/student/voluntaryReport?flag=${flag}" target="rightFrame" method="post"
                                      class="form-horizontal">
                                    <input type="hidden" value="${student.studentId}" name="studentId" id="studentId">
                                    <input type="hidden" value="${student.majorId}" name="majorId" id="majorId">

                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group ">
                                                <label class="control-label">第一志愿</label>
                                                <div class="controls">
                                                    <select style="width: 320px;height: 34px" name="first_intention"
                                                            id="first_intention" class="select_field">
                                                        <c:if test="${flag == 1}">
                                                        <c:forEach items="${intentionList}" var="intentionList">
                                                            <c:forEach items="${intentionList.teacher}" var="teacherList">
                                                            <c:if test="${teacherList.teacherId == intentionList.firstIntention}">
                                                            <option value="${teacherList.teacherId}" style="color:#999999" selected>${teacherList.teacherName}</option>
                                                            </c:if>
                                                            </c:forEach>
                                                        </c:forEach>
                                                            </c:if>
                                                        <option value="" style="color:#999999">-请选择第一志愿-</option>
                                                        <c:forEach items="${teacherList}" var="teacherList">
                                                            <option value="${teacherList.teacherId}">${teacherList.teacherName}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group ">
                                                <label class="control-label">第二志愿</label>
                                                <div class="controls">
                                                    <select style="width: 320px;height: 34px" name="second_intention"
                                                            id="second_intention" class="select_field">
                                                        <c:if test="${flag == 1}">
                                                            <c:forEach items="${intentionList}" var="intentionList">
                                                                <c:forEach items="${intentionList.teacher}" var="teacherList">
                                                                    <c:if test="${teacherList.teacherId == intentionList.secondIntention}">
                                                                        <option value="${teacherList.teacherId}" style="color:#999999" selected>${teacherList.teacherName}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </c:if>
                                                        <option value="" style="color:#999999">-请选择第二志愿-</option>
                                                        <c:forEach items="${teacherList}" var="teacherList">
                                                            <option value="${teacherList.teacherId}">${teacherList.teacherName}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group ">
                                                <label class="control-label">第三志愿</label>
                                                <div class="controls">
                                                    <select style="width: 320px;height: 34px" name="third_intention"
                                                            id="third_intention" class="select_field">
                                                        <c:if test="${flag == 1}">
                                                            <c:forEach items="${intentionList}" var="intentionList">
                                                                <c:forEach items="${intentionList.teacher}" var="teacherList">
                                                                    <c:if test="${teacherList.teacherId == intentionList.thirdIntention}">
                                                                        <option value="${teacherList.teacherId}" style="color:#999999" selected>${teacherList.teacherName}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </c:if>
                                                        <option value="" style="color:#999999">-请选择第三志愿-</option>
                                                        <c:forEach items="${teacherList}" var="teacherList">
                                                            <option value="${teacherList.teacherId}">${teacherList.teacherName}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="submit" class="btn blue" id="submit"><i class="icon-ok"></i>提交
                                        </button>
                                        <%--<button type="reset" class="btn">重置</button>--%>
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
<script src="/js/backstage/excanvas.min.js"></script>
<script src="/js/backstage/respond.min.js"></script>
<![endif]-->
<script src="/js/backstage/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.cookie.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.uniform.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.uniform.min.js" type="text/javascript"></script>
<script src="/js/backstage/jQuery.FillOptions.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script src="media/js/backstage/app.js"></script>
<%--<script>--%>
<%--jQuery(document).ready(function() {--%>
<%--// initiate layout and plugins--%>
<%--App.init();--%>
<%--});--%>
<%--</script>--%>
<script type="text/javascript">

    $(document).ready(function () {
        // 填充志愿选择
        <%--$("#first_intention").FillOptions(--%>
        <%--"/student/fillTeacher?majorId=${student.majorId}",--%>
        <%--{--%>
        <%--datatype: "json",--%>
        <%--textfield: "teacher",--%>
        <%--valuefiled: "teacher",--%>
        <%--selectedindex: 0,//填充并选中第1项--%>
        <%--keepold: true//填充并且保留原有项--%>
        <%--}--%>
        <%--);--%>

        <%--$("#first_intention").AddOption("< - - 请选择第一志愿 - - >", "-1", true, 0);//最上端插入一个文本为“请选择部门“，值为”-1“的列表项，并且是选中状态--%>
    });
</script>
<script type="text/javascript">
    function getDeviceModel(obj) {
        $("#deviceModel").empty();//清空
        var deviceType = document.getElementById("deviceType").value;
        if (deviceType != "addParameter.action") {
            var url = "findDeviceModel.action?deviceType=" + deviceType;
            $.ajax({
                type: "POST",
                url: url,
                data: {},
                dataType: "JSON",
                success: function (data) {
                    $.each(data, function (i, list) {
                        var _tr = $("<option value='" + list.deviceModel + "'>" + list.deviceModel + "</option>");
                        $("#deviceModel").append(_tr);
                    })
                }
            })
        }
        else {
            var docurl = obj.options[obj.selectedIndex].value;
            open(docurl, 'rightFrame');
            obj.selectedIndex = 0;
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
    $("#deviceNo").focus(function () {
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
<script type="text/javascript">  var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-37564768-1']);
_gaq.push(['_setDomainName', 'keenthemes.com']);
_gaq.push(['_setAllowLinker', true]);
_gaq.push(['_trackPageview']);
(function () {
    var ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ga, s);
})();</script>
</body>
<!-- END BODY -->
</html>

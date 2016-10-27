<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>批量导入信息</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/css/backstage/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="/css/backstage/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="/css/backstage/bootstrap-fileupload.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/chosen.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/select2_metro.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/jquery.tagsinput.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/clockface.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/timepicker.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/bootstrap-toggle-buttons.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/daterangepicker.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="/css/backstage/multi-select-metro.css" />
    <link href="/css/backstage/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="/images/backstage/favicon.ico" />
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
                        批量导入
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="">主页</a>
                            <span class="icon-angle-right"></span>
                        </li>
                        <li>
                            <a href="#">批量导入</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN SAMPLE FORM PORTLET-->
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <form action="/admin/batchImportMethod" class="form-horizontal" method="post" enctype="multipart/form-data" name="form1" id="form1" onsubmit="return LimitAttach();">
                            <div class="control-group">
                                <label class="control-label">学生：</label>
                                <div class="controls">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="input-append">
                                            <div class="uneditable-input">
                                                <i class="icon-file fileupload-exists"></i>
                                                <span class="fileupload-preview"></span>
                                            </div>
                                            <span class="btn btn-file">
													<span class="fileupload-new">上传</span>
													<span class="fileupload-exists">修改</span>
													<input type="file" style="height:20px" id="upload1" name="upload1"/>
													</span>
                                            <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">教师：</label>
                                <div class="controls">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="input-append">
                                            <div class="uneditable-input">
                                                <i class="icon-file fileupload-exists"></i>
                                                <span class="fileupload-preview"></span>
                                            </div>
                                            <span class="btn btn-file">
													<span class="fileupload-new">上传</span>
													<span class="fileupload-exists">修改</span>
													<input type="file" style="height:20px" id="upload2" name="upload2"/>
													</span>
                                            <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">专业：</label>
                                <div class="controls">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="input-append">
                                            <div class="uneditable-input">
                                                <i class="icon-file fileupload-exists"></i>
                                                <span class="fileupload-preview"></span>
                                            </div>
                                            <span class="btn btn-file">
													<span class="fileupload-new">上传</span>
													<span class="fileupload-exists">修改</span>
													<input type="file" style="height:20px" id="upload3" name="upload3" />
													</span>
                                            <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="submit" class="btn blue">提交</button>
                                <button type="button" class="btn">取消</button>
                            </div>
                        </form>
                        <!-- END FORM-->
                    </div>
                    <!-- END SAMPLE FORM PORTLET-->
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
<script src="/js/backstage/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/js/backstage/ckeditor.js"></script>
<script type="text/javascript" src="/js/backstage/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="/js/backstage/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/js/backstage/select2.min.js"></script>
<script type="text/javascript" src="/js/backstage/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="/js/backstage/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="/js/backstage/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="/js/backstage/jquery.toggle.buttons.js"></script>
<script type="text/javascript" src="/js/backstage/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/js/backstage/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/js/backstage/clockface.js"></script>
<script type="text/javascript" src="/js/backstage/date.js"></script>
<script type="text/javascript" src="/js/backstage/daterangepicker.js"></script>
<script type="text/javascript" src="/js/backstage/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="/js/backstage/bootstrap-timepicker.js"></script>
<script type="text/javascript" src="/js/backstage/jquery.inputmask.bundle.min.js"></script>
<script type="text/javascript" src="/js/backstage/jquery.input-ip-address-control-1.0.min.js"></script>
<script type="text/javascript" src="/js/backstage/jquery.multi-select.js"></script>
<script src="/js/backstage/bootstrap-modal.js" type="text/javascript" ></script>
<script src="/js/backstage/bootstrap-modalmanager.js" type="text/javascript" ></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/js/backstage/app.js"></script>
<script src="/js/backstage/form-components.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        // initiate layout and plugins
        App.init();
        FormComponents.init();
    });

    /**
 * @return {boolean}
 */
function LimitAttach() {

        var file1=document.getElementById("upload1").value;
        var file2=document.getElementById("upload2").value;
        var file3=document.getElementById("upload3").value;

        var flag1 = false;
        var flag2 = false;
        var flag3 = false;

        if(file1 != ""){
            var ext = file1.slice(file1.lastIndexOf(".")+1).toLowerCase();
            if ("xls" == ext || "xlsx" == ext) {
                flag1 = true;
            }else {
                alert("只能上传Excel文件");
                return false;
            }
        }else {
            flag1 = true;
        }

        if(file2 != ""){
            var ext = file2.slice(file2.lastIndexOf(".")+1).toLowerCase();
            if ("xls" == ext || "xlsx" == ext) {
                flag2 = true;
            }else {
                alert("只能上传Excel文件");
                return false;
            }
        }else {
            flag2 = true;
        }

        if(file3 != ""){
            var ext = file3.slice(file3.lastIndexOf(".")+1).toLowerCase();
            if ("xls" == ext || "xlsx" == ext) {
                flag3 = true;
            }else {
                alert("只能上传Excel文件");
                return false;
            }
        }else {
            flag3 = true;
        }

        if(file1 !="" || file2 !="" || file3 !=""){
            if(flag1 == true && flag2 == true && flag3 == true){
                return true;
            }
        }else {
            return false;
        }
    }
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

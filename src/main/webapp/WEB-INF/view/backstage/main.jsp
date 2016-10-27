<%--
  Created by IntelliJ IDEA.
  User: Brown
  Date: 2016/6/3
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <link href="/css/backstage/jquery.gritter.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/daterangepicker.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/fullcalendar.css" rel="stylesheet" type="text/css"/>
    <link href="/css/backstage/jqvmap.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="/css/backstage/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="/images/backstage/favicon.ico"/>
    <%--<meta content="width=device-width, initial-scale=1.0" name="viewport"/>--%>
    <%--<meta content="" name="description"/>--%>
    <%--<meta content="" name="author"/>--%>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

</head>

<frameset rows="42,*" name="wholeFrame" id="wholeFrame" title="wholeFrame" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="/index/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame"/>
    <frameset cols="225,*" frameborder="no" border="0" framespacing="0">
        <frame src="/index/left" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame"/>
        <frame src="/index/right" name="rightFrame" id="rightFrame" title="rightFrame"/>
    </frameset>
</frameset>

<%--<noframes><body>--%>
<%--</body></noframes>--%>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
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
<script src="/js/backstage/jquery.vmap.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.world.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.flot.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.flot.resize.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="/js/backstage/date.js" type="text/javascript"></script>
<script src="/js/backstage/daterangepicker.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.gritter.js" type="text/javascript"></script>
<script src="/js/backstage/fullcalendar.min.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.easy-pie-chart.js" type="text/javascript"></script>
<script src="/js/backstage/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/js/backstage/app.js" type="text/javascript"></script>
<script src="/js/backstage/index.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
        Index.init();
        Index.initJQVMAP(); // init index page's custom scripts
        Index.initCalendar(); // init index page's custom scripts
        Index.initCharts(); // init index page's custom scripts
        Index.initChat();
        Index.initMiniCharts();
        Index.initDashboardDaterange();
    });
</script>
</html>

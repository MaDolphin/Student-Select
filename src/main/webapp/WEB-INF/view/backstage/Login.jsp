<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta charset="utf-8" />
  <title>Klass | 登录</title>
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
  <link href="/css/backstage/login.css" rel="stylesheet" type="text/css"/>
  <!-- END PAGE LEVEL STYLES -->
  <link rel="shortcut icon" href="/images/backstage/favicon.ico" />
</head>
<!-- END HEAD -->
<script>
  function checkIdentity() {
    var name = login.userName.value;
    var password = login.password.value;
    var identity = login.identity.value;

      if(name.length == 0){
        alert("请输入用户名！");
      }else if(password.length == 0){
        alert("请输入密码！");
      }else if(identity.length == 0){
        alert("请选择登陆身份！");
      }else{
        login.submit();
      }
  }
</script>
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
  <img src="/images/backstage/logo-big.png" alt="" />
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
  <!-- BEGIN LOGIN FORM -->
  <form class="form-vertical login-form" action="/index/main" method="post" name="login">
    <h3 class="form-title" style="font-family: 微软雅黑;text-align: center">登录</h3>
    <div class="control-group">
      <div class="controls">
        <div class="input-icon left">
          <i class="icon-user"></i>
          <input class="m-wrap placeholder-no-fix" style="height: 30px;width: 280px" type="text" placeholder="用户名" name="userName" id="userName"/>
        </div>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">Password</label>
      <div class="controls">
        <div class="input-icon left">
          <i class="icon-lock"></i>
          <input class="m-wrap placeholder-no-fix" style="height: 30px;width: 280px" type="password" placeholder="密码" name="password" id="password"/>
        </div>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">Identity</label>
      <div class="controls">
        <div class="input-icon left">
          <select class="m-wrap placeholder-no-fix" name="identity" id="identity" style="height: 30px;width: 280px">
            <option value="">----选择登陆身份----</option>
            <option value="student">学生</option>
            <option value="teacher">导师</option>
            <option value="manager2">学科负责人</option>
            <option value="manager1">研究生处管理员</option>
            </select>
        </div>
      </div>
    </div>
    <div class="form-actions">
      <label class="checkbox" style="font-family: 微软雅黑;margin-left: 20px">
        <input type="checkbox" name="remember" value="1"/> 记住我
      </label>
      <button type="button" class="btn green pull-right" style="font-family: 微软雅黑" onclick="checkIdentity()">
        登录 <i class="m-icon-swapright m-icon-white"></i>
      </button>
    </div>
  </form>
  <!-- END LOGIN FORM -->
</div>
<!-- END LOGIN -->
</body>
<!-- END BODY -->
</html>

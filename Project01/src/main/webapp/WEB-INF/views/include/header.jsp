<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sec:authentication var="user" property="principal"/>
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/>
<sec:authorize access="hasRole('ROLE_TEACHER')" var="isTeacher"/>
<sec:authorize access="hasRole('ROLE_STUDENT')" var="isStudent"/>

<sec:authorize access="hasRole('ROLE_CLASS_TEACHER')" var="isClassTeacher"/>
<sec:authorize access="hasRole('ROLE_CLASS_PRESIDENT')" var="isClassPresident"/>
<sec:authorize access="hasRole('ROLE_CLASS_STUDENT')" var="isClassStudent"/>
<c:set var="grade">
	<c:if test="${isAdmin}">
      	학원
    </c:if>
    <c:if test="${isTeacher}">
    	선생님
    </c:if>
    <c:if test="${isStudent}">
    	학생
    </c:if>
</c:set>

<c:set var="classGrade">
	<c:if test="${isAdmin}">
      	학원
    </c:if>
    <c:if test="${isClassTeacher}">
    	선생님
    </c:if>
    <c:if test="${isClassPresident}">
    	반장
    </c:if>
    <c:if test="${isClassStudent}">
    	학생
    </c:if>
</c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이해했니</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- 폰트 -->
<link rel="stylesheet" type="text/css" href="/resources/nojo/fonts/BMDOHYEON.css">
<link rel="stylesheet" type="text/css" href="/resources/nojo/fonts/BMHANNA.css">
<link rel="stylesheet" type="text/css" href="/resources/nojo/fonts/BMJUA.css">
<link rel="stylesheet" type="text/css" href="/resources/nojo/fonts/jejuGothic.css">
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>

<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
<!-- favicon -->
<link href="/favicon.ico" rel="icon" type="image/x-icon" />


<style>
html, body, .wrapper, .wrapper .content-wrapper, .content-wrapper *{
	height: 100%;
} 
</style>


  </head>
  <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
  <body class="skin-blue sidebar-collapse">
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header" style="box-shadow: 0px 3px 16px 0px rgba(50, 50, 50, 0.87);">

        <!-- Logo -->
        <a href="/" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>이해했니</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg" style="font-family: BMDOHYEON;"><b>이해했니</b></span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              

              <!-- Notifications Menu -->
              <li class="dropdown notifications-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- Inner Menu: contains the notifications -->
                    <ul class="menu">
                      <li><!-- start notification -->
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li><!-- end notification -->
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>

              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <img src="/membership/profileImg" class="user-image" alt="User Image" onerror="imgError(this);"/>
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs" style="font-weight: bold; font-size: small; font-family: BMDOHYEON; color:#18709C">${user.name} ${grade}</span>
                </a>
                <ul class="dropdown-menu"  style="border: 1px solid #FFB89B;">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <img src="/membership/profileImg" class="img-circle" alt="User Image" onerror="imgError(this);"/>
                    <p style="color: #FF8878; font-family: BMJUA; font-size: x-large; text-shadow: 1px 1px 2px rgba(150, 150, 150, 0.80);">
                      ${user.name} ${grade}
                    </p>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="/membership/profile" target="inner" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="/member/logout" class="btn btn-default btn-flat">로그아웃</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>

<script>
      function imgError(image) {
		image.onerror = "";
		image.src = "/resources/nojo/images/noImage.png";
		return true;
	}
</script>
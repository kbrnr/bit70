<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <h4>카페설정(Setting)</h4>
              <!-- Status -->
              
            </div>
          </div>

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header"></li>
            <!-- Optionally, you can add icons to the links -->
            <li class="treeview active"><a href="/${domain}/${userid}/t/main" target="inner"><i class="fa fa-link"></i> <span>홈</span></a></li>
            <li class="treeview"><a href="/academy/classlist" target="inner"><i class="fa fa-link"></i> <span>수업정보(X)</span></a></li>
            <li class="treeview"><a href="/${domain}/curriculum/edit" target="inner"><i class="fa fa-link"></i> <span>커리큘럼</span></a></li>
          	<li class="treeview"><a href="/${domain}/qna/listpage" target="inner"><i class="fa fa-link"></i> <span>질문답변</span></a></li>
            <li class="treeview"><a href="/academy/teacherlist" target="inner"><i class="fa fa-link"></i> <span>이해도통계</span></a></li>
            <li class="treeview"><a href="/member/joinmemberlist/${domain}" target="inner"><i class="fa fa-link"></i> <span>우리반식구</span></a></li>
            <li class="treeview"><a href="/${domain}/seat" target="inner"><i class="fa fa-link"></i> <span>[반장메뉴:배치도]</a></li>
           </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

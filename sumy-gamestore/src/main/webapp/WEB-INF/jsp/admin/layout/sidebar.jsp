<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!-- Header -->
    <header id="js-header" class="u-header u-header--sticky-top">
      <div class="u-header__section u-header__section--admin-dark g-min-height-65">
        <nav class="navbar no-gutters g-pa-0">
          <div class="col-auto d-flex flex-nowrap u-header-logo-toggler g-py-12">
            <!-- Logo -->
            <a href="/admin/game/list"
              class="navbar-brand d-flex align-self-center g-hidden-xs-down g-line-height-1 py-0 g-mt-5">

              <img src="/resources/static/user/assets/img/logo/logo-w.png" alt="logo.png" height="60px">



            </a>
            <!-- End Logo -->

            <!-- Sidebar Toggler -->
            <a class="js-side-nav u-header__nav-toggler d-flex align-self-center ml-auto" href="#"
              data-hssm-class="u-side-nav--mini u-sidebar-navigation-v1--mini" data-hssm-body-class="u-side-nav-mini"
              data-hssm-is-close-all-except-this="true" data-hssm-target="#sideNav">
              <i class="hs-admin-align-left"></i>
            </a>
            <!-- End Sidebar Toggler -->
          </div>
		  
		  
		  
          <!-- Messages/Notifications/Top Search Bar/Top User -->
          <div class="col-auto d-flex g-py-6 g-pl-40--lg ml-auto">
			<a class="col-auto g-color-white g-font-size-16 g-py-6 g-color-primary--hover" href="/">메인화면</a>
            <!-- Top User -->
            <div class="col-auto d-flex g-pt-5 g-pt-0--sm g-pl-10 g-pl-20--sm">
              <div class="g-pos-rel g-px-10--lg">
                <a id="profileMenuInvoker" class="d-block" href="#" aria-controls="profileMenu" aria-haspopup="true"
                  aria-expanded="false" data-dropdown-event="click" data-dropdown-target="#profileMenu"
                  data-dropdown-type="css-animation" data-dropdown-duration="300" data-dropdown-animation-in="fadeIn"
                  data-dropdown-animation-out="fadeOut">
                  <span class="g-pos-rel">
                    <span class="u-badge-v2--xs u-badge--top-right g-hidden-sm-up g-bg-secondary g-mr-5"></span>
                    <img class="g-width-30 g-width-40--md g-height-30 g-height-40--md rounded-circle g-mr-10--sm"
                      src="${principal.user.userProfileImage }" alt="Image description">
                  </span>
                  <span class="g-pos-rel g-top-2">
                    <span class="g-hidden-sm-down g-color-primary--hover">${principal.user.userNickname }</span>
                    <i class="hs-admin-angle-down g-pos-rel g-top-2 g-ml-10"></i>
                  </span>
                </a>

                <!-- Top User Menu -->
                <ul id="profileMenu"
                  class="g-pos-abs g-left-0 g-width-100x--lg g-nowrap g-font-size-14 g-py-20 g-mt-17 rounded"
                  aria-labelledby="profileMenuInvoker">
                  <li class="mb-0">
                    <a class="media g-color-primary--hover g-py-5 g-px-20" href="/logout">
                      <span class="d-flex align-self-center g-mr-12">
                        <i class="hs-admin-shift-right"></i>
                      </span>
                      <span class="media-body align-self-center">Sign Out</span>
                    </a>
                  </li>
                </ul>
                <!-- End Top User Menu -->
              </div>
            </div>
            <!-- End Top User -->
          </div>
          <!-- End Messages/Notifications/Top Search Bar/Top User -->

      </div>
    </header>
    <!-- End Header -->

    <main class="container-fluid px-0 g-pt-65">
      <div class="row no-gutters g-pos-rel g-overflow-x-hidden">
        <!-- Sidebar Nav -->
        <div id="sideNav" class="col-auto u-sidebar-navigation-v1 u-sidebar-navigation--dark">
          <ul id="sideNavMenu" class="u-sidebar-navigation-v1-menu u-side-nav--top-level-menu g-min-height-100vh mb-0">
            <!-- Dashboards -->
            <li id="gameSidebar"
              class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item u-side-nav-opened">
              <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="${pageContext.request.contextPath }/admin/game/list"
                >
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                  <i class="hs-admin-game"></i>
                </span>
                <span class="media-body align-self-center">게임 관리</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                  <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
              </a>

              <!-- Dashboards: Submenu-1 -->
              
              <!-- End Dashboards: Submenu-1 -->
            </li>
            <!-- End Dashboards -->

            <!-- 고객 관리 시작 -->
            <li id="userSidebar"
              class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
              <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="${pageContext.request.contextPath }/admin/user/list"
                >
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                  <i class="hs-admin-face-smile"></i>
                </span>
                <span class="media-body align-self-center">고객 관리</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                  <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
              </a>

            </li>
            <!-- 고객 관리 끝 -->

            <!-- 문의 관리 시작 -->
            <li id="questionSidebar"
            class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
              <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="${pageContext.request.contextPath }/admin/question/list"
                >
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                  <i class="icon-communication-005 u-line-icon-pro"></i>
                </span>
                <span class="media-body align-self-center">문의 관리</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                  <i class="hs-admin-angle-right"></i>
                </span>

                <span class="u-side-nav--has-sub-menu__indicator"></span>
              </a>

            </li>
            <!-- 문의 관리 끝-->

            <!-- 신고 관리 시작 -->
            <li id="warningSidebar"
            class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
              <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="${pageContext.request.contextPath }/admin/report/list"
                >
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                  <i class="hs-admin-alert"></i>
                </span>
                <span class="media-body align-self-center">신고 관리</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                  <i class="hs-admin-angle-right"></i>
                </span>

                <span class="u-side-nav--has-sub-menu__indicator"></span>
              </a>
            </li>
            <!-- 신고 관리 끝-->

            <!-- 뉴스 관리 시작 -->
            <li id="newsSidebar"
            class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
              <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="${pageContext.request.contextPath }/admin/news/list"
                >
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                  <i class="icon-communication-020 u-line-icon-pro"></i>
                </span>
                <span class="media-body align-self-center">뉴스 관리</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                  <i class="hs-admin-angle-right"></i>
                </span>

                <span class="u-side-nav--has-sub-menu__indicator"></span>
              </a>

            </li>
            <!-- 뉴스 관리 끝 -->


        </div>
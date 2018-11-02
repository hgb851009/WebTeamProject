<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../WEB-INF/modules/location.jsp"%>
<c:if test="${empty sessionScope.userID}">
	<c:redirect url = "../login/login.jsp" />
</c:if>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="../assets/css/plugins/plugins.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/scroller.css" rel="stylesheet">
    <link href="../assets/plugins/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/cubeportfolio/css/cubeportfolio.min.css">
    <link href="../assets/css/style.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<%@include file="../WEB-INF/modules/navbar/commNav.jsp"%>
<!--page title-->
<div class="cta-bg-slider bg-primary auto-init height-is-based-on-content" data-options='{   direction: "reverse"}'>
    <div class="container pt100 pb100">
        <div class="row">
            <div class="col-md-8 ml-auto mr-auto wow bounceIn" data-wow-delay=".2s">
                <h3 class="h3 mb30 text-center font300 text-white">Gallery</h3>
            </div>
        </div>
    </div>
</div>
<!--/.page-title-->
<div class="container pt100 pb100">
    <div class="">
        <div class="">
            <div class="clearfix">
                <div id="js-filters-lightbox-gallery" class="cbp-l-filters-button cbp-l-filters-left">
                    <div data-filter="*" class="cbp-filter-item-active cbp-filter-item">All</div>
                    <div data-filter=".graphic" class="cbp-filter-item">Graphic</div>
                    <div data-filter=".logos" class="cbp-filter-item">Logo</div>
                    <div data-filter=".motion" class="cbp-filter-item">Motion</div>
                </div>
            </div>
            <div id="js-grid-lightbox-gallery" class="cbp">
                <div class="cbp-item web-design graphic print motion">
                    <a href="../images/box/img-1.jpg" class="cbp-caption cbp-lightbox" data-title="개발이 하고싶어요<br>by 이재경" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-1.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">개발이 하고싶어요</div>
                                    <div class="cbp-l-caption-desc">by 이재경</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item web-design logos identity graphic">
                    <a href="../images/box/img-2.jpg" class="cbp-caption cbp-lightbox" data-title="Bolt UI<br>by Tiberiu Neamu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-2.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Bolt UI</div>
                                    <div class="cbp-l-caption-desc">by Tiberiu Neamu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item graphic print identity">
                    <a href="../images/box/img-3.jpg" class="cbp-caption cbp-lightbox" data-title="WhereTO App<br>by Tiberiu Neamu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-3.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">WhereTO App</div>
                                    <div class="cbp-l-caption-desc">by Tiberiu Neamu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item web-design motion logos">
                    <a href="../images/box/img-4.jpg" class="cbp-caption cbp-lightbox" data-title="iDevices<br>by Tiberiu Neamu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-4.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">iDevices</div>
                                    <div class="cbp-l-caption-desc">by Tiberiu Neamu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item identity graphic print">
                    <a href="../images/box/img-5.jpg" class="cbp-caption cbp-lightbox" data-title="Seemple* Music<br>by Tiberiu Neamu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-5.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Seemple* Music</div>
                                    <div class="cbp-l-caption-desc">by Tiberiu Neamu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item motion print logos web-design">
                    <a href="../images/box/img-6.jpg" class="cbp-caption cbp-lightbox" data-title="Remind~Me Widget<br>by Tiberiu Neamu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-6.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Remind~Me Widget</div>
                                    <div class="cbp-l-caption-desc">by Tiberiu Neamu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item graphic logos">
                    <a href="../images/box/img-7.jpg" class="cbp-caption cbp-lightbox" data-title="Workout Buddy<br>by Tiberiu Neamu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-7.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Workout Buddy</div>
                                    <div class="cbp-l-caption-desc">by Tiberiu Neamu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item identity print logos motion">
                    <a href="../images/box/img-8.jpg" class="cbp-caption cbp-lightbox" data-title="Digital Menu<br>by Cosmin Capitanu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-8.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Digital Menu</div>
                                    <div class="cbp-l-caption-desc">by Cosmin Capitanu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item identity motion web-design">
                    <a href="../images/box/img-9.jpg" class="cbp-caption cbp-lightbox" data-title="Holiday Selector<br>by Cosmin Capitanu" rel="nofollow">
                        <div class="cbp-caption-defaultWrap">
                            <img src="../images/box/img-9.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignLeft">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Holiday Selector</div>
                                    <div class="cbp-l-caption-desc">by Cosmin Capitanu</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<%--footer--%>
<%@include file="../footer.jsp"%>
<%--footer--%>




<%--오류메시지--%>
<%@include file="../WEB-INF/modules/logError.jsp"%>

<!--/.footer-->
<script src="../assets/js/bundle/bundle.js" type="text/javascript"></script>
<script src="../assets/js/versa.custom.js"></script>
<!--dz parallaxer-->
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/dzsparallaxer.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/scroller.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/advancedscroller/plugin.js"></script>
<!--page script-->
<!-- load cubeportfolio -->
<script type="text/javascript" src="../assets/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
<script>
    //projects
    (function ($, window, document, undefined) {
        'use strict';

        // init cubeportfolio
        $('#js-grid-lightbox-gallery').cubeportfolio({
            filters: '#js-filters-lightbox-gallery',
            layoutMode: 'grid',
            mediaQueries: [{
                width: 1500,
                cols: 3
            }, {
                width: 1100,
                cols: 3
            }, {
                width: 800,
                cols: 2
            }, {
                width: 480,
                cols: 2,
                options: {
                    caption: ''
                }
            }],
            defaultFilter: '*',
            animationType: 'flipOutDelay',
            gapHorizontal: 15,
            gapVertical: 15,
            gridAdjustment: 'responsive',
            caption: 'zoom',
            displayType: 'fadeIn',
            displayTypeSpeed: 100,
            // lightbox
            lightboxDelegate: '.cbp-lightbox',
            lightboxGallery: true,
            lightboxTitleSrc: 'data-title',
            lightboxCounter: '<div class="cbp-popup-lightbox-counter">{{current}} of {{total}}</div>'
        });
    })(jQuery, window, document);
</script>
</body>
</html>
<#import "/spring.ftl" as spring />
<#macro page title activeTab>

<!DOCTYPE html>
<html ng-app="motozio" lang="en">
<head >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">

    <!-- Le styles -->
    <link href="<@spring.url '/css/bootstrap.css'/>" rel="stylesheet">

    <link href="<@spring.url '/css/styles.css'/>" rel="stylesheet">

    <#--<link href="css/bootstrap-responsive.css'>" rel="stylesheet">-->

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <![endif]-->

    <title>${title?html}</title>


</head>
<body>


<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="<@spring.url '/'/>">Motiozio</a>
            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right">
                    Logged in as <a href="<@spring.url '/'/>" class="navbar-link">Username</a>
                </p>
                <ul class="nav">
                    <li <@c.nav active=activeTab page="Home"></@c.nav>><a href="<@spring.url '/'/>">Home</a></li>
                    <li <@c.nav active=activeTab page="Cars"></@c.nav>><a href="<@spring.url '/cars'/>">Cars</a></li>
                    <li <@c.nav active=activeTab page="About"></@c.nav>><a href="#about">About</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container">
    <#nested />

</div><!--/.fluid-container-->
<footer class="footer" ng-controller="FooterCtrl">
    <div class="container">
        <p class="text-muted">Application version <strong class="text-info">{{footer.projectVersion}}</strong> on <strong class="text-info">{{footer.hostName}}</strong> at {{footer.curDate}}.</p>

    </div>
</footer>

<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="<@spring.url '/js/jquery-1.9.1.min.js'/>"></script>
<script src="<@spring.url '/js/underscore.js'/>"></script>
<script src="<@spring.url '/js/angular.min.js'/>"></script>
<script src="<@spring.url '/js/bootstrap.min.js'/>"></script>
<script src="<@spring.url '/js/angular-strap.min.js'/>"></script>
<script src="<@spring.url '/js/directives.js'/>"></script>
<script src="<@spring.url '/js/controllers.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jsapi.js' />"></script>
<script type="text/javascript">

    (function(motozio, undefined){
        motozio.baseUrl = "<@spring.url '/' />";
    }(window.motozio = window.motozio || {}));

</script>

</body>
</html>
</#macro>

<#macro nav active page>
    <#if active==page>
         class="active"
    </#if>

</#macro>
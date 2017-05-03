<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<base href="${path}"/>
<title>${title}</title>
<meta property="og:url"  content="${baseUrl}" />
<meta property="og:type" content="website" />
<meta property="og:title"  content="${app_title}" />
<meta property="og:description"  content="${app_description}" />
<meta property="og:image" content="${baseUrl}/images/image.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/metamorphosis.css" rel="stylesheet" type="text/css" media="all" />
<link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="templates/amadeus/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="templates/amadeus/css/easy-responsive-tabs.css" />
<link href="${css}/module.css" rel="stylesheet" />
 <link rel="shortcut icon" href="images/logo.png"  sizes="32x32"/>  
</head>
<body class="bg agileinfo">
 <!-- scroll to top  -->   
   <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
   <header>
   <div class="app_title"><img src="${logo}"/><a href="${baseUrl}">${app_name}</a></div>
   <div class="search">
      <i class="fa fa-search"></i>
      <input type="text" placeholder="Search..."/>
   </div>
   </header>
   <div class="aside">
	    <a title="News" class="title"><i class="fa fa-newspaper-o"></i>News</a>
	    <a title="Blog" class="title"><i class="fa fa-rss"></i>Blog</a>
	    <a title="FAQ" class="title"><i class="fa fa-question-circle"></i>FAQ</a>
	    <div class="socials">
	     <a title="facebook"><i class="fa fa-facebook"></i></a>
	     <a title="twitter"><i class="fa fa-twitter"></i></a>
	     <a title="youtube"><i class="fa fa-youtube"></i></a>
	    </div>
    </div>
    <div class="aside right">
        <a title="Support" href="http://support.thinktech.sn/login" target="_blank" class="title"><i class="fa fa-ticket"></i>Support</a>
	    <a title="Community" class="title"><i class="fa fa-handshake-o"></i>Community</a>
	    <a title="Contact us" class="title"><i class="fa fa-at"></i>Contact us</a>
    </div>
   <tiles:insertAttribute name="content"/>
   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="templates/amadeus/js/easyResponsiveTabs.js"></script>
   <script src="js/metamorphosis.js"></script>
   <footer>
   <div class="footer-item">
     <h1>Getting Started</h1>
     <ul>
       <li>Understanding ${app_name}</li>
       <li>How ${app_name} works</li>
       <li>How to use ${app_name}</li>
       <li>Customers</li>
       <li>Partners</li>
     </ul>
   </div>
   <div class="footer-item">
     <h1>Quick Links</h1>
     <ul>
       <li>Pricing</li>
       <li>Documentation</li>
       <li>Blog</li>
       <li>Support</li>
       <li>Community</li>
       <li>News</li>
       <li>FAQ</li>
     </ul>
   </div>
   <div class="footer-item">
     <h1>Subscribe to the newsletter</h1>
     <div class="newsletter">
       <input type="text" placeholder="Your email address" title="Your email address"/>
       <input type="submit" value="Subscribe" title="Subscribe"/>
     </div>
   </div>
   <div class="socials">
	     <a title="facebook"><i class="fa fa-facebook"></i></a>
	     <a title="twitter"><i class="fa fa-twitter"></i></a>
	     <a title="youtube"><i class="fa fa-youtube"></i></a>
	    </div>
   <div class="agileits_w3layouts_copyright text-center">
			<p>&copy; 2017 Designed by <a href="//w3layouts.com/" target="_blank">W3layouts</a> and <a href="https://www.thinktech.sn/" target="_blank">ThinkTech</a></p>
	</div>
	</footer>
   <script src="templates/amadeus/js/template.js" async defer></script>
  <script src="${js}/module.js" async defer></script>
</body>
</html>


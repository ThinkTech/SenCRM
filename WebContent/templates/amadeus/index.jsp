<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
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
<link href="templates/amadeus/css/template.css" rel="stylesheet" type="text/css" media="all" />
<link href="${css}/module.css" rel="stylesheet" />
 <link rel="shortcut icon" href="images/logo.png"  sizes="32x32"/>  
</head>
<body class="bg agileinfo">
 <!-- scroll to top  -->   
   <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
   <header>
   <div class="app_title"><img src="${logo}"/><a href="${baseUrl}">${app_name}</a></div>
   <div class="search">
      <form action="search">
      <i class="fa fa-search"></i>
      <input name="query" type="text" data-translation="search"/>
      </form>
   </div>
   <div class="language">
	<select id="select">
	     <option id="english" value="en" data-translation="english"></option>
	    <option id="french" value="fr" data-translation="french"></option>
	</select>
	</div>
   </header>
   <div class="aside">
	    <a  href="https://sencrm.wordpress.com/news/" target="_blank" class="title"><i class="fa fa-newspaper-o"></i><span data-translation="news">&nbsp;</span></a>
	    <a  href="https://sencrm.wordpress.com/" target="_blank" class="title"><i class="fa fa-rss"></i><span data-translation="blog">&nbsp;</span></a>
	    <a href="documentation/faq"  class="title"><i class="fa fa-question-circle"></i><span data-translation="faq">&nbsp;</span></a>
	    <div class="socials">
	     <a><i class="fa fa-facebook"></i></a>
	     <a><i class="fa fa-twitter"></i></a>
	     <a><i class="fa fa-youtube"></i></a>
	     <a><i class="fa fa-linkedin"></i></a>
	    </div>
    </div>
    <div class="aside right">
        <a href="https://sencrm.mircloud.host/login" target="_blank" class="title"><i class="fa fa-ticket"></i><span data-translation="support">&nbsp;</span></a>
	    <a  href="https://sencrm.wordpress.com/community/" target="_blank"  class="title"><i class="fa fa-handshake-o"></i><span data-translation="community">&nbsp;</span></a>
	    <a id="contact"  class="title"><i class="fa fa-envelope"></i><span data-translation="contact">&nbsp;</span></a>
    </div>
   <tiles:insertAttribute name="content"/>
   <div id="contact-form">
     <img title="close" class="close" src="templates/amadeus/images/close.png"/>
     <h1><i class="fa fa-envelope"></i><span data-translation="contact">&nbsp;</span></h1>
     <form  action="contact" method="post">
		  <input id="name" name="mail.author"  type="text" data-translation="name">
		  <span class="info fa fa-info"  data-info="enter-name">&nbsp;</span>
	   	  <span class="voice fa fa-microphone">&nbsp;</span>	  
		  <input id="email" name="mail.address" type="email" data-translation="email">
		  <span class="info fa fa-info"  data-info="enter-email">&nbsp;</span>
	   	  <span class="voice fa fa-microphone">&nbsp;</span>
		  <input id="subject" name="mail.subject" type="text" data-translation="subject">
		  <span class="info fa fa-info"  data-info="enter-subject">&nbsp;</span>
	   	  <span class="voice fa fa-microphone">&nbsp;</span>
		  <textarea id="message" name="mail.content"  data-translation="message"></textarea>
		  <span class="info fa fa-info"  data-info="enter-message">&nbsp;</span>
	   	  <span class="voice fa fa-microphone">&nbsp;</span>
  	      <input id="submit" type="submit" data-translation="send-now">
	</form>
   </div>
   <footer>
   <div class="footer-item">
     <h1 data-translation="getting-started"></h1>
     <ul>
       <li><a href="understanding"><span data-translation="understanding">&nbsp;</span> ${app_name}</a></li>
       <li><a href="overview"><span data-translation="how_it_works">&nbsp;</span></a></li>
       <li><a href="usage"><span data-translation="how_to_use_it">&nbsp;</span></a></li>
       <li><a href="customers"><span data-translation="customers">&nbsp;</span></a></li>
       <li><a href="partners"><span data-translation="partners">&nbsp;</span></a></li>
       <li><a href="registration/terms"><span data-translation="terms">&nbsp;</span></a></li>
       <li><a href="registration/privacy"><span data-translation="privacy">&nbsp;</span></a></li>
     </ul>
   </div>
   <div class="footer-item">
     <h1 data-translation="quick-links"></h1>
     <ul>
       <li><a href="pricing"><span data-translation="pricing">&nbsp;</span></a></li>
       <li><a href="documentation"><span data-translation="documentation">&nbsp;</span></a></li>
       <li><a href="https://sencrm.wordpress.com/" target="_blank"><span data-translation="blog">&nbsp;</span></a></li>
       <li><a href="https://sencrm.mircloud.host/login" target="_blank"><span data-translation="support">&nbsp;</span></a></li>
       <li><a href="https://sencrm.wordpress.com/community/" target="_blank"><span data-translation="community">&nbsp;</span></a></li>
       <li><a href="https://sencrm.wordpress.com/news/" target="_blank"><span data-translation="news">&nbsp;</span></a></li>
       <li><a href="documentation/faq"><span data-translation="faq">&nbsp;</span></a></li>
     </ul>
   </div>
   <div class="footer-item">
     <h1 data-translation="subscribe-newsletter"></h1>
     <div class="newsletter">
      <form action="subscribe">
       <input type="text" data-translation="email"/>
       <span class="info"  data-info="enter-email">&nbsp;</span>
       <input type="submit" value="" data-translation="subscribe"/>
       </form>
     </div>
     <h1 data-translation="tell-your-friends"></h1>
     <div class="share-this">
      <div class="sharethis-inline-share-buttons"></div>
     </div>
   </div>
   <div class="socials">
	     <a><i class="fa fa-facebook"></i></a>
	     <a><i class="fa fa-twitter"></i></a>
	     <a><i class="fa fa-youtube"></i></a>
	     <a><i class="fa fa-linkedin"></i></a>
   </div>
   <div class="agileits_w3layouts_copyright text-center">
			<p data-translation="designed-by"></p>
	</div>
	</footer>
    <script src="js/jquery-3.1.1.min.js"></script>
   <script src="js/metamorphosis.js"></script>
   <script src="templates/amadeus/js/template.js" async defer></script>
  <script src="${js}/module.js" async defer></script>
  <script type="text/javascript" src="//platform-api.sharethis.com/js/sharethis.js#property=590f03b42c145800128d5487&product=inline-share-buttons" async defer></script>
  <script>
      app.ready(function(){
    	  page.translate("i18n/app","${request.locale.language}");
          page.translate("modules/${module.folder.name}/i18n/module",function(){
        	  $("body").animate({opacity : 1},10);
          });
         
      });
  </script>
</body>
</html>


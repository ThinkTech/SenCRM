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
<title>ThinkTech Portal</title>
<meta property="og:url"  content="http://portal.thinktech.sn/" />
<meta property="og:type" content="website" />
<meta property="og:title"  content="Welcome to ThinkTech Portal" />
<meta property="og:description"  content="Portal for interacting with us and to follow the evolution of your projects." />
<meta property="og:image" content="http://portal.thinktech.sn/images/image.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/metamorphosis.css" rel="stylesheet" type="text/css" media="all" />
<link href="templates/amadeus/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="templates/amadeus/css/easy-responsive-tabs.css" />
 <link href="//fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
 <link rel="shortcut icon" href="images/logo.png"  sizes="32x32"/>  
</head>
<body class="bg agileinfo">
   <h1 class="app_title"><img src="${logo}"/><span>SenCRM</span></h1>
   <h1 class="agile_head text-center">thinktech.sn</h1>
   <div class="w3layouts_main wrap">
    <!--Horizontal Tab-->
        <div id="parentHorizontalTab_agile">
            <div class="resp-tabs-container hor_1">
               <div class="w3_agile_login">
                    <form action="${login}" class="agile_form" method="post">
                      <span id="error-message"></span>
					  <p>Email</p>
					  <input type="email" name="user.email" required="required" />
					  <p>Password</p>
					  <input type="password" name="user.password" required="required" class="password" /> 
					  <input type="submit" value="LogIn" class="agileinfo" />
					</form>
					 <div class="login_w3ls">
				        <a href="#">Forgot Password</a>
					 </div>    
                </div>
            </div>
        </div>
		 <!-- //Horizontal Tab -->
    </div>
	<div class="agileits_w3layouts_copyright text-center">
			<p>&copy; 2017 Designed by <a href="//w3layouts.com/" target="_blank">W3layouts</a> and <a href="//thinktech.sn/" target="_blank">ThinkTech</a></p>
	</div>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="templates/amadeus/js/easyResponsiveTabs.js"></script>
<script src="js/metamorphosis.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//Horizontal Tab
	$('#parentHorizontalTab_agile').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion
		width: 'auto', //auto or any width like 600px
		fit: true, // 100% fit in a container
		tabidentify: 'hor_1' // The tab groups identifier
	});
	$('input[type=email]').focus();
	$(".agile_form").submit(function(event){
		app.authenticate($(this));
		return false;
	});
});
</script>
</body>
</html>


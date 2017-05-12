<div class="buttons">
    <a  href="documentation"  class="button"><i class="fa fa-book"></i><span data-translation="documentation"></span></a>
    <a   href="public/pricing"  class="button"><i class="fa fa-money"></i><span data-translation="pricing"></span></a>
    <a   href="registration"  class="button"><i class="fa fa-user"></i><span data-translation="signUp"></span></a>
    <a   href="${referer}"  class="button"><i class="fa fa-arrow-left"></i><span data-translation="back"></span></a>
</div>
<div class="content">
<h1 class="header"><i class="fa fa-user"></i><span data-translation="identification"></span></h1>
   <div class="w3layouts_main wrap">
    <!--Horizontal Tab-->
        <div id="parentHorizontalTab_agile">
            <div class="resp-tabs-container hor_1">
               <div class="w3_agile_login">
                    <form action="${login}" class="agile_form" method="post">
                      <span id="error-message"></span>
					  <p><i class="fa fa-envelope"></i><span data-translation="email"></span></p>
					  <input id="email" type="email" name="user.email" required="required" />
					  <p><i class="fa fa-key"></i><span data-translation="password"></span></p>
					  <input type="password" name="user.password" required="required" class="password" /> 
					  <input type="submit" value="" data-translation="signIn" class="agileinfo" />
					</form>
					 <div class="login_w3ls">
				        <a href="password/reset"><i class="fa fa-key"></i><span data-translation="forgot-password"></span></a> <span>|</span> <a href="registration"><i class="fa fa-user"></i><span data-translation="create-account"></span></a>
					 </div>    
                </div>
            </div>
        </div>
		 <!-- //Horizontal Tab -->
    </div>
</div>
<link href="templates/amadeus/css/responsive.css" rel="stylesheet" type="text/css" media="all" />
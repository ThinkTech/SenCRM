<div class="buttons">
     <a title="Documentation" href="documentation"  class="button"><i class="fa fa-book"></i>Documentation</a>
    <a title="Pricing"  target="_blank"  class="button"><i class="fa fa-money"></i>Pricing</a>
    <a title="Registration" href="registration"  class="button"><i class="fa fa-user"></i>Sign up</a>
    <a title="Back" href="${referer}"  class="button"><i class="fa fa-arrow-left"></i>Back</a>
</div>
<h1 class="header"><i class="fa fa-user"></i>Identification</h1>
   <div class="w3layouts_main wrap">
    <!--Horizontal Tab-->
        <div id="parentHorizontalTab_agile">
            <div class="resp-tabs-container hor_1">
               <div class="w3_agile_login">
                    <form action="${login}" class="agile_form" method="post">
                      <span id="error-message"></span>
					  <p><i class="fa fa-envelope"></i>Email</p>
					  <input id="email" type="email" name="user.email" required="required" />
					  <p><i class="fa fa-key"></i>Password</p>
					  <input type="password" name="user.password" required="required" class="password" /> 
					  <input type="submit" value="Sign in" class="agileinfo" />
					</form>
					 <div class="login_w3ls">
				        <a href="password/reset"><i class="fa fa-key"></i>Forgot Password</a> <span>|</span> <a href="registration"><i class="fa fa-user"></i>Create Account</a>
					 </div>    
                </div>
            </div>
        </div>
		 <!-- //Horizontal Tab -->
    </div>
<link href="templates/amadeus/css/responsive.css" rel="stylesheet" type="text/css" media="all" />
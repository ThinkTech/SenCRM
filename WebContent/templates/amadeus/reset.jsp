<div class="buttons">
    <a  href="documentation"  class="button"><i class="fa fa-book"></i><span data-element="documentation"></span></a>
    <a  href="public/pricing"  class="button"><i class="fa fa-money"></i><span data-element="pricing"></span></a>
    <a  href="registration"  class="button"><i class="fa fa-user"></i><span data-element="signUp"></span></a>
    <a  href="${referer}"  class="button"><i class="fa fa-arrow-left"></i><span data-element="back"></span></a>
</div>
<div class="content">
<h1 class="header"><i class="fa fa-user"></i>Reset Password</h1>
   <div class="w3layouts_main wrap">
    <!--Horizontal Tab-->
        <div id="parentHorizontalTab_agile">
            <div class="resp-tabs-container hor_1">
               <div class="w3_agile_login">
                    <form action="registration/password/reset"  method="post">
                      <span id="error-message"></span>
					  <p><i class="fa fa-envelope"></i>Email</p>
					  <input id="email" type="email" name="user.email" required="required" />
					  <input type="submit" value="Reset" class="agileinfo" />
					</form>  
                </div>
            </div>
        </div>
		 <!-- //Horizontal Tab -->
</div>
</div>
<link href="templates/amadeus/css/responsive.css" rel="stylesheet" type="text/css" media="all" />
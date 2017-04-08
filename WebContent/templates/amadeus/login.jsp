<h1 class="agile_head text-center"><i class="fa fa-user"></i>Identification</h1>
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
				        <a href="#">Forgot Password</a> <span>|</span> <a href="registration">Create Account</a>
					 </div>    
                </div>
            </div>
        </div>
		 <!-- //Horizontal Tab -->
    </div>
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
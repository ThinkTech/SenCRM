<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8"/>
   <base href="${path}"/>
   <title>${title}</title>
   <meta property="og:url"  content="${baseUrl}" />
   <meta property="og:type" content="website" />
   <meta property="og:title"  content="${app_title}" />
   <meta property="og:description"  content="${app_description}" />
   <meta property="og:image" content="${baseUrl}/images/image.jpg" />
   <meta name="viewport" content="width=device-width,initial-scale=1"/>
   <link href="${logo}" rel="icon" type="image/x-icon" />
   <link href="css/metamorphosis.css" rel="stylesheet"/>
   <link href="templates/nova/css/template.css" rel="stylesheet" />
  <link href="${css}/module.css" rel="stylesheet" />
</head>
<body>
<!-- scroll to top  -->   
  <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
	<div>
		<header>
		   <div class="logo">
		     <img src="${logo}"/>
		     <h2>${app_name}</h2>
		   </div>
		   <div class="topmenu">
		         <s:iterator value="modules">
		             <a href="${url}" title="${name}"><img src="${icon}"/><span>${name}</span></a> 
		         </s:iterator>
		   </div>
		   <div class="user-actions" style="display:${security==true?'inline-block':'none'}">
				<a  class="account-16" href="users" title="Account">Account</a>
				<a  href="users/logout" title="Log Out" class="signout">Log Out</a>
			</div>
		</header>
		   <aside>
		   	    <s:iterator value="#request.module.getMenus('main')" var="menu">
		   	      <h1 class="icon-16">${menu.label}</h1>
		   	   		<ul>
		   	         <s:iterator value="#menu.menuItems">
						<li class="icon-16 ${icon}"><a href="${url}" title="${label}">${label}</a></li>
					</s:iterator>
					 </ul>
			   </s:iterator>
		   </aside>
		   <main> 
		      <button title="Menu" type="button" class="aside-toggle" onclick="toggle();">
	             <span class="icon-bar"></span>
	             <span class="icon-bar"></span>
	             <span class="icon-bar"></span>
	          </button>
		      <tiles:insertAttribute name="content"/>
		      <footer>
			    <p>&copy; 2017 Designed by <a href="http://www.thinktech.sn" target="_blank">ThinkTech</a></p>
		     </footer>
		   </main>
	</div>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/metamorphosis.js"></script>
<script type="text/javascript" src="templates/nova/js/template.js"></script>
<script type="text/javascript" src="${js}/module.js"></script>
<script src="https://use.fontawesome.com/cb87d958ba.js"></script>
</body>
</html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<div class="buttons">
 <a href="${referer}" title="Back" class="back-16">Back</a>
</div>
<h1 class="preferences-32">Preferences</h1>
<fieldset class="preferences">
	<legend>Templates</legend>
	<div id="extensions">
	   <s:iterator value="templateManager.backendTemplates">
	      <div class="extension">
	      <img class="selected" src="${images}/selected-32.png" style="display:${template==name?'inline-block':'none'}"/>
		  <a>
		  <img src="${thumbnail}"/>
		  </a>
		  <div class="info">
		  <span class="extension-name">${name}</span>
		  <span>${author}</span>
		  <span style="display:${template==name?'none':'inline-block'}"><a title="select" href="${selectTemplate}?id=${id}">[Select]</a></span>
		  </div>
		  <div class="extensionDetails">
		      	  <span>Name : ${name}</span>
				  <span>Author : ${author}</span>
				  <span>Author Email : ${authorEmail}</span>
				  <span>Author Url : ${authorUrl}</span>
				  <span>Creation Date : ${creationDate}</span>
				  <span>Copyright : ${copyright}</span>
				  <span>License : ${license}</span>
				  <span>Version : ${version}</span>
		 </div>
		</div>
	   </s:iterator>
	</div>
</fieldset>
</div>
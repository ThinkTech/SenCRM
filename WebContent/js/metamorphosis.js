var app = {};
app.ready = function(callback) { 
	$(document).ready(callback); 
};

app.get = function(url, callback) {
	 var store =  typeof arguments[2] == 'boolean' ? arguments[2] : false;
	 page.wait();
	 if(store) {
		 var data = localStorage.getItem(url); 
		 if(data) {
			 page.release();
			 if(callback) callback(JSON.parse(data));
		     return false;
		 }
	 }
	 $.ajax({
		 type : 'GET', 
		 url : url, 
		 dataType : 'json'
	 }).done(function(data){
		 page.release();
	     if(callback) callback(data);
	     try {
	    	 if(store) localStorage.setItem(url,JSON.stringify(data));
	     }catch(e) {
	    	  if(e.code == 22) {
	    		 localStorage.clear();
	    	  }
	     }
	 }).fail(function(data){
	  	 page.release();
	  	 var error = arguments[2] instanceof Function ? arguments[2] : arguments[3];
	  	 if(error) error(data);
	 });
};

app.post = function(url, formData, callback, error) {
	  page.wait();
	  $.ajax({
          type : 'POST',
          url : url,
          data : formData,
          dataType : 'json'
	  }).done(function(data){
		  page.release();
		  if(callback) callback(data);
	  }).fail(function(data){
		  page.release();
		  if(error) error(data);
	  });
};

app.put = function(url, formData, callback, error) {
	  page.wait();
	  $.ajax({
		  type : 'PUT',
          url : url,
          data : formData,
          dataType : 'json'
      }).done(function(data){
    	  page.release();
	      if(callback) callback(data);
      }).fail(function(data){
    	  page.release();
    	  if(error) error(data);
      });
};

app.delete = function(url, callback, error) {
	  page.wait();
	  $.ajax({
		  type : 'DELETE',
		  url : url,
		  dataType : 'json'
	  }).done(function(data){
		  page.release();
		  if(callback) callback(data);
	  }).fail(function(data){
		  page.release();
		  if(error) error(data);
	  });
};

app.authenticate = function(form) {
	var url = form.attr("action");
	var data = form.serialize();
	app.post(url,data, function(response) {
		window.location.href = response.url;
	}, function(error) {
		alert("email or password incorrect", function() {
			$("input[type=email]").focus();
		});
	});
};

app.engines = {};

app.engine = function(type, engine) {
	app.engines[type] = engine;
};

app.engine("text/x-handlebars-template",function(info) {
  head.load("js/handlebars-v4.0.5.js",function(){
    var html = $.parseHTML(Handlebars.compile(info.source)(info.data));
    info.append ? info.destination.append(html) : info.destination.html(html);
    if(info.callback) info.callback($(html));
  });
});

app.engine("text/x-dust-template",function(info) {
  head.load("js/dust-full.min.js",function() {
    dust.renderSource(info.source,info.data,function(err, out) {
      var html = $.parseHTML(out);
      info.append ? info.destination.append(html) : info.destination.html(html);
      if(info.callback) info.callback($(html));
    });
  });
});

var page = {};

page.render = function(element, data) {
  this.cache = this.cache ? this.cache : new Map();
  var template;
  if(this.cache.has(element[0])) {
	  template =  this.cache.get(element[0]);
  }else {
	  this.cache.set(element[0],template = $("template", element));
  }
  var engine = app.engines[template.attr("type")];
  engine({
    source: template.html(),
    data: data,
    append: arguments[2] instanceof Function ? false : arguments[2],
    destination: arguments[3] && !(arguments[3] instanceof Function) ? arguments[3] : element,
    callback: arguments[2] instanceof Function ? arguments[2] : arguments[3] instanceof Function ? arguments[3] : arguments[4]
  });
};

page.wait = function() { 
	$("#wait").show();
};

page.release = function() { 
	$("#wait").hide();
};

var doc = function(entity) {
	var names = Object.getOwnPropertyNames(entity);
	return {content: entity[names[1]] + " " + entity[names[2]]};
};

page.pdf = function(url, callback){
	head.load("js/pdfmake.min.js", "js/vfs_fonts.js", function() { 
		app.get(url, function(data) {
			pdfMake.createPdf(callback ? callback(data) : doc(data)).open()
		});
	 });
};

page.print = function(url, callback){
	head.load("js/pdfmake.min.js", "js/vfs_fonts.js", function() { 
		app.get(url, function(data) {
			pdfMake.createPdf(callback ? callback(data) : doc(data)).print()
		});
	 });
};

page.highlight = function() {
	var array = window.location.pathname.split( '/' );
	var path = "";
	for( var i = 0;i<array.length;i++) {
		path += array[i];
		if(array[i]) $('a[href$='+array[i]+"]").addClass('active');
	}
	if(path=="") $('a[href$='+array[1]+"]").addClass('active');
	if($("aside a.active").length>1) $("aside a.active:first").removeClass("active");
};

page.init = function() {
	$("body").append('<div id="wait"><div id="loader"/></div>');
	$("body").append('<div id="alert-dialog-container">'+
			'<div><span>Information</span><span></span>'+
			'<a tabindex="3" id="alert-dialog-ok">OK</a></div></div>');
	$("#alert-dialog-container").on('keydown', function(event) {     
       switch (event.keyCode) {
            case 27:
            	$(this).hide();
                break;
            case 13:
            	$(document.activeElement).click();
                break;
       }
       return false;
	}); 
	$("body").append('<div id="confirm-dialog-container">'+
			'<div><span>Confirmation</span>'+
			'<span class="confirmation-dialog-title"></span>'+
			'<a id="confirm-dialog-cancel" tabindex="2">Cancel</a>'+
			'<a id="confirm-dialog-ok" tabindex="1">OK</a></div></div>');
	
	$("#confirm-dialog-cancel").click(function() { 
		$("#confirm-dialog-container").hide();
	});
	
	$("#confirm-dialog-container").on('keydown', function(event) {     
	        switch (event.keyCode) {
	            case 27:
	            	$(this).hide();
	                break;
	            case 9:
	            	document.activeElement == $("#confirm-dialog-ok")[0] ? $("#confirm-dialog-cancel").focus() : $("#confirm-dialog-ok").focus(); 
	            	break;
	            case 13:
	            	$(document.activeElement).click();
	                break;
	        }
	       return false;
	}); 
	
	page.highlight();
	
	page.table.init();
	
	page.tabs.init();
	
};

page.table = {};

page.table.paginate = function() {
	$("table").unbind("repaginate").each(function() {
		var $table = $(this);
		$(".pager").remove();
	    var currentPage = 0;
	    var numPerPage = 12;
	    $table.bind('repaginate', function() {
	        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	    });
	    $table.trigger('repaginate');
	    var numRows = $table.find('tbody tr').length;
	    if(numRows > numPerPage) {
		    var numPages = Math.ceil(numRows / numPerPage);
		    var $pager = $('<div class="pager"></div>').attr("id","pager"+$table.parent().attr("id"));
		    for (var page = 0; page < numPages; page++) {
		        $('<span class="page-number"></span>').text(page + 1).bind('click', {
		            newPage: page
		        }, function(event) {
		            currentPage = event.data['newPage'];
		            $table.trigger('repaginate');
		            $(this).addClass('active').siblings().removeClass('active');
		            $table.parent().focus();
		            return false;
		        }).appendTo($pager);
		    }
		    $pager.insertAfter($table.parent()).find('span.page-number:first').addClass('active');
		}
	    head.load("js/sortable.js", function() {
	    	sorttable.makeSortable($table[0]);
	    });
	});
};

page.table.init = function() {
	var tbody = $("#list tbody");
	var rows = $("tr",tbody).length; 
	if(!rows) {
		tbody.append("<tr class='empty'><td valign='top' colspan='"+$("th").length+"'>no record found</td></tr>");
		$("<div class='row-count'/>").html("0 records").insertAfter("#list");
	}else {
		page.table.paginate();
		$("<div class='row-count'/>").html(rows + " records").insertAfter("#list").fadeIn();
	}
	$("#search input").focus().val($("#search input").val());
	$("a.refresh-16").attr("href",window.location.href);
};

page.tabs = {};

page.tabs.init = function() {
	var tabs = $("#tabs").addClass("tab_container");
	var ul = $('<ul class="tabs"></ul>').insertBefore(tabs);
	$.each($("> div",tabs),function(index, element){
		  var div= $(element).attr("id","tab"+index).addClass("tab_content").hide();
		  var h2 = $("<h2>"+div.attr("title")+"</h2>").attr("title",div.attr("title"));
		  var li = $("<li/>").attr("rel",div.attr("id")).html(h2);
		  li.click(function() {
				var parent = $(this).parent();
				$("li",parent).removeClass("active");
				$(this).addClass("active");
				var activeTab = $(this).attr("rel"); 
				$("#"+activeTab).parent().find(".tab_content").hide();
				$("#"+activeTab).fadeIn(); 
		  }).appendTo(ul);
	});
	$("li:first-child",ul).addClass("active");
	$("div:first-child",tabs).fadeIn();
};

var alert = function(message,callback) {
	var container = $("#alert-dialog-container");
	$("span:nth-child(2)",container).html(message);
	container.show(0,function(){
		$("#alert-dialog-ok").one("click",function() {
			container.hide();
			if(callback)callback();
		}).focus();
	});
	return false;
};

var confirm = function(message,callback){
	$("body").trigger("click");
	var container = $("#confirm-dialog-container");
	$("span.confirmation-dialog-title",container).html(message);
	container.show(0,function(){
		$("#confirm-dialog-ok").one("click",function(){
			container.hide();
			callback();
		}).focus();
	});
};

app.getCountries = function(lang,selected) {
	app.get("https://restcountries.eu/rest/v2/all",function(countries){
		$.each(countries,function(index,country){
			const option = $("<option/>").html(country.name);
			option.attr("value",country.alpha3Code);
			if(country.alpha3Code == selected) {
				option.attr("selected","true");
			}
			$(".country").append(option);
			
		});
	},true);
};

app.ready(function() {
	page.init();
});

/* ! head.core - v1.0.2 */
(function(n,t){"use strict";function r(n){a[a.length]=n}function k(n){var t=new RegExp(" ?\\b"+n+"\\b");c.className=c.className.replace(t,"")}function p(n,t){for(var i=0,r=n.length;i<r;i++)t.call(n,n[i],i)}function tt(){var t,e,f,o;c.className=c.className.replace(/ (w-|eq-|gt-|gte-|lt-|lte-|portrait|no-portrait|landscape|no-landscape)\d+/g,"");t=n.innerWidth||c.clientWidth;e=n.outerWidth||n.screen.width;u.screen.innerWidth=t;u.screen.outerWidth=e;r("w-"+t);p(i.screens,function(n){t>n?(i.screensCss.gt&&r("gt-"+n),i.screensCss.gte&&r("gte-"+n)):t<n?(i.screensCss.lt&&r("lt-"+n),i.screensCss.lte&&r("lte-"+n)):t===n&&(i.screensCss.lte&&r("lte-"+n),i.screensCss.eq&&r("e-q"+n),i.screensCss.gte&&r("gte-"+n))});f=n.innerHeight||c.clientHeight;o=n.outerHeight||n.screen.height;u.screen.innerHeight=f;u.screen.outerHeight=o;u.feature("portrait",f>t);u.feature("landscape",f<t)}function it(){n.clearTimeout(b);b=n.setTimeout(tt,50)}var y=n.document,rt=n.navigator,ut=n.location,c=y.documentElement,a=[],i={screens:[240,320,480,640,768,800,1024,1280,1440,1680,1920],screensCss:{gt:!0,gte:!1,lt:!0,lte:!1,eq:!1},browsers:[{ie:{min:6,max:11}}],browserCss:{gt:!0,gte:!1,lt:!0,lte:!1,eq:!0},html5:!0,page:"-page",section:"-section",head:"head"},v,u,s,w,o,h,l,d,f,g,nt,e,b;if(n.head_conf)for(v in n.head_conf)n.head_conf[v]!==t&&(i[v]=n.head_conf[v]);u=n[i.head]=function(){u.ready.apply(null,arguments)};u.feature=function(n,t,i){return n?(Object.prototype.toString.call(t)==="[object Function]"&&(t=t.call()),r((t?"":"no-")+n),u[n]=!!t,i||(k("no-"+n),k(n),u.feature()),u):(c.className+=" "+a.join(" "),a=[],u)};u.feature("js",!0);s=rt.userAgent.toLowerCase();w=/mobile|android|kindle|silk|midp|phone|(windows .+arm|touch)/.test(s);u.feature("mobile",w,!0);u.feature("desktop",!w,!0);s=/(chrome|firefox)[ \/]([\w.]+)/.exec(s)||/(iphone|ipad|ipod)(?:.*version)?[ \/]([\w.]+)/.exec(s)||/(android)(?:.*version)?[ \/]([\w.]+)/.exec(s)||/(webkit|opera)(?:.*version)?[ \/]([\w.]+)/.exec(s)||/(msie) ([\w.]+)/.exec(s)||/(trident).+rv:(\w.)+/.exec(s)||[];o=s[1];h=parseFloat(s[2]);switch(o){case"msie":case"trident":o="ie";h=y.documentMode||h;break;case"firefox":o="ff";break;case"ipod":case"ipad":case"iphone":o="ios";break;case"webkit":o="safari"}for(u.browser={name:o,version:h},u.browser[o]=!0,l=0,d=i.browsers.length;l<d;l++)for(f in i.browsers[l])if(o===f)for(r(f),g=i.browsers[l][f].min,nt=i.browsers[l][f].max,e=g;e<=nt;e++)h>e?(i.browserCss.gt&&r("gt-"+f+e),i.browserCss.gte&&r("gte-"+f+e)):h<e?(i.browserCss.lt&&r("lt-"+f+e),i.browserCss.lte&&r("lte-"+f+e)):h===e&&(i.browserCss.lte&&r("lte-"+f+e),i.browserCss.eq&&r("eq-"+f+e),i.browserCss.gte&&r("gte-"+f+e));else r("no-"+f);r(o);r(o+parseInt(h,10));i.html5&&o==="ie"&&h<9&&p("abbr|article|aside|audio|canvas|details|figcaption|figure|footer|header|hgroup|main|mark|meter|nav|output|progress|section|summary|time|video".split("|"),function(n){y.createElement(n)});p(ut.pathname.split("/"),function(n,u){if(this.length>2&&this[u+1]!==t)u&&r(this.slice(u,u+1).join("-").toLowerCase()+i.section);else{var f=n||"index",e=f.indexOf(".");e>0&&(f=f.substring(0,e));c.id=f.toLowerCase()+i.page;u||r("root"+i.section)}});u.screen={height:n.screen.height,width:n.screen.width};tt();b=0;n.addEventListener?n.addEventListener("resize",it,!1):n.attachEvent("onresize",it)})(window);
/* ! head.css3 - v1.0.0 */
(function(n,t){"use strict";function a(n){for(var r in n)if(i[n[r]]!==t)return!0;return!1}function r(n){var t=n.charAt(0).toUpperCase()+n.substr(1),i=(n+" "+c.join(t+" ")+t).split(" ");return!!a(i)}var h=n.document,o=h.createElement("i"),i=o.style,s=" -o- -moz- -ms- -webkit- -khtml- ".split(" "),c="Webkit Moz O ms Khtml".split(" "),l=n.head_conf&&n.head_conf.head||"head",u=n[l],f={gradient:function(){var n="background-image:";return i.cssText=(n+s.join("gradient(linear,left top,right bottom,from(#9f9),to(#fff));"+n)+s.join("linear-gradient(left top,#eee,#fff);"+n)).slice(0,-n.length),!!i.backgroundImage},rgba:function(){return i.cssText="background-color:rgba(0,0,0,0.5)",!!i.backgroundColor},opacity:function(){return o.style.opacity===""},textshadow:function(){return i.textShadow===""},multiplebgs:function(){i.cssText="background:url(https://),url(https://),red url(https://)";var n=(i.background||"").match(/url/g);return Object.prototype.toString.call(n)==="[object Array]"&&n.length===3},boxshadow:function(){return r("boxShadow")},borderimage:function(){return r("borderImage")},borderradius:function(){return r("borderRadius")},cssreflections:function(){return r("boxReflect")},csstransforms:function(){return r("transform")},csstransitions:function(){return r("transition")},touch:function(){return"ontouchstart"in n},retina:function(){return n.devicePixelRatio>1},fontface:function(){var t=u.browser.name,n=u.browser.version;switch(t){case"ie":return n>=9;case"chrome":return n>=13;case"ff":return n>=6;case"ios":return n>=5;case"android":return!1;case"webkit":return n>=5.1;case"opera":return n>=10;default:return!1}}};for(var e in f)f[e]&&u.feature(e,f[e].call(),!0);u.feature()})(window);
/* ! head.load - v1.0.3 */
(function(n,t){"use strict";function w(){}function u(n,t){if(n){typeof n=="object"&&(n=[].slice.call(n));for(var i=0,r=n.length;i<r;i++)t.call(n,n[i],i)}}function it(n,i){var r=Object.prototype.toString.call(i).slice(8,-1);return i!==t&&i!==null&&r===n}function s(n){return it("Function",n)}function a(n){return it("Array",n)}function et(n){var i=n.split("/"),t=i[i.length-1],r=t.indexOf("?");return r!==-1?t.substring(0,r):t}function f(n){(n=n||w,n._done)||(n(),n._done=1)}function ot(n,t,r,u){var f=typeof n=="object"?n:{test:n,success:!t?!1:a(t)?t:[t],failure:!r?!1:a(r)?r:[r],callback:u||w},e=!!f.test;return e&&!!f.success?(f.success.push(f.callback),i.load.apply(null,f.success)):e||!f.failure?u():(f.failure.push(f.callback),i.load.apply(null,f.failure)),i}function v(n){var t={},i,r;if(typeof n=="object")for(i in n)!n[i]||(t={name:i,url:n[i]});else t={name:et(n),url:n};return(r=c[t.name],r&&r.url===t.url)?r:(c[t.name]=t,t)}function y(n){n=n||c;for(var t in n)if(n.hasOwnProperty(t)&&n[t].state!==l)return!1;return!0}function st(n){n.state=ft;u(n.onpreload,function(n){n.call()})}function ht(n){n.state===t&&(n.state=nt,n.onpreload=[],rt({url:n.url,type:"cache"},function(){st(n)}))}function ct(){var n=arguments,t=n[n.length-1],r=[].slice.call(n,1),f=r[0];return(s(t)||(t=null),a(n[0]))?(n[0].push(t),i.load.apply(null,n[0]),i):(f?(u(r,function(n){s(n)||!n||ht(v(n))}),b(v(n[0]),s(f)?f:function(){i.load.apply(null,r)})):b(v(n[0])),i)}function lt(){var n=arguments,t=n[n.length-1],r={};return(s(t)||(t=null),a(n[0]))?(n[0].push(t),i.load.apply(null,n[0]),i):(u(n,function(n){n!==t&&(n=v(n),r[n.name]=n)}),u(n,function(n){n!==t&&(n=v(n),b(n,function(){y(r)&&f(t)}))}),i)}function b(n,t){if(t=t||w,n.state===l){t();return}if(n.state===tt){i.ready(n.name,t);return}if(n.state===nt){n.onpreload.push(function(){b(n,t)});return}n.state=tt;rt(n,function(){n.state=l;t();u(h[n.name],function(n){f(n)});o&&y()&&u(h.ALL,function(n){f(n)})})}function at(n){n=n||"";var t=n.split("?")[0].split(".");return t[t.length-1].toLowerCase()}function rt(t,i){function e(t){t=t||n.event;u.onload=u.onreadystatechange=u.onerror=null;i()}function o(f){f=f||n.event;(f.type==="load"||/loaded|complete/.test(u.readyState)&&(!r.documentMode||r.documentMode<9))&&(n.clearTimeout(t.errorTimeout),n.clearTimeout(t.cssTimeout),u.onload=u.onreadystatechange=u.onerror=null,i())}function s(){if(t.state!==l&&t.cssRetries<=20){for(var i=0,f=r.styleSheets.length;i<f;i++)if(r.styleSheets[i].href===u.href){o({type:"load"});return}t.cssRetries++;t.cssTimeout=n.setTimeout(s,250)}}var u,h,f;i=i||w;h=at(t.url);h==="css"?(u=r.createElement("link"),u.type="text/"+(t.type||"css"),u.rel="stylesheet",u.href=t.url,t.cssRetries=0,t.cssTimeout=n.setTimeout(s,500)):(u=r.createElement("script"),u.type="text/"+(t.type||"javascript"),u.src=t.url);u.onload=u.onreadystatechange=o;u.onerror=e;u.async=!1;u.defer=!1;t.errorTimeout=n.setTimeout(function(){e({type:"timeout"})},15e3);f=r.head||r.getElementsByTagName("head")[0];f.insertBefore(u,f.lastChild)}function vt(){for(var t,u=r.getElementsByTagName("script"),n=0,f=u.length;n<f;n++)if(t=u[n].getAttribute("data-headjs-load"),!!t){i.load(t);return}}function yt(n,t){var v,p,e;return n===r?(o?f(t):d.push(t),i):(s(n)&&(t=n,n="ALL"),a(n))?(v={},u(n,function(n){v[n]=c[n];i.ready(n,function(){y(v)&&f(t)})}),i):typeof n!="string"||!s(t)?i:(p=c[n],p&&p.state===l||n==="ALL"&&y()&&o)?(f(t),i):(e=h[n],e?e.push(t):e=h[n]=[t],i)}function e(){if(!r.body){n.clearTimeout(i.readyTimeout);i.readyTimeout=n.setTimeout(e,50);return}o||(o=!0,vt(),u(d,function(n){f(n)}))}function k(){r.addEventListener?(r.removeEventListener("DOMContentLoaded",k,!1),e()):r.readyState==="complete"&&(r.detachEvent("onreadystatechange",k),e())}var r=n.document,d=[],h={},c={},ut="async"in r.createElement("script")||"MozAppearance"in r.documentElement.style||n.opera,o,g=n.head_conf&&n.head_conf.head||"head",i=n[g]=n[g]||function(){i.ready.apply(null,arguments)},nt=1,ft=2,tt=3,l=4,p;if(r.readyState==="complete")e();else if(r.addEventListener)r.addEventListener("DOMContentLoaded",k,!1),n.addEventListener("load",e,!1);else{r.attachEvent("onreadystatechange",k);n.attachEvent("onload",e);p=!1;try{p=!n.frameElement&&r.documentElement}catch(wt){}p&&p.doScroll&&function pt(){if(!o){try{p.doScroll("left")}catch(t){n.clearTimeout(i.readyTimeout);i.readyTimeout=n.setTimeout(pt,50);return}e()}}()}i.load=i.js=ut?lt:ct;i.test=ot;i.ready=yt;i.ready(r,function(){y()&&u(h.ALL,function(n){f(n)});i.feature&&i.feature("domloaded",!0)})})(window);
/*
 * //# sourceMappingURL=head.min.js.map
 */
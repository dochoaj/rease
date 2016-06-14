/*!
 * froala_editor v2.0.1 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms
 * Copyright 2014-2015 Froala Labs
 */
!function(e){"function"==typeof define&&define.amd?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n),n}:e(jQuery)}(function(e){"use strict";e.extend(e.FroalaEditor.POPUP_TEMPLATES,{"link.edit":"[_BUTTONS_]","link.insert":"[_BUTTONS_][_INPUT_LAYER_]"}),e.extend(e.FroalaEditor.DEFAULTS,{linkEditButtons:["linkOpen","linkStyle","linkEdit","linkRemove"],linkInsertButtons:["linkBack","|","linkList"],linkAttributes:{},linkAutoPrefix:"http://",linkStyles:{"fr-green":"Green","fr-strong":"Thick"},linkMultipleStyles:!0,linkConvertEmailAddress:!0,linkAlwaysBlank:!1,linkAlwaysNoFollow:!1,linkList:[{text:"Froala",href:"https://froala.com",target:"_blank"},{text:"Google",href:"https://google.com",target:"_blank"},{displayText:"Facebook",href:"https://facebook.com"}],linkText:!0}),e.FroalaEditor.PLUGINS.link=function(t){function n(){}function i(){var n=t.image?t.image.get():null;if(!n&&t.$wp){var i=t.selection.element(),a=t.selection.endElement();return"A"!=i.tagName&&(i=e(i).parents("a:first").get(0)),"A"!=a.tagName&&(a=e(a).parents("a:first").get(0)),a&&a==i?i:null}return"A"==t.$el.get(0).tagName&&t.core.hasFocus()?t.$el:n&&n.get(0).parentNode&&"A"==n.get(0).parentNode.tagName?n.get(0).parentNode:void 0}function a(){var e=t.image?t.image.get():null,n=[];if(e)"A"==e.get(0).parentNode.tagName&&n.push(e.get(0).parentNode);else{var i,a,o,r;if(t.window.getSelection){var s=t.window.getSelection();if(s.getRangeAt&&s.rangeCount){r=t.document.createRange();for(var l=0;l<s.rangeCount;++l)if(i=s.getRangeAt(l),a=i.commonAncestorContainer,a&&1!=a.nodeType&&(a=a.parentNode),a&&"a"==a.nodeName.toLowerCase())n.push(a);else{o=a.getElementsByTagName("a");for(var c=0;c<o.length;++c)r.selectNodeContents(o[c]),r.compareBoundaryPoints(i.END_TO_START,i)<1&&r.compareBoundaryPoints(i.START_TO_END,i)>-1&&n.push(o[c])}}}else if(t.document.selection&&"Control"!=t.document.selection.type)if(i=t.document.selection.createRange(),a=i.parentElement(),"a"==a.nodeName.toLowerCase())n.push(a);else{o=a.getElementsByTagName("a"),r=t.document.body.createTextRange();for(var d=0;d<o.length;++d)r.moveToElementText(o[d]),r.compareEndPoints("StartToEnd",i)>-1&&r.compareEndPoints("EndToStart",i)<1&&n.push(o[d])}}return n}function o(n){setTimeout(function(){if(!n||n&&(1==n.which||"mouseup"!=n.type)){var a=i(),o=t.image?t.image.get():null;if(a&&!o){if(t.image){var s=t.node.contents(a);if(1==s.length&&"IMG"==s[0].tagName)return e(s[0]).trigger("click"),!1}n&&n.stopPropagation(),r(a)}else t.popups.hide("link.edit")}},t.helpers.isIOS()?100:0)}function r(n){var i=t.popups.get("link.edit");i||(i=l());var a=e(n);t.popups.isVisible("link.edit")||t.popups.refresh("link.edit"),t.popups.setContainer("link.edit",e(t.opts.scrollableContainer));var o=a.offset().left+e(n).outerWidth()/2,r=a.offset().top+a.outerHeight();t.popups.show("link.edit",o,r,a.outerHeight())}function s(){t.popups.hide("link.edit")}function l(){var e="";t.opts.linkEditButtons.length>1&&("A"==t.$el.get(0).tagName&&t.opts.linkEditButtons.indexOf("linkRemove")>=0&&t.opts.linkEditButtons.splice(t.opts.linkEditButtons.indexOf("linkRemove"),1),e='<div class="fr-buttons">'+t.button.buildList(t.opts.linkEditButtons)+"</div>");var n={buttons:e},a=t.popups.create("link.edit",n);return t.$wp&&t.$wp.on("scroll.link-edit",function(){i()&&t.popups.isVisible("link.edit")&&r(i())}),t.events.on("destroy",function(){t.$wp&&t.$wp.off("scroll.link-edit")}),a}function c(){}function d(){var n=t.popups.get("link.insert"),a=i();if(a){var o,r,s=e(a),l=n.find('input.fr-link-attr[type="text"]'),c=n.find('input.fr-link-attr[type="checkbox"]');for(o=0;o<l.length;o++)r=e(l[o]),r.val(s.attr(r.attr("name")||""));for(c.prop("checked",!1),o=0;o<c.length;o++)r=e(c[o]),s.attr(r.attr("name"))==r.data("checked")&&r.prop("checked",!0);n.find('input.fr-link-attr[type="text"][name="text"]').val(s.text())}else n.find('input.fr-link-attr[type="text"]').val(""),n.find('input.fr-link-attr[type="checkbox"]').prop("checked",!1),n.find('input.fr-link-attr[type="text"][name="text"]').val(t.selection.text());n.find("input.fr-link-attr").trigger("change");var d=t.image?t.image.get():null;d?n.find('.fr-link-attr[name="text"]').parent().hide():n.find('.fr-link-attr[name="text"]').parent().show()}function u(){var n=t.$tb.find('.fr-command[data-cmd="insertLink"]'),i=t.popups.get("link.insert");if(i||(i=f()),!i.hasClass("fr-active"))if(t.popups.refresh("link.insert"),t.popups.setContainer("link.insert",t.$tb||e(t.opts.scrollableContainer)),n.is(":visible")){var a=n.offset().left+n.outerWidth()/2,o=n.offset().top+(t.opts.toolbarBottom?10:n.outerHeight()-10);t.popups.show("link.insert",a,o,n.outerHeight())}else t.position.forSelection(i),t.popups.show("link.insert")}function f(){var e="";t.opts.linkInsertButtons.length>=1&&(e='<div class="fr-buttons">'+t.button.buildList(t.opts.linkInsertButtons)+"</div>");var n='<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="10" height="10" viewBox="0 0 32 32"><path d="M27 4l-15 15-7-7-5 5 12 12 20-20z" fill="#FFF"></path></svg>',a="",o=0;a='<div class="fr-link-insert-layer fr-layer fr-active" id="fr-link-insert-layer-'+t.id+'">',a+='<div class="fr-input-line"><input name="href" type="text" class="fr-link-attr" placeholder="URL" tabIndex="'+ ++o+'"></div>',t.opts.linkText&&(a+='<div class="fr-input-line"><input name="text" type="text" class="fr-link-attr" placeholder="'+t.language.translate("Text")+'" tabIndex="'+ ++o+'"></div>');for(var r in t.opts.linkAttributes){var s=t.opts.linkAttributes[r];a+='<div class="fr-input-line"><input name="'+r+'" type="text" class="fr-link-attr" placeholder="'+t.language.translate(s)+'" tabIndex="'+ ++o+'"></div>'}t.opts.linkAlwaysBlank||(a+='<div class="fr-checkbox-line"><span class="fr-checkbox"><input name="target" class="fr-link-attr" data-checked="_blank" type="checkbox" id="fr-link-target-'+t.id+'" tabIndex="'+ ++o+'"><span>'+n+'</span></span><label for="fr-link-target-'+t.id+'">'+t.language.translate("Open in new tab")+"</label></div>"),a+='<div class="fr-action-buttons"><button class="fr-command fr-submit" data-cmd="linkInsert" href="#" tabIndex="'+ ++o+'" type="button">'+t.language.translate("Insert")+"</button></div></div>";var l={buttons:e,input_layer:a},u=t.popups.create("link.insert",l);return t.popups.onRefresh("link.insert",d),t.popups.onHide("link.insert",c),t.$wp&&t.$wp.on("scroll.link-insert",function(){var e=t.image?t.image.get():null;e&&t.popups.isVisible("link.insert")&&k(),i&&t.popups.isVisible("link.insert")&&w()}),t.events.on("destroy",function(){t.$wp&&t.$wp.off("scroll.link-insert")}),u}function p(){var n=i(),a=t.image?t.image.get():null;return t.events.trigger("link.beforeRemove",[n])===!1?!1:void(a&&n?(a.unwrap(),a.trigger("click")):n&&(t.selection.save(),e(n).replaceWith(e(n).html()),t.selection.restore(),s()))}function g(){t.events.on("keyup",function(t){t.which!=e.FroalaEditor.KEYCODE.ESC&&o(t)}),t.events.on("window.mouseup",o)}function h(n){var i,a,o=t.opts.linkList[n],r=t.popups.get("link.insert"),s=r.find('input.fr-link-attr[type="text"]'),l=r.find('input.fr-link-attr[type="checkbox"]');for(a=0;a<s.length;a++)i=e(s[a]),o[i.attr("name")]?i.val(o[i.attr("name")]):i.val("");for(a=0;a<l.length;a++)i=e(l[a]),i.prop("checked",i.data("checked")==o[i.attr("name")])}function m(){var n,i,a=t.popups.get("link.insert"),o=a.find('input.fr-link-attr[type="text"]'),r=a.find('input.fr-link-attr[type="checkbox"]'),s=o.filter('[name="href"]').val(),l=o.filter('[name="text"]').val(),c={};for(i=0;i<o.length;i++)n=e(o[i]),["href","text"].indexOf(n.attr("name"))<0&&(c[n.attr("name")]=n.val());for(i=0;i<r.length;i++)n=e(r[i]),n.is(":checked")?c[n.attr("name")]=n.data("checked"):c[n.attr("name")]=n.data("unchecked");var d=e(t.original_window).scrollTop();y(s,l,c),e(t.original_window).scrollTop(d)}function v(){if(!t.selection.isCollapsed()){t.selection.save();for(var n=t.$el.find(".fr-marker").addClass("fr-unprocessed").toArray();n.length;){var i=e(n.pop());i.removeClass("fr-unprocessed");var a=t.node.deepestParent(i.get(0));if(a){var o=i.get(0),r="",s="";do o=o.parentNode,t.node.isBlock(o)||(r+=t.node.closeTagString(o),s=t.node.openTagString(o)+s);while(o!=a);var l=t.node.openTagString(i.get(0))+i.html()+t.node.closeTagString(i.get(0));i.replaceWith('<span id="fr-break"></span>');var c=e(a).html();c=c.replace(/<span id="fr-break"><\/span>/g,r+l+s),e(a).html(c)}n=t.$el.find(".fr-marker.fr-unprocessed").toArray()}t.selection.restore()}}function y(n,r,s){"undefined"==typeof s&&(s={});var l=t.image?t.image.get():null;l||"A"==t.$el.get(0).tagName?"A"==t.$el.get(0).tagName&&t.$el.focus():(t.events.focus(!0),t.selection.restore());var c=n;if(t.opts.linkConvertEmailAddress){var d=/^[\w._]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/i;d.test(n)&&0!==n.indexOf("mailto:")&&(n="mailto:"+n)}if(0===n.indexOf("tel:")||0===n.indexOf("sms:")||0===n.indexOf("mailto:")||0===n.indexOf("data:image")||""===t.opts.linkAutoPrefix||/^(https?:|ftps?:|)\/\//.test(n)||(n=t.opts.linkAutoPrefix+n),n=t.helpers.sanitizeURL(n),t.opts.linkAlwaysBlank&&(s.target="_blank"),t.opts.linkAlwaysNoFollow&&(s.rel="nofollow"),r=r||"",n===t.opts.linkAutoPrefix){var u=t.popups.get("link.insert");return u.find('input[name="href"]').addClass("fr-error"),t.events.trigger("link.bad",[c]),!1}var f,p=i();if(p){f=e(p);var g=t.node.rawAttributes(p);for(var h in g)"class"!=h&&"style"!=h&&f.removeAttr(h);f.attr("href",n),r.length>0&&f.text()!=r&&!l&&f.text(r),l||f.prepend(e.FroalaEditor.START_MARKER).append(e.FroalaEditor.END_MARKER),f.attr(s),l||t.selection.restore()}else{l?l.wrap('<a href="'+n+'"></a>'):(t.document.execCommand("unlink",!1,!1),t.selection.isCollapsed()?(r=0===r.length?c:r,t.html.insert('<a href="'+n+'">'+e.FroalaEditor.START_MARKER+r+e.FroalaEditor.END_MARKER+"</a>"),t.selection.restore()):r.length>0&&r!=t.selection.text()?(t.selection.remove(),t.html.insert('<a href="'+n+'">'+e.FroalaEditor.START_MARKER+r+e.FroalaEditor.END_MARKER+"</a>"),t.selection.restore()):(v(),t.document.execCommand("createLink",!1,n)));for(var m=a(),y=0;y<m.length;y++)f=e(m[y]),f.attr(s),f.removeAttr("_moz_dirty");1==m.length&&t.$wp&&!l?(e(m[0]).prepend(e.FroalaEditor.START_MARKER).append(e.FroalaEditor.END_MARKER),t.selection.restore()):t.popups.hide("link.insert")}l?(l.trigger("touchstart"),l.trigger(t.helpers.isMobile()?"touchend":"click")):(t.popups.get("link.insert"),o())}function w(){s();var n=i();if(n){var a=t.popups.get("link.insert");a||(a=f()),t.popups.isVisible("link.insert")||(t.popups.refresh("link.insert"),t.selection.save(),t.helpers.isMobile()&&(t.events.disableBlur(),t.$el.blur(),t.events.enableBlur())),t.popups.setContainer("link.insert",e(t.opts.scrollableContainer));var o=(t.image?t.image.get():null)||e(n),r=o.offset().left+o.outerWidth()/2,l=o.offset().top+o.outerHeight();t.popups.show("link.insert",r,l,o.outerHeight())}}function b(){var e=t.image?t.image.get():null;if(e)e.trigger("click").trigger("touchend");else{t.events.disableBlur(),t.selection.restore(),t.events.enableBlur();var n=i();n&&t.$wp?(t.selection.restore(),s(),o()):"A"==t.$el.get(0).tagName?(t.$el.focus(),o()):(t.popups.hide("link.insert"),t.toolbar.showInline())}}function k(){var n=t.image?t.image.get():null;if(n){var i=t.popups.get("link.insert");i||(i=f()),d(!0),t.popups.setContainer("link.insert",e(t.opts.scrollableContainer));var a=n.offset().left+n.outerWidth()/2,o=n.offset().top+n.outerHeight();t.popups.show("link.insert",a,o,n.outerHeight())}}function S(n){var a=i();if(!a)return!1;if(!t.opts.linkMultipleStyles){var o=Object.keys(t.opts.linkStyles);o.splice(o.indexOf(n),1),e(a).removeClass(o.join(" "))}e(a).toggleClass(n)}return{_init:g,callback:n,remove:p,showInsertPopup:u,usePredefined:h,insertCallback:m,insert:y,update:w,get:i,allSelected:a,back:b,imageLink:k,applyStyle:S}},e.FroalaEditor.DefineIcon("insertLink",{NAME:"link"}),e.FroalaEditor.RegisterShortcut(75,"insertLink"),e.FroalaEditor.RegisterCommand("insertLink",{title:"Insert Link",undo:!1,focus:!0,refreshOnCallback:!1,popup:!0,callback:function(){this.popups.isVisible("link.insert")?(this.$el.find(".fr-marker")&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("link.insert")):this.link.showInsertPopup()}}),e.FroalaEditor.DefineIcon("linkOpen",{NAME:"external-link"}),e.FroalaEditor.RegisterCommand("linkOpen",{title:"Open Link",undo:!1,refresh:function(t){var n=this.link.get();n?(t.removeClass("fr-hidden"),t.attr("href",e(n).attr("href")).attr("target","_blank").attr("rel","nofollow")):t.addClass("fr-hidden")}}),e.FroalaEditor.DefineIcon("linkEdit",{NAME:"edit"}),e.FroalaEditor.RegisterCommand("linkEdit",{title:"Edit Link",undo:!1,refreshAfterCallback:!1,callback:function(){this.link.update()},refresh:function(e){var t=this.link.get();t?e.removeClass("fr-hidden"):e.addClass("fr-hidden")}}),e.FroalaEditor.DefineIcon("linkRemove",{NAME:"unlink"}),e.FroalaEditor.RegisterCommand("linkRemove",{title:"Unlink",callback:function(){this.link.remove()},refresh:function(e){var t=this.link.get();t?e.removeClass("fr-hidden"):e.addClass("fr-hidden")}}),e.FroalaEditor.DefineIcon("linkBack",{NAME:"arrow-left"}),e.FroalaEditor.RegisterCommand("linkBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.link.back()},refresh:function(e){var t=this.link.get(),n=this.image?this.image.get():null;n||t||this.opts.toolbarInline?(e.removeClass("fr-hidden"),e.next(".fr-separator").removeClass("fr-hidden")):(e.addClass("fr-hidden"),e.next(".fr-separator").addClass("fr-hidden"))}}),e.FroalaEditor.DefineIcon("linkList",{NAME:"search"}),e.FroalaEditor.RegisterCommand("linkList",{title:"Choose Link",type:"dropdown",focus:!1,undo:!1,refreshAfterCallback:!1,html:function(){for(var e='<ul class="fr-dropdown-list">',t=this.opts.linkList,n=0;n<t.length;n++)e+='<li><a class="fr-command" data-cmd="linkList" data-param1="'+n+'">'+(t[n].displayText||t[n].text)+"</a></li>";return e+="</ul>"},callback:function(e,t){this.link.usePredefined(t)}}),e.FroalaEditor.RegisterCommand("linkInsert",{focus:!1,refreshAfterCallback:!1,callback:function(){this.link.insertCallback()},refresh:function(e){var t=this.link.get();t?e.text(this.language.translate("Update")):e.text(this.language.translate("Insert"))}}),e.FroalaEditor.DefineIcon("imageLink",{NAME:"link"}),e.FroalaEditor.RegisterCommand("imageLink",{title:"Insert Link",undo:!1,focus:!1,callback:function(){this.link.imageLink()},refresh:function(e){var t,n=this.link.get();n?(t=e.prev(),t.hasClass("fr-separator")&&t.removeClass("fr-hidden"),e.addClass("fr-hidden")):(t=e.prev(),t.hasClass("fr-separator")&&t.addClass("fr-hidden"),e.removeClass("fr-hidden"))}}),e.FroalaEditor.DefineIcon("linkStyle",{NAME:"magic"}),e.FroalaEditor.RegisterCommand("linkStyle",{title:"Style",type:"dropdown",html:function(){var e='<ul class="fr-dropdown-list">',t=this.opts.linkStyles;for(var n in t)e+='<li><a class="fr-command" data-cmd="linkStyle" data-param1="'+n+'">'+this.language.translate(t[n])+"</a></li>";return e+="</ul>"},callback:function(e,t){this.link.applyStyle(t)},refreshOnShow:function(t,n){var i=this.link.get();if(i){var a=e(i);n.find(".fr-command").each(function(){var t=e(this).data("param1");e(this).toggleClass("fr-active",a.hasClass(t))})}}})});
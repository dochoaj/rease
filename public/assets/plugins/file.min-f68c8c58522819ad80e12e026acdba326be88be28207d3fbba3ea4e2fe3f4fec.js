/*!
 * froala_editor v2.0.1 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms
 * Copyright 2014-2015 Froala Labs
 */
!function(e){"function"==typeof define&&define.amd?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n),n}:e(jQuery)}(function(e){"use strict";e.extend(e.FroalaEditor.POPUP_TEMPLATES,{"file.insert":"[_BUTTONS_][_UPLOAD_LAYER_][_PROGRESS_BAR_]"}),e.extend(e.FroalaEditor.DEFAULTS,{fileUploadURL:"http://i.froala.com/upload",fileUploadParam:"file",fileUploadParams:{},fileUploadToS3:!1,fileUploadMethod:"POST",fileMaxSize:10485760,fileAllowedTypes:["*"],fileInsertButtons:["fileBack","|"],fileUseSelectedText:!1}),e.FroalaEditor.PLUGINS.file=function(t){function n(){var e=t.$tb.find('.fr-command[data-cmd="insertFile"]'),n=t.popups.get("file.insert");if(n||(n=v()),a(),!n.hasClass("fr-active")){t.popups.refresh("file.insert"),t.popups.setContainer("file.insert",t.$tb);var i=e.offset().left+e.outerWidth()/2,o=e.offset().top+(t.opts.toolbarBottom?0:e.outerHeight());t.popups.show("file.insert",i,o,e.outerHeight()),t.selection.save()}}function i(){var e=t.popups.get("file.insert");e&&(e.find(".fr-layer.fr-active").removeClass("fr-active").addClass("fr-pactive"),e.find(".fr-file-progress-bar-layer").addClass("fr-active"),e.find(".fr-buttons").hide(),o("Uploading",0))}function a(e){var n=t.popups.get("file.insert");n&&(n.find(".fr-layer.fr-pactive").addClass("fr-active").removeClass("fr-pactive"),n.find(".fr-file-progress-bar-layer").removeClass("fr-active"),n.find(".fr-buttons").show(),e&&t.popups.show("file.insert",null,null))}function o(e,n){var i=t.popups.get("file.insert");if(i){var a=i.find(".fr-file-progress-bar-layer");a.find("h3").text(e+(n?" "+n+"%":"")),a.removeClass("fr-error"),n?(a.find("div").removeClass("fr-indeterminate"),a.find("div > span").css("width",n+"%")):a.find("div").addClass("fr-indeterminate")}}function r(e){var n=t.popups.get("file.insert"),i=n.find(".fr-file-progress-bar-layer");i.addClass("fr-error"),i.find("h3").text(e)}function s(e,n,i){t.edit.on(),t.events.focus(!0),t.selection.restore(),t.html.insert('<a href="'+e+'" id="fr-inserted-file" class="fr-file">'+(n||t.selection.text())+"</a>");var a=t.$el.find("#fr-inserted-file");a.removeAttr("id"),t.popups.hide("file.insert"),t.undo.saveStep(),t.events.trigger("file.inserted",[a,i])}function l(n){try{if(t.events.trigger("file.uploaded",[n],!0)===!1)return t.edit.on(),!1;var i=e.parseJSON(n);return i.link?i:(p(C,n),!1)}catch(a){return p(_,n),!1}}function c(n){try{var i=e(n).find("Location").text(),a=e(n).find("Key").text();return t.events.trigger("file.uploadedToS3",[i,a,n],!0)===!1?(t.edit.on(),!1):i}catch(o){return p(_,n),!1}}function d(e){var n=this.status,i=this.response,a=this.responseXML,o=this.responseText;try{if(t.opts.fileUploadToS3)if(201==n){var r=c(a);r&&s(r,e,i||a)}else p(_,i||a);else if(n>=200&&300>n){var d=l(o);d&&s(d.link,e,i||o)}else p(E,i||o)}catch(u){p(_,i||o)}}function u(){p(_,this.response||this.responseText||this.responseXML)}function f(e){if(e.lengthComputable){var t=e.loaded/e.total*100|0;o("Uploading",t)}}function p(e,n){t.edit.on(),r(t.language.translate("Something went wrong. Please try again.")),t.events.trigger("file.error",[{code:e,message:x[e]},n])}function h(e){if(t.events.trigger("file.beforeUpload",[e])===!1)return!1;if("undefined"!=typeof e&&e.length>0){var n=e[0];if(n.size>t.opts.fileMaxSize)return p(T),!1;if(t.opts.fileAllowedTypes.indexOf("*")<0&&t.opts.fileAllowedTypes.indexOf(n.type.replace(/file\//g,""))<0)return p(A),!1;var a;if(t.drag_support.formdata&&(a=t.drag_support.formdata?new FormData:null),a){var o;if(t.opts.fileUploadToS3!==!1){a.append("key",t.opts.fileUploadToS3.keyStart+(new Date).getTime()+"-"+(n.name||"untitled")),a.append("success_action_status","201"),a.append("X-Requested-With","xhr"),a.append("Content-Type",n.type);for(o in t.opts.fileUploadToS3.params)a.append(o,t.opts.fileUploadToS3.params[o])}for(o in t.opts.fileUploadParams)a.append(o,t.opts.fileUploadParams[o]);a.append(t.opts.fileUploadParam,n);var r=t.opts.fileUploadURL;t.opts.fileUploadToS3&&(r="https://"+t.opts.fileUploadToS3.region+".amazonaws.com/"+t.opts.fileUploadToS3.bucket);var s=t.core.getXHR(r,t.opts.fileUploadMethod);s.onload=function(){d.call(s,[t.opts.fileUseSelectedText?null:n.name])},s.onerror=u,s.upload.onprogress=f,i(),t.edit.off(),s.send(a)}}}function g(t){t.on("dragover dragenter",".fr-file-upload-layer",function(){return e(this).addClass("fr-drop"),!1}),t.on("dragleave dragend",".fr-file-upload-layer",function(){return e(this).removeClass("fr-drop"),!1}),t.on("drop",".fr-file-upload-layer",function(t){t.preventDefault(),t.stopPropagation(),e(this).removeClass("fr-drop");var n=t.originalEvent.dataTransfer;n&&n.files&&h(n.files)}),t.on("change",'.fr-file-upload-layer input[type="file"]',function(){this.files&&h(this.files),e(this).val("")})}function m(){a()}function v(){var e="";e='<div class="fr-buttons">'+t.button.buildList(t.opts.fileInsertButtons)+"</div>";var n="";n='<div class="fr-file-upload-layer fr-layer fr-active" id="fr-file-upload-layer-'+t.id+'"><strong>'+t.language.translate("Drop file")+"</strong><br>("+t.language.translate("or click")+')<form><input type="file" name="'+t.opts.fileUploadParam+'" accept="/*" tabIndex="-1"></form></div>';var i='<div class="fr-file-progress-bar-layer fr-layer"><h3 class="fr-message">Uploading</h3><div class="fr-loader"><span class="fr-progress"></span></div><div class="fr-action-buttons"><button type="button" class="fr-command" data-cmd="fileDismissError" tabIndex="2">OK</button></div></div>',a={buttons:e,upload_layer:n,progress_bar:i},o=t.popups.create("file.insert",a);return t.popups.onHide("file.insert",m),g(o),o}function y(n){return e(n).hasClass("fr-file")?t.events.trigger("file.unlink",[n]):void 0}function w(){var n=function(e){e.preventDefault()};t.events.on("dragenter",n),t.events.on("dragover",n),t.events.on("drop",function(n){t.popups.hideAll();var a=n.originalEvent.dataTransfer;if(a&&a.files&&a.files.length){var o=a.files[0];if(o&&o.type&&(t.opts.fileAllowedTypes.indexOf(o.type)>=0||t.opts.fileAllowedTypes.indexOf("*")>=0)){t.markers.insertAtPoint(n.originalEvent),t.markers.remove(),t.popups.hideAll();var r=t.popups.get("file.insert");r||(r=v()),t.popups.setContainer("file.insert",e(t.opts.scrollableContainer)),t.popups.show("file.insert",n.originalEvent.pageX,n.originalEvent.pageY),i(),h(a.files),n.preventDefault(),n.stopPropagation()}}})}function b(){t.events.disableBlur(),t.selection.restore(),t.events.enableBlur(),t.popups.hide("file.insert"),t.toolbar.showInline()}function k(){w(),t.events.on("link.beforeRemove",y)}var S=1,C=2,E=3,_=4,T=5,A=6,F=7,x={};return x[S]="File cannot be loaded from the passed link.",x[C]="No link in upload response.",x[E]="Error during file upload.",x[_]="Parsing response failed.",x[T]="File is too large.",x[A]="File file type is invalid.",x[F]="Files can be uploaded only to same domain in IE 8 and IE 9.",{_init:k,showInsertPopup:n,upload:h,insert:s,back:b,hideProgressBar:a}},e.FroalaEditor.DefineIcon("insertFile",{NAME:"file-o"}),e.FroalaEditor.RegisterCommand("insertFile",{title:"Upload File",undo:!1,focus:!0,refershAfterCallback:!1,popup:!0,callback:function(){this.popups.isVisible("file.insert")?(this.$el.find(".fr-marker")&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("file.insert")):this.file.showInsertPopup()}}),e.FroalaEditor.DefineIcon("fileBack",{NAME:"arrow-left"}),e.FroalaEditor.RegisterCommand("fileBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.file.back()},refresh:function(e){this.opts.toolbarInline?(e.removeClass("fr-hidden"),e.next(".fr-separator").removeClass("fr-hidden")):(e.addClass("fr-hidden"),e.next(".fr-separator").addClass("fr-hidden"))}}),e.FroalaEditor.RegisterCommand("fileDismissError",{title:"OK",callback:function(){this.file.hideProgressBar(!0)}})});
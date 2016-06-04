/*!
 * froala_editor v2.0.1 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms
 * Copyright 2014-2015 Froala Labs
 */
!function(e){"function"==typeof define&&define.amd?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n),n}:e(jQuery)}(function(e){"use strict";e.extend(e.FroalaEditor.DEFAULTS,{charCounterMax:-1,charCounterCount:!0}),e.FroalaEditor.PLUGINS.charCounter=function(t){function n(){return t.$el.text().length}function i(e){if(t.opts.charCounterMax<0)return!0;if(n()<t.opts.charCounterMax)return!0;var i=e.which;return!t.keys.ctrlKey(e)&&t.keys.isCharacter(i)?(e.preventDefault(),e.stopPropagation(),t.events.trigger("charCounter.exceeded"),!1):!0}function a(i){if(t.opts.charCounterMax<0)return i;var a=e("<div>").html(i).text().length;return a+n()<=t.opts.charCounterMax?i:(t.events.trigger("charCounter.exceeded"),"")}function o(){if(t.opts.charCounterCount){var e=n()+(t.opts.charCounterMax>0?"/"+t.opts.charCounterMax:"");s.text(e),t.opts.toolbarBottom&&s.css("margin-bottom",t.$tb.outerHeight(!0));var i=t.$wp.get(0).offsetWidth-t.$wp.get(0).clientWidth;i>0&&("rtl"==t.opts.direction?s.css("margin-left",i):s.css("margin-right",i))}}function r(){return t.$wp&&t.opts.charCounterCount?(s=e('<span class="fr-counter"></span>'),t.$box.append(s),t.events.on("keydown",i,!0),t.events.on("paste.afterCleanup",a),t.events.on("keyup",o),t.events.on("contentChanged",o),t.events.on("charCounter.update",o),o(),void t.events.on("destroy",function(){e(t.original_window).off("resize.char"+t.id),s.removeData().remove()})):!1}var s;return{_init:r}}});
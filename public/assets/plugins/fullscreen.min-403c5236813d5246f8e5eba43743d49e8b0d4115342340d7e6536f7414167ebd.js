/*!
 * froala_editor v2.0.1 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms
 * Copyright 2014-2015 Froala Labs
 */
!function(e){"function"==typeof define&&define.amd?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n),n}:e(jQuery)}(function(e){"use strict";e.FroalaEditor.PLUGINS.fullscreen=function(t){function n(){return t.$box.hasClass("fr-fullscreen")}function i(){l=e(t.original_window).scrollTop(),t.$box.toggleClass("fr-fullscreen"),e("body").toggleClass("fr-fullscreen"),c=e('<div style="display: none;"></div>'),t.$box.after(c).appendTo(e("body")),t.helpers.isMobile()&&(t.$tb.data("parent",t.$tb.parent()),t.$tb.prependTo(t.$box),t.$tb.data("sticky-dummy")&&t.$tb.after(t.$tb.data("sticky-dummy"))),t.$wp.css("max-height",""),t.$wp.css("height",e(t.original_window).height()-(t.opts.toolbarInline?0:t.$tb.outerHeight())),t.opts.toolbarInline&&t.toolbar.showInline(),t.events.trigger("charCounter.update"),t.$window.trigger("scroll.sticky"+t.id)}function a(){c.replaceWith(t.$box),t.$box.toggleClass("fr-fullscreen"),e("body").toggleClass("fr-fullscreen"),t.$tb.prependTo(t.$tb.data("parent")),t.$tb.data("sticky-dummy")&&t.$tb.after(t.$tb.data("sticky-dummy")),t.$wp.css("height",""),t.size.refresh(),e(t.original_window).scrollTop(l),t.opts.toolbarInline&&t.toolbar.showInline(),t.events.trigger("charCounter.update"),t.opts.toolbarSticky&&t.opts.toolbarStickyOffset&&(t.opts.toolbarBottom?t.$tb.css("bottom",t.opts.toolbarStickyOffset).data("bottom",t.opts.toolbarStickyOffset):t.$tb.css("top",t.opts.toolbarStickyOffset).data("top",t.opts.toolbarStickyOffset)),t.$window.trigger("scroll.sticky"+t.id)}function o(){n()?a():i(),r(t.$tb.find('.fr-command[data-cmd="fullscreen"]'))}function r(e){var t=n();e.toggleClass("fr-active",t),e.find("i").toggleClass("fa-expand",!t).toggleClass("fa-compress",t)}function s(){return t.$wp?(e(t.original_window).on("resize.fullscreen"+t.id,function(){n()&&(a(),i())}),t.events.on("toolbar.hide",function(){return n()&&t.helpers.isMobile()?!1:void 0}),void t.events.on("destroy",function(){e(t.original_window).off("resize.fullscreen"+t.id)})):!1}var l,c;return{_init:s,toggle:o,refresh:r,isActive:n}},e.FroalaEditor.RegisterCommand("fullscreen",{title:"Fullscreen",undo:!1,focus:!1,forcedRefresh:!0,callback:function(){this.fullscreen.toggle()},refresh:function(e){this.fullscreen.refresh(e)}}),e.FroalaEditor.DefineIcon("fullscreen",{NAME:"expand"})});
// This is a manifest file that'll be compiled into application, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require core/modernizr.min
//= require jquery2
//= require jquery_ujs
//= require turbolinks
//= require core/bootstrap
//= require core/detect
//= require core/fastclick
//= require core/jquery.blockUI
//= require core/waves
//= require core/jquery.nicescroll
//= require core/jquery.slimscroll
//= require core/jquery.scrollTo.min
//= require core/jquery.core
//= require core/jquery.app
//= require plugins/datatables/jquery.dataTables.min
//= require plugins/datatables/dataTables.bootstrap
//= require plugins/datatables/dataTables.buttons.min
//= require plugins/datatables/buttons.bootstrap.min
//= require plugins/datatables/jszip.min
//= require plugins/datatables/vfs_fonts
//= require plugins/datatables/buttons.html5.min
//= require plugins/datatables/buttons.print.min
//= require plugins/datatables/dataTables.fixedHeader.min
//= require plugins/datatables/dataTables.keyTable.min
//= require plugins/datatables/dataTables.responsive.min
//= require plugins/datatables/responsive.bootstrap.min
//= require plugins/datatables/dataTables.scroller.min

jQuery(window).bind("load", function() {
  $('#datatable').dataTable();

  var openLeftBtn = $(".open-left");

  function openLeftBar() {
    $("#wrapper").toggleClass("enlarged");
    $("#wrapper").addClass("forced");

    if ($("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left")) {
      $("body").removeClass("fixed-left").addClass("fixed-left-void");
    } else if (!$("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left-void")) {
      $("body").removeClass("fixed-left-void").addClass("fixed-left");
    }

    if ($("#wrapper").hasClass("enlarged")) {
      $(".left ul").removeAttr("style");
    } else {
      $(".subdrop").siblings("ul:first").show();
    }

    //this.toggle_slimscroll(".slimscrollleft");
    $("body").trigger("resize");
    // for mobile screen re-intializing it
    if(jQuery.browser.mobile === true) {
      $('.slimscrollleft').getNiceScroll().resize();
    }
  }
  openLeftBtn.on("click", function (e) {
    openLeftBar();
  });
});

var resizefunc = [];
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
//= require carts.js
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
  var menuItem = $("#sidebar-menu a");
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

  function menuItemClick() {
    if (!$("#wrapper").hasClass("enlarged")) {
      if ($(this).parent().hasClass("has_sub")) {}
      if (!$(this).hasClass("subdrop")) {
        // hide any open menus and remove all other classes
        $("ul", $(this).parents("ul:first")).slideUp(350);
        $("a", $(this).parents("ul:first")).removeClass("subdrop");
        $("#sidebar-menu .pull-right i").removeClass("zmdi-chevron-down").addClass("zmdi-chevron-right");
        // open our new menu and add the open class
        $(this).next("ul").slideDown(350);
        $(this).addClass("subdrop");
        $(".drop-arrow i", $(this).parents(".has_sub:first")).removeClass("zmdi-chevron-right").addClass("zmdi-chevron-down");
        $(".drop-arrow i", $(this).siblings("ul")).removeClass("zmdi-chevron-down").addClass("zmdi-chevron-right");
      } else if ($(this).hasClass("subdrop")) {
        $(this).removeClass("subdrop");
        $(this).next("ul").slideUp(350);
        $(".drop-arrow i", $(this).parent()).removeClass("zmdi-chevron-down").addClass("zmdi-chevron-right");
      }
    }
    $('.slimscrollleft').getNiceScroll().resize();
  }
  openLeftBtn.on("click", function (e) {
    openLeftBar();
  });
  menuItem.on("click", function (e) {
    console.log("Item clicado!")
    menuItemClick();
  });

  $("#sidebar-menu ul li.has_sub a.active").parents("li:last").children("a:first").addClass("active").trigger("click");

});

var resizefunc = [];



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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require core/bootstrap
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

  console.log(window + "Load!");
});
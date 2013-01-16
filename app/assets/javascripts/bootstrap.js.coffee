jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd'
  })
  $('#lexique_description').wysihtml5()
  $('#category_description').wysihtml5()
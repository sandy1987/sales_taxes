$(document).on('change', ".item_name", function(){
  var id = $(this).attr('id').split('item_name')[0];
  var price = parseFloat($(this).find(':selected').data('price'));
  var sale_tax = parseFloat($(this).find(':selected').data('sale_tax'));
  var import_tax = parseFloat($(this).find(':selected').data('import_tax'));
  var quantity = parseFloat($("#"+id+"quantity").val());
  
  total_amount = price*quantity;

  // sale tax calculation
  cal_sale_tax = (total_amount*sale_tax)/100;

  // import tax calculation
  cal_import_tax = (total_amount*import_tax)/100;

  // calculating price
  $("#"+id+"cost").val(price);

  $("#"+id+"sale_tax").val(cal_sale_tax);

  $("#"+id+"import_tax").val(cal_import_tax);
})

$(document).on("blur", ".quantity", function(){
  var id = $(this).attr('id').split('quantity')[0];
  var price = parseFloat($(this).parent().prev().find(".item_name").find(':selected').data('price'));
  var sale_tax = parseFloat($(this).parent().prev().find(".item_name").find(':selected').data('sale_tax'));
  var import_tax = parseFloat($(this).parent().prev().find(".item_name").find(':selected').data('import_tax'));
  var quantity = parseFloat($(this).val());

  total_amount = price*quantity;

  // sale tax calculation
  cal_sale_tax = (total_amount*sale_tax)/100;

  // import tax calculation
  cal_import_tax = (total_amount*import_tax)/100;

  $("#"+id+"cost").val(price);

  $("#"+id+"sale_tax").val(cal_sale_tax);

  $("#"+id+"import_tax").val(cal_import_tax);
})
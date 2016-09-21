$(document).ready( function () {
  var table = $('#table_id').DataTable({
  	select: {
      style: 'multi'
    },
    "pageLength": 150,

  });
    $("th:nth-last-child(3)").removeClass("sorting")
    $('tr').first().children('th').last().prev("th").andSelf().removeClass("sorting")
    $('.download-button').prop('disabled', true);

  $('form').click(function(){
    
      $(this).children('.download-button').prop('disabled', false);
  })

  $('input:radio[name="selected"]').change(function(event){
  	event.preventDefault();
    order = $(this).val();
    console.log($(this).val())
  	var selectedData = table.rows( { selected: true } ).data();
  	var count = selectedData.length
    var idArray = []

    for (i = 0; i < selectedData.length; i++){
      idArray.push(selectedData[i][0])
    }
    console.log(idArray)

		var request = $.ajax({
	  	url: "/download_selected",
	  	method: "GET",
	  	data: {data: idArray, order: order}
	  })

	  request.done(function (response) {
	  })

  })
  $('tr').click(function(){
    $("th:nth-last-child(3)").removeClass("sorting")
    $('tr').first().children('th').last().prev("th").andSelf().removeClass("sorting")
  })
});
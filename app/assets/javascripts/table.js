$(document).ready( function () {
  var table = $('#table_id').DataTable({
  	select: {
      style: 'multi'
    }

  });

  $('form').click(function(){

        $('.download-button').prop('disabled', false);
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
});
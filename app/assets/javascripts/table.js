$(document).ready( function () {
  var table = $('#table_id').DataTable({
  	select: {
      style: 'multi'
    }
  });

  $(".selected").on('click', function(event){
  	event.preventDefault();
  	var selectedData = table.rows( { selected: true } ).data();
  	var count = selectedData.length
  	var idArray = []

  	for (i = 0; i < selectedData.length; i++){
  		idArray.push(selectedData[i][0])
  	}

		var request = $.ajax({
	  	url: "/download_selected",
	  	method: "GET",
	  	data: {data: idArray}
	  })

	  request.done(function (response) {
	  })

  })
});
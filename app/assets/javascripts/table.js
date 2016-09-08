$(document).ready( function () {
  var table = $('#table_id').DataTable({
  	select: {
      style: 'multi'
    }
  });

  // $(".selected").on('click', function(event){
  // 	event.preventDefault();
  // 	var count = table.rows( { selected: true } )[0];
		// var data = count
		// var request = $.ajax({
	 //  	url: "/download_selected",
	 //  	method: "GET",
	 //  	data: {data: data}
	 //  })

	 //  request.done(function (response) {
	 //  	console.log(response)
	 //  })

  // })
});
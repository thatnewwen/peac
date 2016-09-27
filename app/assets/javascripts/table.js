$(document).ready( function () {
  var table = $('#table_id').DataTable({
  	select: {
      style: 'multi'
    },
    "pageLength": 150,
    dom: 'Bfrtip',
    buttons: ['csv', 'excel']

  });

    $("th:nth-last-child(3)").removeClass("sorting")
    $('tr').first().children('th').last().prev("th").andSelf().removeClass("sorting")
    $('.download-button').prop('disabled', true);
    $(".selected-form select").prop('disabled', true)

  $('form').click(function(){
    
      $(this).children('.download-button').prop('disabled', false);

  })

  $('.destroy-selected').click(function(event){
    event.preventDefault();
    var selectedData = table.rows( { selected: true } ).data();
    var count = selectedData.length
    var idArray = []

    for (i = 0; i < selectedData.length; i++){
      idArray.push(selectedData[i][0])
    }

    var request = $.ajax({
      url: "/destroy_selected",
      method: "GET",
      data: {data: idArray}
    })

    request.done(function (response) {
      location.reload();
    })
  })


  $('.selected-form select').change(function(event){
  	event.preventDefault();
    order = $(this).val();
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

    $(".selected-form select").prop('disabled', false)
    $(".selected-form .download-button").prop('disabled', true)
    $(".selected-form select").val("")
  })

  $("body").on("change", '#profile_current_location', function(event){
    // event.preventDefault();
    if ($(this).val() == "Other"){
      $("#profile_current_location").closest(".form-group").find("input").remove()
      $("#profile_current_location").closest(".form-group").html('<div class="new-label">Current location*</div><input class="form-control" type="text" name="profile[current_location]" id="profile_current_location">')
    }
  })

  $("body").on("change", '#profile_company', function(event){
    // event.preventDefault();
    if ($(this).val() == "Other"){
      $("#profile_company").closest(".form-group").find("input").remove()
      $("#profile_company").closest(".form-group").html('<div class="new-label">Company*</div><input class="form-control" type="text" name="profile[company]" id="profile_company">')
    }
  })
});
$(document).ready( function () {
  var table = $('#table_id').DataTable({
  	select: {
      style: 'multi'
    },
    "pageLength": 150,
    dom: 'Bfrtip',
    buttons: ['selectAll','selectNone', 'excel', {
            extend: 'selected',
            text: 'Delete selected',
            action: function ( e, dt, button, config ) {
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
            }
        }]

  });

    $("th:nth-last-child(3)").removeClass("sorting")
    $('tr').first().children('th').last().prev("th").andSelf().removeClass("sorting")
    $('.download-button').css('color', 'grey');
    $('.download-button').css('pointer-events', 'none');
    $('.download-button').css('cursor', 'default');
    $('.create-pdf').css('color', 'grey');
    $('.create-pdf').css('pointer-events', 'none');
    $('.create-pdf').css('cursor', 'default');

  $('form').click(function(){
    
      // $(this).children('.download-button').prop('disabled', false);

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


  $('.create-pdf').click(function(event){
    event.preventDefault();

    order = $('.selected-form select').val();
    var selectedData = table.rows( { selected: true } ).data();
    console.log(order)
    var idArray = []
    var count = selectedData.length
    if (count === 0) {
      window.alert("Please select at least one profile.");
    }
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
      $('.download-button').css('color', 'blue');
      $('.download-button').css('pointer-events', 'auto');
      $('.download-button').css('cursor', 'pointer');    
    })
  })

  $('.download-button').click(function(event){
    $('.download-button').css('color', 'grey');
    $('.download-button').css('pointer-events', 'none');
    $('.download-button').css('cursor', 'default');
  })
  //   // event.preventDefault();

  //   order = $('.selected-form select').val();
  //   var selectedData = table.rows( { selected: true } ).data();
  //   var idArray = []
  //   var count = selectedData.length

  //   for (i = 0; i < selectedData.length; i++){
  //     idArray.push(selectedData[i][0])
  //   }

  //   var request = $.ajax({
  //     url: "/download_selected",
  //     method: "GET",
  //     data: {data: idArray, order: order}
  //   })

  //   request.done(function (response) {

  //   })
  // })


  $('.buttons-select-all').click(function(){
    $('.create-pdf').css('color', 'blue');
    $('.create-pdf').css('pointer-events', 'auto');
    $('.create-pdf').css('cursor', 'pointer');    
  })

  $('tr').click(function(){
    $("th:nth-last-child(3)").removeClass("sorting")
    $('tr').first().children('th').last().prev("th").andSelf().removeClass("sorting")

    $('.create-pdf').css('color', 'blue');
    $('.create-pdf').css('pointer-events', 'auto');
    $('.create-pdf').css('cursor', 'pointer');
    $(".selected-form .download-button").prop('disabled', true)
    $(".selected-form select").val("")
  })

  $("body").on("change", '#profile_current_location', function(event){
    // event.preventDefault();
    if ($(this).val() == "Other"){
      $("#profile_current_location").closest(".form-group").find("select").hide()
      $("#profile_current_location").closest(".form-group").append('<input class="form-control" type="text" name="profile[current_location]" id="profile_current_location"><a class="cancel-location">Cancel</a>')
    }
  })

  $("body").on("change", '#profile_company', function(event){
    // event.preventDefault();
    if ($(this).val() == "Other"){
      $("#profile_company").closest(".form-group").find("select").hide()
      $("#profile_company").closest(".form-group").append('<input class="form-control" type="text" name="profile[company]" id="profile_company"><a class="cancel-company">Cancel</a>')
    }
  })

  $("body").on("click", ".cancel-location", function(event){
    event.preventDefault();
    $("#profile_current_location").closest(".form-group").find("input").remove()
    $("#profile_current_location").closest(".form-group").find("a").remove()
    $("#profile_current_location").closest(".form-group").find("select").show()
    $("#profile_current_location").closest(".form-group").find("select").val("select")
  })

  $("body").on("click", ".cancel-company", function(event){
    event.preventDefault();
    $("#profile_company").closest(".form-group").find("input").remove()
    $("#profile_company").closest(".form-group").find("a").remove()
    $("#profile_company").closest(".form-group").find("select").show()
    $("#profile_company").closest(".form-group").find("select").val("select")
  })
});
function displayEmail(){
  let email = $("#email_select").val()
  let url = `/emails/${email}.json`
  $.ajax({
    url: url,
    type: 'GET'
  }).done( (data) => {
    $("#message_area").empty()
    $("#message_area").append(simpleFormat(data.message))
  })
}

function displayList(){
  let import_file = $("#import_file_select").val()
  let url = `/import_files/${import_file}.json`
  $.ajax({
    url: url,
    type: 'GET'
  }).done( (data) => {
    $("#list_area").empty()
    $("#list_area").append(`<h4>${data.length} recipients</h4>`)
    $("#list_area").append("<ul>")
    $("#list_area").append(data.map(p => `<li>${p.first_name} ${p.last_name}</li>`))
    $("#list_area").append("</ul>")
  })
}

function simpleFormat(str) {
  str = str.replace(/\r\n?/, "\n");
  str = $.trim(str);
  if (str.length > 0) {
    str = str.replace(/\n\n+/g, '</p><p>');
    str = str.replace(/\n/g, '<br />');
    str = '<p>' + str + '</p>';
  }
  return str;
}

$( document ).ready(function() {
  displayEmail()
  displayList()
  $("#email_select").change(function(){
    displayEmail()
  })
  $("#import_file_select").change(function(){
    displayList()
  })
 })
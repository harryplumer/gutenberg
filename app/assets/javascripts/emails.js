$( document ).ready(function() {
 $(".click-to-add").click(function(){
    var box = $("#message_area")
    box.val(box.val() + "{{" + this.innerHTML + "}}")
    box.focus()
 })
})
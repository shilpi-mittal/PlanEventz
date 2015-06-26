// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function showDiv(id) {
    document.getElementById(id).style.display = "block";
    $('html, body').animate({
            scrollTop: $("#"+id).offset().top-100},1000);
}

function hideDiv(id) {
    document.getElementById(id).style.display = "none";
}

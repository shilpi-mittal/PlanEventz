// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function showDiv(id) {
    document.getElementById(id).style.display = "block";
   scrollToElement(id)
}

function hideDiv(id) {
    document.getElementById(id).style.display = "none";
}

function scrollToElement(elementId) {
    $('html, body').animate({
        scrollTop: $("#"+elementId).offset().top-100},1000);
}
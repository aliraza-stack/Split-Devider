//= require jquery
//= require jquery_ujs
//= require toastr


function hideandseek() {
  var x = document.getElementById("hidden");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

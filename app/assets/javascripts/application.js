//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require sweetalert2
//= require sweet-alert2-rails
//= require vendor/smooth-product
//= require_tree .

$(document).ready(function() {
  $('.filters .dropdown-menu li').on('click', function(event) {
    event.stopPropagation();
  });
});

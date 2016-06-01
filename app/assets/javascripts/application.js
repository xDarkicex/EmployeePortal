// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require ckeditor-jquery
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(function(){
  $('body').click(function(e){
    var o = $(e.target.parentNode);
    if(o.data('href')) window.document.location = o.data('href');
  });
  $('.ckeditor').ckeditor({
    // optional config
  });
  $password = $('.password').detach();
  $showpassword = $('.showpassword').detach();
  $hidepassword = $('.hidepassword').detach();
  $phoneinput = $('#user_phone');
  $iphone = $('.iphone').detach();
  $android = $('.android').detach();
  $computer = $('.computer').detach();
  $phoneinput.mask("(999) 999-9999");


  $('div.emailbuttoniphone').click(function(){
    $('.emailsettings').append($iphone);
    $android.detach();
    $computer.detach();
    $('.passwordfield').append($showpassword);
  });
  $('div.emailbuttonandroid').click(function(){
    $('.emailsettings').append($android);
    $iphone.detach();
    $computer.detach();
    $('.passwordfield').append($showpassword);
  });
$('div.emailbuttoncomputer').click(function(){
  $('.emailsettings').append($computer);
  $iphone.detach();
  $android.detach();
  $('.passwordfield').append($showpassword);
})
$($showpassword).click(function(){
  $('.passwordfield').append($password);
  $('.passwordfield').append($hidepassword);
  $($showpassword).detach();
})
$($hidepassword).click(function(){
  $('.passwordfield').append($showpassword);
  $($hidepassword).detach();
  $($password).detach();
})

    $("option[value='custom']").click(function(){
        console.log('fired');
});




});

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
// require_tree .

//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/tabs


//= require bootstrap/bootstrap
//= require bootstrap/carousel
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales
//= require solutions
//= require snm
//= require jstorage





$(document).on("ready load", function(){
/*-----------------------------------------------------------------------------------
On very first on ready
------------------------------------------------------------------------------------*/
	$("ul.current_menu li a."+$.jStorage.get("current_menu", "home")).parent().addClass("active");
	$("ul.current_menu li."+$.jStorage.get("current_menu")).addClass("active");
	//$.jStorage.flush() to clear local storage as cache
/*-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------*/
	$('#myCarousel').carousel({
		interval: 10000
	})
  $('#myCarousel').on('slid.bs.carousel', function() {
    	//alert("slid");
	});

  $(".error, .success, .notice").fadeOut(20000, function(){ $(this).html(""); });

  $(".current_menu li a").click(function(){
  	$.jStorage.set("current_menu", $(this).attr("class"), {});
  });

	$('.date-picker').datepicker({
		dateFormat: 'yy-mm-dd' 
	});

	// $(".edit_email").on("click", function(e){
	// 	edit_email_form_container
	// 	$.ajax({
	// 		url = 
	// 	});
	// });
});
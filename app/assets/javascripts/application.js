// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
	$('.datepicker').datepicker();
});

$(function () {
 $('.panel-google-plus > .panel-footer > .input-placeholder, .panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea > button[type="reset"]').on('click', function(event) {
      var $panel = $(this).closest('.panel-google-plus');
          $comment = $panel.find('.panel-google-plus-comment');
          
      $comment.find('.btn:first-child').addClass('disabled');
      $comment.find('textarea').val('');
      
      $panel.toggleClass('panel-google-plus-show-comment');
      
      if ($panel.hasClass('panel-google-plus-show-comment')) {
          $comment.find('textarea').focus();
      }
 });
 $('.panel-google-plus-comment > .panel-google-plus-textarea > textarea').on('keyup', function(event) {
      var $comment = $(this).closest('.panel-google-plus-comment');
      
      $comment.find('button[type="submit"]').addClass('disabled');
      if ($(this).val().length >= 1) {
          $comment.find('button[type="submit"]').removeClass('disabled');
      }
 });
});
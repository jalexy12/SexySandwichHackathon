// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("ready", function(){
	$(".sandwich-index-container").mouseenter(function(){
		$(this).children(".sandwich-overlay").show();
	}).mouseleave(function(){
		$(this).children(".sandwich-overlay").hide();
	})

	$(".sandwich-index-container").click(function(){
		$(".sandwich-modal-name").text($(this).data("sandwich-name"))
		$(".sandwich-modal-img").prop("src", $(this).data("sandwich-image"))
		$(".js-sandwich-comments").modal("show")
	})
})
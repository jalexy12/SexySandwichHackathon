// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("ready", function(){
	$(".sandwich-index-container").mouseenter(function(){
		$(this).children(".sandwich-overlay").show();
	}).mouseleave(function(){
		$(this).children(".sandwich-overlay").hide();
	})

	$(".sandwich-index-container").click(function(){
		getComments($(this).data("sandwich-id"));
		$(".sandwich-modal-name").text($(this).data("sandwich-name"))
		$(".sandwich-modal-name").data("sandwich-id", $(this).data("sandwich-id"))
		$(".sandwich-modal-img").prop("src", $(this).data("sandwich-image"))
		$(".js-sandwich-comments").modal("show")
	})

	$(".comment-form").on("submit", submitComment);
})

function submitComment(event){
	event.preventDefault();
	var sandwichId = $(".sandwich-modal-name").data("sandwich-id");
	var content = $(".comment-input").val();
	$.ajax({
		url: `/api/sandwiches/${sandwichId}/comments`,
		type: "POST",
		data: { content: content },
		success: onCommentSubmitSuccess,
		error: onCommentSubmitError
	})
	$(".comment-input").val("");
}

function onCommentSubmitSuccess(response){
	createComment(response)
}

function onCommentSubmitError(err){
	console.log(err, "Error");
}

function getComments(sandwichId){
	$.ajax({
		url: `/api/sandwiches/${sandwichId}/comments/`,
		success: populateComments,
		error: commentError
	})
}

function populateComments(response){
	$(".comment-list").empty();
	response.forEach((comment) => {
		createComment(comment);
	})
}


function createComment(comment){
	'use strict'
	let html = `
		<li class="comment-item">${comment.content}</li>
	`
	$(".comment-list").append(html);
}

function commentError(err){
	console.log("Error", err);
}
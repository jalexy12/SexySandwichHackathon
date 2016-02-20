// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("ready", function() {
	$(".js-btn-left").on("click", function() {
		var badSandwich = $(".js-btn-right").data("id");
		var goodSandwich = $(".js-btn-left").data("id");
		upLeftDownRight(goodSandwich, badSandwich);
	})

	$(",js-btn-right").on("click", function() {
		var goodSandwich = $(".js-btn-right").data("id");
		var badSandwich = $(".js-btn-left").data("id");
		upRightDownLeft(goodSandwich, badSandwich);
	})
})

//----------------------------------

function upLeftDownRight(goodSandwich, badSandwich) {
	$.ajax({
		url: "/sandwiches/vote",
		type: "POST",
		data: {
			sandwich_good_id: goodSandwich,
			sandwich_bad_id: badSandwich
		},
		success: function() {
		},
		error: function() {

		}
	})
}

function upRightDownLeft(goodSandwich, badSandwich) {
	$.ajax({
		url: "/sandwiches/vote",
		type: "POST",
		data: {
			sandwich_good_id: goodSandwich,
			sandwich_bad_id: badSandwich
		},
		success: function() {
		},
		error: function() {

		}
	})
}
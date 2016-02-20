// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("ready", function() {
	$(".js-btn-left").on("click", function() {
		var badSandwich = $(".js-btn-right").data("id");
		var goodSandwich = $(".js-btn-left").data("id");
		upLeftDownRight(goodSandwich, badSandwich);
	})

	$(".js-btn-right").on("click", function() {
		var goodSandwich = $(".js-btn-right").data("id");
		var badSandwich = $(".js-btn-left").data("id");
		upRightDownLeft(goodSandwich, badSandwich);
	})
})

//----------------------------------

function getSandwich(sandwichId) {
	var leftSandwich = $(".js-btn-left").data("id")
	$.ajax({
		url: "/sandwiches/replace",
		success: function(response) {
			if (sandwichId == leftSandwich) {
				$(".left-sandwich-img").prop("src", response.image_url);
				$(".js-btn-left").data("id", response.id);
			}
			else {
				$(".right-sandwich-img").prop("src", response.image_url);
				$(".js-btn-right").data("id", response.id);

			}
		}
	})
}

function upLeftDownRight(goodSandwich, badSandwich) {
	$.ajax({
		url: "/sandwiches/vote",
		type: "POST",
		data: {
			sandwich_good_id: goodSandwich,
			sandwich_bad_id: badSandwich
		},
		success: function() {
			getSandwich(badSandwich);
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
			getSandwich(badSandwich);
		},
		error: function() {

		}
	})
}
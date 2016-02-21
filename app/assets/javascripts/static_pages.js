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
		type: "POST",
		url: "/api/sandwiches/replace",
		success: function(response) {
			console.log(response)
			if (sandwichId == leftSandwich) {
				$(".left-sandwich-img").prop("src", response.sandwich_image.url);
				$(".js-btn-left").data("id", response.id);
			}
			else {
				$(".right-sandwich-img").prop("src", response.sandwich_image.url);
				$(".js-btn-right").data("id", response.id);

			}
		}
	})
}

function upLeftDownRight(goodSandwich, badSandwich) {
	$.ajax({
		url: "/api/sandwiches/vote",
		type: "POST",
		data: {
			sandwich_good_id: goodSandwich,
			sandwich_bad_id: badSandwich
		},
		success: function(response) {
			console.log(response)
			getSandwich(badSandwich);
		},
		error: function(err) {
			console.log(err)
		}
	})
}

function upRightDownLeft(goodSandwich, badSandwich) {
	$.ajax({
		url: "/api/sandwiches/vote",
		type: "POST",
		data: {
			sandwich_good_id: goodSandwich,
			sandwich_bad_id: badSandwich
		},
		success: function(response) {
			console.log(response)
			getSandwich(badSandwich);
		},
		error: function(err) {
			console.log(err)
		}
	})
}
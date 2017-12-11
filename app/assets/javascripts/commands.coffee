# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	if $("#lock}").text == "Locked"
		console.log "locked"
		$("#lock_div").parent.addClass("locked")
		$(".command").addClass('disabled')
	console.log "started"
	$(document).on 'touchstart click', ".command", (e) ->
		data = {"command": e.target.id}
		$(".command").addClass('disabled')
		$("#lock").text("Running...")
		$("#lock_div").addClass("locked")
		$.ajax
			url: "commands/1",
			method: "PATCH",
			dataType: "json",
			data: data
			error: (jqXHR, textStatus, errorThrown) ->
				$("#lock").text("Running...")
				#alert(textStatus)
				#$(".command").removeClass('disabled')
			success: (data, textStatus, jqXHR) ->
				#alert(textStatus)
				$("#lock").text("Ready")
				$("#lock_div").removeClass("locked")
				$(".command").removeClass('disabled')
		#alert(data)
		e.preventDefault()
	$(document).on 'touchstart click', "#lock", (e) ->
		data = {"command": "lock"}
		$.ajax
			url: "commands/1",
			method: "PATCH",
			dataType: "json",
			data: data
			error: (jqXHR, textStatus, errorThrown) ->
				$("#lock").text("Ready")
				$("#lock_div").removeClass("locked")
				$(".command").removeClass('disabled')
			success: (data, textStatus, jqXHR) ->
				$("#lock").text("Ready")
				$("#lock_div").removeClass("locked")
				$(".command").removeClass('disabled')
		#alert(data)
		e.preventDefault()
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

command = (e) ->
	data = {"command": e.target.id}
	$(".cmd").addClass('disabled')
	$("#lock").text("Running...")
	$("#lock_div").addClass("locked")
	$.ajax
		url: "commands/1",
		method: "PATCH",
		beforeSend: (xhr) ->
			xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
			return
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
			$(".cmd").removeClass('disabled')	
	
lock = (e) ->
	data = {"command": "lock"}
	$.ajax
		url: "commands/1",
		method: "PATCH",
		beforeSend: (xhr) ->
			xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
			return
		dataType: "json",
		data: data
		error: (jqXHR, textStatus, errorThrown) ->
			$("#lock").text("Ready")
			$("#lock_div").removeClass("locked")
			$(".cmd").removeClass('disabled')
		success: (data, textStatus, jqXHR) ->
			$("#lock").text("Ready")
			$("#lock_div").removeClass("locked")
			$(".cmd").removeClass('disabled')

$ ->
	console.log "loaded"
	console.log "started"
	$(".cmd").on "click", (e) ->
		command(e)
		e.preventDefault()
	$("#lock").on "click", (e) ->
		lock(e)
		e.preventDefault()
	if $("#lock}").text == "Locked"
		console.log "locked"
		$("#lock_div").parent.addClass("locked")
		$(".cmd").addClass('disabled')
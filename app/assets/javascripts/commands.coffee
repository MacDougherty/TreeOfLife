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
		success: (data, textStatus, jqXHR) ->
	
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
	App.alert = App.cable.subscriptions.create('CommandChannel',
		connected: ->
			# Called when the subscription is ready for use on the server
			return
		disconnected: ->
			# Called when the subscription has been terminated by the server
			return
		received: (data) ->
			console.log data
			$("#lock").text("Ready")
			$("#lock_div").removeClass("locked")
			$(".cmd").removeClass('disabled')
			# Called when there's incoming data on the websocket for this channel
			return
	)
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
	
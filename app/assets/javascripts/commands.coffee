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
	#alert(data)
	e.preventDefault()
	
	
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
	#alert(data)
	e.preventDefault()
	

$(document).ready ->
	flag = false
	console.log "loaded"
	if $("#lock}").text == "Locked"
		console.log "locked"
		$("#lock_div").parent.addClass("locked")
		$(".cmd").addClass('disabled')
	console.log "started"
	#$(".cmd").on 'click', (e) ->
	#	command(e)
	#	alert('command click')
	$(document).on 'click', ".cmd", (e) ->
		event.stopPropagation() 
		command(e)
		#alert('command click')
	$("#lock").click (e) ->
		lock(e)
		#alert("lock click")
	#$('.cmd').click (e) ->
	#	command(e)
	#$('#lock').click (e) ->
	#	lock(e)
	#$('#lock').bind 'touchend', (e) ->
	#	lock(e)
	#$(document).on 'click', ".cmd", (e) ->
	#	command(e)
	#$(document).on 'click', "#lock", (e) ->
	#	lock(e)
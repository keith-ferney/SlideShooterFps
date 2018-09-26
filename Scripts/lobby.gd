extends Control

func _on_host_pressed():
	gamestate.player_type = "server"
	get_tree().change_scene("Root.tscn")

func _on_join_pressed():
	# if get_node("connect/name").text == "":
	# 	get_node("connect/error_label").text = "Invalid name!"
	# 	return

	var ip = get_node("connect/ip").text
	if not ip.is_valid_ip_address():
		get_node("connect/error_label").text = "Invalid IPv4 address!"
		return

	get_node("connect/error_label").text=""
	get_node("connect/host").disabled = true
	get_node("connect/join").disabled = true

	# var player_name = get_node("connect/name").text
	gamestate.server_ip = ip
	gamestate.player_type = "client"
	get_tree().change_scene("Root.tscn")

# refresh_lobby() gets called by the player_list_changed signal
#
# func _on_connection_success():
# 	get_node("connect").hide()
# 	get_node("players").show()
#
# func _on_connection_failed():
# 	get_node("connect/host").disabled = false
# 	get_node("connect/join").disabled = false
# 	get_node("connect/error_label").set_text("Connection failed.")
#
# func _on_game_ended():
# 	show()
# 	get_node("connect").show()
# 	get_node("players").hide()
# 	get_node("connect/host").disabled = false
# 	get_node("connect/join").disabled
#
# func _on_game_error(errtxt):
# 	get_node("error").dialog_text = errtxt
# 	get_node("error").popup_centered_minsize()
#
# func refresh_lobby():
# 	var players = gamestate.get_player_list()
# 	players.sort()
# 	get_node("players/list").clear()
# 	get_node("players/list").add_item(gamestate.get_player_name() + " (You)")
# 	for p in players:
# 		get_node("players/list").add_item(p)
#
# 	get_node("players/start").disabled = not get_tree().is_network_server()
#
# func _on_start_pressed():
# 	gamestate.begin_game()

extends CanvasLayer
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	print("show_message")

func show_game_over():
	show_message("Game Over")
	# Espereu fins que el MessageTimer hagi acabat de comptar.
	yield($MessageTimer, "timeout")
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# Feu un temporitzador one-shot i espereu que acabi.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	print("update_score")
	
func _on_StartButton_pressed():
	#print("Start button pressed")
	$StartButton.hide()
	emit_signal("start_game")
	
func _on_MessageTimer_timeout():
	print("_on_MessageTime_timeout")
	$Message.hide()

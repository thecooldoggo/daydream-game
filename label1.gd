extends Label
func _on_area_2d_body_entered(body: Node2D) -> void:
	text = "Your bare feet are blackend by the soot"
	show()
func _on_area_2d_body_exited(body: Node2D) -> void:
	hide()


func _on_area_2_popup_body_entered(body: Node2D) -> void:
	text = "The Oasis"
	show()


func _on_area_2_popup_body_exited(body: Node2D) -> void:
	hide()


func _on_flower_popup_body_entered(body: Node2D) -> void:
	show()


func _on_flower_popup_body_exited(body: Node2D) -> void:
	hide()

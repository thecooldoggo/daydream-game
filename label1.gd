extends Label
func _on_area_2d_body_entered(body: Node2D) -> void:
	text = "Welcome to the slums..."
	show()
func _on_area_2d_body_exited(body: Node2D) -> void:
	hide()

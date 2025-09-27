extends Label
func _on_area_2d_body_entered(body: Node2D) -> void:
	text = "You find yourself in a lifeless world"
	show()
func _on_area_2d_body_exited(body: Node2D) -> void:
	hide()


func _on_area_2_popup_body_entered(body: Node2D) -> void:
	text = "Concrete Jungle"
	show()


func _on_area_2_popup_body_exited(body: Node2D) -> void:
	hide()


func _on_flower_popup_body_entered(body: Node2D) -> void:
	show()


func _on_flower_popup_body_exited(body: Node2D) -> void:
	hide()

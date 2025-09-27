extends Panel

@onready var item_icon = $ItemIcon
const ITEM_TEXTURES = {
	"key": preload("res://WaterPotion.webp"),
	"potion": preload("res://WaterPotion.webp")
}
func update_display(item_name: String):
	if item_name in ITEM_TEXTURES:
		item_icon.texture = ITEM_TEXTURES[item_name]
		item_icon.visible = true
	else:
		item_icon.texture = null
		item_icon.visible = false

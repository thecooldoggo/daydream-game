extends Node

signal inventory_changed
var inventory = [null, null, null, null]

func add_item(item_name: String) -> bool:
	for i in range(inventory.size()):
		if inventory[i] == null:
			inventory[i] = item_name
			inventory_changed.emit() # let ui know
			print("Added ", item_name, " to slot ", i)
			return true

	print("Inventory full")
	return false

# vs remove item
func remove_item(slot_index: int):
	if slot_index >= 0 and slot_index < inventory.size():
		inventory[slot_index] = null
		inventory_changed.emit()

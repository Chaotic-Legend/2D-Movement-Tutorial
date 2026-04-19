extends Control

@onready var count_label: Label = $CountLabel

var coin_count: int = 0

func _enter_tree() -> void:
	EventHandler.on_collected.connect(increase_coin_count)

func _exit_tree() -> void:
	EventHandler.on_collected.disconnect(increase_coin_count)

func increase_coin_count() -> void:
	coin_count += 1
	count_label.text = str(coin_count)

extends Node2D

@onready var damage_timer: Timer = $Timer
var bodies_inside: Array = []

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "AnimatedPlayer":
		if not bodies_inside.has(body):
			bodies_inside.append(body)
			EventHandler.on_player_take_damage.emit(1)

		if bodies_inside.size() == 1:
			damage_timer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if bodies_inside.has(body):
		bodies_inside.erase(body)
	if bodies_inside.is_empty():
		damage_timer.stop()

func _on_timer_timeout():
	for body in bodies_inside.duplicate():
		if not is_instance_valid(body):
			bodies_inside.erase(body)
			continue
		if body.name == "AnimatedPlayer":
			EventHandler.on_player_take_damage.emit(1)

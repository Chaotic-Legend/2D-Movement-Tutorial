extends ProgressBar

@export var start_hp: int = 10
@export var full_hp_color: Color
@export var empty_hp_color: Color

var stylebox: StyleBoxFlat

func _enter_tree() -> void:
	EventHandler.on_player_take_damage.connect(take_damage)

func _exit_tree() -> void:
	EventHandler.on_player_take_damage.disconnect(take_damage)

func _ready() -> void:
	stylebox = get_theme_stylebox("fill").duplicate() ## Default stylebox type is StyleBoxFlat
	add_theme_stylebox_override("fill", stylebox)

	max_value = start_hp
	value = start_hp
	update_hp_bar()

func take_damage(damage: int) -> void:
	value -= damage

	if value <= 0:
		get_tree().call_deferred("reload_current_scene")

	update_hp_bar()

func update_hp_bar() -> void:
	if max_value:
		stylebox.bg_color = lerp(empty_hp_color, full_hp_color, value / max_value)

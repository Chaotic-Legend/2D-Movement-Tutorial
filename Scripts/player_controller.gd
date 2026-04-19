class_name PlayerController
extends CharacterBody2D

@export var walk_speed = 150.0
@export var run_speed = 250.0
@export_range(0, 1) var acceleration = 0.1
@export_range(0, 1) var deceleration = 0.1
@export var jump_force = -400.0
@export_range(0, 1) var decelerate_on_jump_release = 0.5

@export var dash_speed = 1000.0
@export var dash_max_distance = 300.0
@export var dash_curve: Curve
@export var dash_cooldown = 1.0
@export var ui_dash_cooldown: UIAbilityCooldown
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_attacking = false
var is_dashing = false
var dash_start_position = 0
var dash_direction = 0

func _physics_process(delta):
	if !delta:
		return

	# Adds the gravity to the character.
	if not is_on_floor():
		velocity.y += gravity * delta
	var speed
	if Input.is_action_pressed("run"):
		speed = run_speed
	else:
		speed = walk_speed
		
	# Handles the attack input.
	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true
		velocity.x = 0
		if animated_sprite:
			animated_sprite.play("Attack")
			animated_sprite.frame = 0

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		if not is_attacking:
			velocity.x = move_toward(velocity.x, direction * speed, speed * acceleration)
		else:
			velocity.x = 0
		animated_sprite.flip_h = direction == -1
		if is_on_floor() and not is_attacking:
			if Input.is_action_pressed("run"):
				animated_sprite.play("Run")
			else:
				animated_sprite.play("Walk")
	else:
		if not is_attacking:
			velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)
			if is_on_floor():
				animated_sprite.play("Idle")

	# Handles jumping input and applies vertical movement.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall()):
		velocity.y = jump_force
	
		# Restarts the jump animation each time.
		if animated_sprite:
			animated_sprite.play("Jump")
			animated_sprite.frame = 0
 
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release

	# Activates the dash ability.
	if Input.is_action_just_pressed("dash") and direction and not is_dashing and not ui_dash_cooldown.is_on_cooldown():
		is_dashing = true
		dash_start_position = position.x
		dash_direction = direction
		animated_sprite.play("Dash")
		ui_dash_cooldown.set_cooldown(dash_cooldown)

	# Executes the dash movement.
	if is_dashing:
		var current_distance = abs(position.x - dash_start_position)
		if current_distance >= dash_max_distance or is_on_wall():
			is_dashing = false
		else:
			velocity.x = dash_direction * dash_speed * dash_curve.sample(current_distance / dash_max_distance)
			velocity.y = 0
	move_and_slide()

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "Attack":
		is_attacking = false
		if is_on_floor():
			animated_sprite.play("Idle")

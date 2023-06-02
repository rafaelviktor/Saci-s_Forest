extends KinematicBody2D

var velocity = Vector2.ZERO
var movespeed = 200
var gravity = 400
var jumpforce = -180

func _physics_process(delta: float) -> void:
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y += gravity * delta
	if Input.is_action_pressed("jump"):
		velocity.y = jumpforce
	
	velocity.x = movespeed * move_direction
	
	move_and_slide(velocity)

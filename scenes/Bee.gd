extends KinematicBody2D

export var speed = 64
export var health = 1
var velocity = Vector2.ZERO
var move_direction = -1

func _physics_process(delta) -> void:
	velocity.x = speed * move_direction
	
	velocity = move_and_slide(velocity)

	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
		
	if $ray_wall.is_colliding():
		$texture.flip_h != $texture.flip_h
		$ray_wall.scale.x *= -1
		move_direction *= -1
		


func _on_HitBox_body_entered(body):
	queue_free()

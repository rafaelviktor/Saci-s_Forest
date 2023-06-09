extends KinematicBody2D

export var speed = 64
export var health = 1
var velocity = Vector2.ZERO
var move_direction = -1
var hitted = false

func _physics_process(delta) -> void:
	velocity.x = speed * move_direction
	
	set_animation()
	
	velocity = move_and_slide(velocity)

	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
		
	if $ray_wall.is_colliding():
		$texture.flip_h != $texture.flip_h
		$ray_wall.scale.x *= -1
		move_direction *= -1
		

func set_animation():
	var anim = "fly"
	
	if hitted:
		anim = "hit"
	
	if $animation.assigned_animation != anim:
		$animation.play(anim)

func _on_HitBox_body_entered(body):
	hitted = true
	health -= 1
	body.velocity.y -= 200
	yield(get_tree().create_timer(0.5), "timeout")
	hitted = false
	if health < 1:
		queue_free()

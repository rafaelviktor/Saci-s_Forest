extends Area2D

func _on_FallZone_body_entered(body) -> void:
	get_tree().reload_current_scene()

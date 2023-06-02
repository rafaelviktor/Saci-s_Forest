extends CanvasLayer

onready var animador = get_node("AnimationPlayer")

func _ready():
	animador.queue("Dissolve")





func _on_animation_finished(anim_name):
	if anim_name == "Dissolve":
		get_tree().change_scene("res://menu.tscn")

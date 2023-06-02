extends CanvasLayer

onready var animador = get_node("AnimationPlayer")
onready var audio1 : AudioStreamPlayer = $AudioStreamPlayer1
onready var audio2 : AudioStreamPlayer = $AudioStreamPlayer2
var sounds = [preload("res://assets/audio/nature-sounds.ogg"), preload("res://assets/audio/Trickling Up - Godmode.mp3")]

func _ready():
	_play_sound_nature(0)
	_play_sound_track(1)
	animador.queue("fade_in")
	animador.queue("logo")

func _on_BtnComecar_pressed():
	animador.queue("fade_out")

func _on_BtnSair_pressed():
	get_tree().quit()

func _on_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene("res://levels/Level_01.tscn")
		
func _play_sound_nature(id_sound) -> void:
	audio1.stream = sounds[id_sound]
	audio1.play()

func _play_sound_track(id_sound) -> void:
	audio2.stream = sounds[id_sound]
	audio2.play()

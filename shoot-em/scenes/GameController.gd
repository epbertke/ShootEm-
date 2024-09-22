class_name GameController extends Node
@export var txtScore : Label
@export var score = 0

func _ready():
	txtScore = get_node("/root/World/txtScore")

func increment_score():
	score += 1

func _on_score_timer_timeout():
	txtScore.text = str(score)

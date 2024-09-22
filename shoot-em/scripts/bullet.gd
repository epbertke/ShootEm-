class_name Bullet extends Area2D
@export var speed = 800
@export var controller : GameController

func _ready():
	controller = get_node("/root/World/GameController")

func _physics_process(delta):
	global_position.y += -speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	#takes care of bullets that miss the target
	queue_free()

func _on_area_entered(area) :
	controller.increment_score()
	if area is Enemy:
		area.die()
		queue_free()
		

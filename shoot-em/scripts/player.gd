class_name Player extends CharacterBody2D
signal bullet_shot(bullet_scene, location)
@export var speed = 400
@onready var shoot_point = $ShooterPoint
var bullet = preload("res://scenes/bullet.tscn")
var bullet_scene

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
			
func _physics_process(delta):
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	velocity = direction *  speed
	move_and_slide()
	
func shoot():
	bullet_scene  = $"Bullet"
	var bullet_instance = bullet.instantiate()
	add_child(bullet_instance)
	bullet_shot.emit(bullet_scene, shoot_point.global_position)
	
func die():
	queue_free()

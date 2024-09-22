extends Node2D
var rand_x : float
var enemy = preload("res://scenes/enemy.tscn")

func choose_rand_spawn_pos():
	rand_x = randi() % (get_viewport().size.x + 1)
	return Vector2(rand_x, 0.0)

func _on_spawn_timer_timeout():
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.global_position = choose_rand_spawn_pos()
	

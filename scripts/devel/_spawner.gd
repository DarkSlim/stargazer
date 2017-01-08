extends Node2D

export(PackedScene) var star

export var testing = true


func _ready():
	pass

func spawn_star():
	var spawners = get_tree().get_nodes_in_group('spawner-area')
	if spawners.size() > 0:
		if Pool.has_objects('stars'):
			spawners[0].spawn_random(Pool.get_object('stars'))
		else:
			spawners[0].spawn_random(star.instance())

func _on_Timer_timeout():
	if testing:
		spawn_star()

func _on_BalloonBody_explode():
	get_node("AnimationPlayer").play("died")

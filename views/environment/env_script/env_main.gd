extends Node2D

var spawner_lemon
var spawner_apple

# Called when the node enters the scene tree for the first time.
func _ready():
	spawner_lemon = get_node("EnvSpawnerLemon")
	spawner_lemon.init(1)
	
	spawner_apple = get_node("EnvSpawnerApple")
	spawner_apple.init(2)
	
	spawn_lemon()
	spawn_apple()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawner_lemon.is_empty:
		print("Spawning Lemon")
		spawn_lemon()
	if spawner_apple.is_empty:
		print("Spawning Apple")
		spawn_apple()
	pass

func spawn_lemon():
	spawner_lemon.create_item_instance()

func spawn_apple():
	spawner_apple.create_item_instance()

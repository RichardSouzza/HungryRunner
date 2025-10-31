extends Node2D

@onready var chunk_scene = preload("res://scenes/Chunk/chunk.tscn")
@export var chunk_width := 151 * 16 # tile size * chunk length
@export var initial_chunks := 3
@export var player_path := NodePath("Player")

var last_chunk_end_x := 0
var player: Node2D

func _ready():
    player = get_node(player_path)
    for i in range(initial_chunks):
        add_chunk()

func _process(_delta):
    if player.position.x > last_chunk_end_x - (chunk_width * 2):
        add_chunk()

func add_chunk():
    var chunk = chunk_scene.instantiate()
    add_child(chunk)
    chunk.position.x = last_chunk_end_x
    last_chunk_end_x += chunk_width

    for c in get_children():
        if c.position.x < player.position.x - (chunk_width * 3):
            c.queue_free()

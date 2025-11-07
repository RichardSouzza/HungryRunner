extends Node2D

@onready var chunk_scene = preload("res://scenes/world.tscn")
@export var chunk_width := 100 * 16 # tile size * chunk length
@export var initial_chunks := 3
@export var player_path := NodePath("Player/CharacterBody2D")

var last_chunk_end_x := 0
var player: Node2D

func _ready():
    player = get_node(player_path)
    for i in range(initial_chunks):
        add_chunk()

func _process(_delta):
        add_chunk()

func add_chunk():
    pass

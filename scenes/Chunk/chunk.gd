extends TileMapLayer

@export var chunk_length := 26
@export var ground_y := 0

var atlas_tiles = [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0)]

func _ready():
    generate_ground()

func generate_ground():
    for tile in range(chunk_length):
        var atlas_coord = atlas_tiles[randi() % atlas_tiles.size()]
        set_cell(Vector2i(tile, ground_y), 0, atlas_coord)

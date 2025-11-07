extends CharacterBody2D

@onready var animation = $AnimatedSprite2D

var RUN_SPEED = 400
var JUMP_SPEED = -800
var GRAVITY = 2600

func _physics_process(delta):
    move_and_slide()
    if not is_on_floor():
        animation.play("jump")
        velocity.y += GRAVITY * delta
    else:
        animation.play("run")

    get_input()

func get_input():
    velocity.x = 0

    if Input.is_action_just_pressed("jump"):
        if is_on_floor():
            velocity.y = JUMP_SPEED

    velocity.x = RUN_SPEED

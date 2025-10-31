extends CharacterBody2D

var run_speed = 350
var jump_speed = -1000

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_input():
    velocity.x = 0
    var jump = Input.is_action_just_pressed('jump')

    if is_on_floor() and jump:
        $AnimatedSprite2D.animation = "jump"
        velocity.y = jump_speed

    velocity.x = run_speed

func _physics_process(delta):
    velocity.y += gravity * delta
    get_input()
    move_and_slide()

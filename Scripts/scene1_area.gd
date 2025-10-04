extends Node2D

@export var speed = 1.0 # How fast the player will move (pixels/frame).
var screen_size # Size of the game window.

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var localSpeed = speed / delta
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * localSpeed
		$Player.move_and_collide(velocity)

func _on_mac_guffin_1_body_entered(body: Node2D) -> void:
	# TODO: Add functionality to "collect" this.
	# TODO: How to access special abilities? What special abilities?
	$MacGuffin1.hide()
	$MacGuffin1/MacGuffin1CollisionBody.set_deferred("disabled", true)
	print_debug("Found MacGuffin1")

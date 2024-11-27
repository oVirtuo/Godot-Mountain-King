extends ParallaxLayer

@export var scroll_speed: float = 200.0
@export var boosted_speed_multiplier: float = 3.0
@export var image_width: float = 1920.0

var current_speed: float

func _ready() -> void:
	current_speed = scroll_speed

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		current_speed = scroll_speed * boosted_speed_multiplier
	else:
		current_speed = scroll_speed

	for sprite in get_children():
		sprite.position.x -= current_speed * delta

		if sprite.position.x <= -image_width:
			sprite.position.x += image_width * 2

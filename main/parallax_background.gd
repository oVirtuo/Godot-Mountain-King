extends Node2D

@export var scroll_speed: float = 100.0
@export var image_width: float = 1024.0 # Largura da imagem

func _process(delta: float) -> void:
	for layer in $ParallaxBackground.get_children():
		if layer is ParallaxLayer:
			for sprite in layer.get_children():
				if sprite is Sprite2D:
					sprite.position.x -= scroll_speed * delta
					# Reposiciona quando sai da tela
					if sprite.position.x < -image_width:
						sprite.position.x += image_width * 2

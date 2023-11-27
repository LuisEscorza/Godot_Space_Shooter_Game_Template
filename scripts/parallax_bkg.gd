extends ParallaxBackground

@export var speed: float


func _process(delta):
	scroll_offset.y += speed * delta

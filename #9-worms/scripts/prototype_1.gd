extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

var image : Image
var texture : ImageTexture
var bitmap : BitMap

func _ready() -> void:
	texture = ImageTexture.create_from_image(sprite_2d.texture.get_image())
	image = texture.get_image()	
	update_bitmap_collision()

func update_bitmap_collision():
	bitmap = BitMap.new()
	bitmap.create_from_image_alpha(image, 0.1)
	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, image.get_size()))
	
	if polygons.size() > 0:
		collision_polygon_2d.polygon = polygons[0]
	else:
		collision_polygon_2d.polygon = PackedVector2Array()

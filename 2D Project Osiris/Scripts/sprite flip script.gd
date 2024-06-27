#flips sprite when moving left or right
	var sprite_2d = $Sprite2D
	if direction > 0: 
		sprite_2d.flip_h = false 
	elif direction < 0: 
		sprite_2d.flip_h = true

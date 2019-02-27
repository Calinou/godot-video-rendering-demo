extends Camera

func _ready() -> void:
	if OS.has_feature("standalone"):
		get_viewport().msaa = Viewport.MSAA_2X
		get_viewport().size *= 4
		var directory: = Directory.new()
		directory.make_dir("user://render")

func _process(delta: float) -> void:
	if OS.has_feature("standalone"):
		# The first frame is always black, there's no point in saving it
		if Engine.get_frames_drawn() == 0:
			return

		print(
				"Rendering frame {frame}...".format({
					frame = Engine.get_frames_drawn(),
				})
		)
		get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)

		var image := get_viewport().get_texture().get_data()
		image.generate_mipmaps()
		image.resize(
				get_viewport().size.x / 4,
				get_viewport().size.y / 4,
				Image.INTERPOLATE_TRILINEAR
		)

		# The viewport must be flipped to match the rendered window
		image.flip_y()

		var error := image.save_png("user://render/" + str(Engine.get_frames_drawn()) + ".png")

func _on_animation_player_animation_finished(anim_name: String) -> void:
	get_tree().quit()

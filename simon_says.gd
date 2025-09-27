extends TileMapLayer

const size = 5
@onready var pos
@onready var can_check = false
@onready var chk_idx = 0
@onready var correct_count = 0
@onready var wrong_count = 0

func create(n):
	
	# choose n random positions on the layer
	pos = range(size*size)
	pos.shuffle()
	pos = pos.slice(0,n)
	print(pos)
	
	# put the tiles in randomly generated position
	for i in range(n):
		var co_ords = Vector2i(pos[i]%size,pos[i]/size)
		print(co_ords)
		$AudioStreamPlayer.play()
		set_cell(co_ords,1,Vector2i(0,0))
		await $AudioStreamPlayer.finished
		
	print("---")
	
	start_check()

func _input(event: InputEvent) -> void:
	if can_check and event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_local_mouse_position() #get_viewport().get_mouse_position()
		var click_co_ords = local_to_map(mouse_pos)
		print(click_co_ords)
		print(pos[chk_idx])
		if pos[chk_idx] == click_co_ords.x + click_co_ords.y*size :
			print("correct")
			correct_count += 1
			$correct_count.text = str(correct_count)
		else :
			print("wrong")
			wrong_count += 1
			$wrong_count.text = str(wrong_count)
		chk_idx+=1
		if chk_idx >= pos.size() :
			can_check = false

func start_check():
	chk_idx = 0
	can_check = true

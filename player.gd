extends CharacterBody2D
var leaf_count = 0
func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide();


func _on_pickup_area_area_entered(area: Area2D):
	if area.is_in_group("leaf") and not $heldLeaf.visible:
		area.queue_free() # Replace with function body.
		$heldLeaf.visible = true
	if area.is_in_group("basket") and $heldLeaf.visible:
		$heldLeaf.visible = false
		leaf_count +=1
		$CanvasLayer/leafcount.text = "leaves: " +str(leaf_count)

draw_self();
draw_set_color(c_white);

if instance_exists(o_Player){
	if o_Player.DEBUG_MODE {
		if instance_exists(self){
			if point_distance(x,y, o_Player.x, o_Player.y) < 250 {
				draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true);
			} else {
				draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_green,c_green,c_green,c_green,true);
			}

			draw_text(x, y-40,string(id));
			draw_text(x, y-80, string(state));
			draw_text(x, y-100, "X= "+ string(x)+ " Y= " + string(y));
		}
	}


if o_Player.HP_ENABLED {
	var x_offset;
	var temp_offset = 50;

	if temp_offset * image_xscale < 0 {
		x_offset = temp_offset * image_xscale;
	} else {
		x_offset = temp_offset+100 * image_xscale;
	}

	//var x_offset = 50 * image_xscale;
	var entity_line_offset = 25 * image_xscale;
	var height = sprite_height;

	var _hp_width = 100;
	var hp_width = max_hp;

	draw_hp = lerp(draw_hp, hp, 1);
	draw_max_hp = max_hp;
	var hp_percent = draw_hp / draw_max_hp;

	draw_red_hp = lerp(draw_red_hp, hp, 0.05);
	draw_red_max_hp = draw_max_hp;
	var red_hp_percent = draw_red_hp / draw_red_max_hp;

	if entity_line_offset < 0 {
		draw_line_width_colour(x-(x_offset-entity_line_offset), y-23 , x-x_offset, y-(height-2), 1, c_black, c_black);
	} else {
		draw_line_width_colour(x-(entity_line_offset), y-23 , (x-x_offset)+100, y-(height-2), 1, c_black, c_black);
	}

	//hp bar
	draw_rectangle_color(x-x_offset, y-height, x-x_offset + (_hp_width * red_hp_percent), y-(height-2), c_red, c_red, c_red, c_red, false);
	draw_rectangle_color(x-x_offset,  y-height, (x-x_offset) + _hp_width, y-(height-2), c_black, c_black, c_black, c_black, true);
	draw_rectangle_color(x-x_offset, y-height, x-x_offset + (_hp_width * hp_percent), y-(height-2), c_white, c_white, c_white, c_white, false);
	draw_text(x-x_offset, y-(height-2),string(hp));
}


if is_drawing && within_jce_range {
    var half_length = random_length / 2; // Calculate half the length
    var start_x = x - lengthdir_x(half_length, random_angle); // Calculate start point x
    var start_y = (y-23) - lengthdir_y(half_length, random_angle); // Calculate start point y
    var end_x = x + lengthdir_x(half_length, random_angle); // Calculate end point x
    var end_y = y + lengthdir_y(half_length, random_angle); // Calculate end point y


    draw_self();

    var outline_thickness = 2;

    draw_line_width_color(start_x, start_y, end_x, end_y, outline_thickness+2, c_black, c_black);
    draw_line_width_color(start_x, start_y, end_x, end_y, outline_thickness, c_white, c_white); // Adjust line color as needed // Adjust line width and color as needed

    //draw_line_width_color(o_Player.x+start_x, o_Player.y +start_y, end_x, end_y, 2, c_white, c_white);
    // Connect lines between nearby instances of the same object type
    // with (all) { // Replace with the actual object name
    //     if (id == o_knight.id) { // Ensure it's not checking against itself 
    //         var other_half_length = other.random_length / 2;
    //         var other_start_x = other.x - lengthdir_x(other_half_length, other.random_angle);
    //         var other_start_y = (other.y-23) - lengthdir_y(other_half_length, other.random_angle);
    //         var other_end_x = other.x + lengthdir_x(other_half_length, other.random_angle);
    //         var other_end_y = other.y + lengthdir_y(other_half_length, other.random_angle);

    //         // Check if lines are close enough to connect
    //         if (point_distance(end_x, end_y, other_start_x, other_start_y) < 20) {
    //             draw_line_width_color(end_x, end_y, other_start_x, other_start_y, 2, c_white, c_white);
    //         } else if (point_distance(end_x, end_y, other_end_x, other_end_y) < 20) {
    //             draw_line_width_color(end_x, end_y, other_end_x, other_end_y, 2, c_white, c_white);
    //         }
    //     }
    // }
	}


}







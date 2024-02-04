

if(surface_exists(surface_mirror) == false){
	surface_mirror = surface_create(surface_width, surface_height);
}


var pos_x = camera_get_view_x(camera);
var pos_y = camera_get_view_y(camera);


surface_copy_part(
	surface_mirror, 0, 0,
	application_surface, x - pos_x, y - pos_y,
	surface_width, surface_height
);

surface_set_target(surface_mirror);
	draw_set_color(c_red);
	draw_set_alpha(0.3);
	draw_rectangle(0, surface_height, surface_width, surface_height - 8, false);
surface_reset_target();


draw_set_color(c_white);
draw_set_alpha(1);

draw_surface_ext(surface_mirror,x,y + (surface_height * 2),1,-1,0,c_white,0.0);
	
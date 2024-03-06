//death draw
// draw_text(x, y-100, string(self.id))
var offset = 23
if o_Player.DEBUG_MODE {
	if o_Player.input.hold_l_key && point_distance(x, y, o_Player.x, o_Player.y) <= o_Player.jce_range {
		draw_line_width_colour(x, y-offset, o_Player.x, o_Player.y-offset, 1, c_white, c_white)
	}
}


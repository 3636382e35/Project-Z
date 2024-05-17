event_inherited();
image_xscale = -1;
type = "enemy";
name = "knight_mob";

// hp = global.knight_hp;
hp = 100;

draw_hp = 0;
draw_max_hp = hp;
max_hp = hp;

draw_red_hp = 100;
draw_red_max_hp = hp;

_id = self;

vspeed = 0;
hspeed = 0;
invincibility = false;
move_speed = 0;
jump = -10; // Adjusted for a higher jump
grv = 0.2; // Adjusted for higher gravity
vsp_max = 10;
jump_mod = 1.6
on_ground = 1;
on_air = 0;

state = "idle";
attack_range = 42;
chase_speed = 2;

exp_val = 50;

within_jce_range = false;

randomize();
is_drawing = false;
line_length = 1000000; // Adjust the length of the lines as needed //default = 1000000
random_angle = irandom(360); // Generate a random angle
random_length = irandom_range(20, line_length); // Randomize the length within a range

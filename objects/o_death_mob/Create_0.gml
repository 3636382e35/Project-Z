event_inherited();
state = "idle";

hp = 1500;

draw_hp = 0;
draw_max_hp = hp;
max_hp = hp;

draw_red_hp = max_hp;
draw_red_max_hp = hp;

within_jce_range = false;

state = "idle";
attack_range = 200;
chase_speed = 2;

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


exp_val = 50;

can_attack = true;

randomize();
is_drawing = false;
line_length = 1000000; // Adjust the length of the lines as needed
random_angle = irandom(360); // Generate a random angle
random_length = irandom_range(20, line_length); // Randomize the length within a range

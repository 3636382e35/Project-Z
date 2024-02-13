if (shader = 1) {
  shader_set(sh_aberration);
  shader_set_uniform_f(dis_u, dis);
}
draw_background(b_back, x, y);
shader_reset();

draw_text(16, 16, string_hash_to_newline(str));


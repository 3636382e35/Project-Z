dis += (keyboard_check(vk_right)-keyboard_check(vk_left))/10;

if (keyboard_check_released(vk_space)) {
  shader = !shader;
}


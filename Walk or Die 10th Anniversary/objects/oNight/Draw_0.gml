/// @description Insert description here
// You can write your code in this editor

/*
draw_self();
gpu_set_blendmode_ext(bm_zero, bm_src_color);
gpu_set_blendmode(bm_normal);
*/

draw_self();
//multiply
gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
//gpu_set_blendmode_ext(bm_zero, bm_src_color);

gpu_set_blendmode(bm_normal);

var Farthest = layer_get_id("Backgrounds_1");
var SecondFarthest = layer_get_id("Backgrounds_2");
var ThirdFarthest = layer_get_id("Backgrounds_3");
var FourthFarthest = layer_get_id("Backgrounds_4");
var FifthFarthest = layer_get_id("Backgrounds_5");
var SixthFarthest = layer_get_id("Backgrounds_6");

layer_x(Farthest,          lerp(0, camera_get_view_x(view_camera[0]), -0.05)   );
layer_x(SecondFarthest,    lerp(0, camera_get_view_x(view_camera[0]), -0.1)   );
layer_x(ThirdFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.125)   );
layer_x(FourthFarthest,    lerp(0, camera_get_view_x(view_camera[0]), -0.15)   );
layer_x(FifthFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.2)   );
layer_x(SixthFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.25)   );

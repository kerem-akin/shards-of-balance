
var Farthest = layer_get_id("Backgrounds_1");
var SecondFarthest = layer_get_id("Backgrounds_2");
var ThirdFarthest = layer_get_id("Backgrounds_3");
var FourthFarthest = layer_get_id("Backgrounds_4");

layer_x(Farthest,          lerp(0, camera_get_view_x(view_camera[0]), -0)   );
layer_x(SecondFarthest,    lerp(0, camera_get_view_x(view_camera[0]), -0.036)   );
layer_x(ThirdFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.096)   );
layer_x(FourthFarthest,    lerp(0, camera_get_view_x(view_camera[0]), -0.168)   );
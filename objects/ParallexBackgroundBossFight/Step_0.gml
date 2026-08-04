
// Set the variables for the different layers for the parallex backgrounds, assigning a layerfor each
var Farthest = layer_get_id("Backgrounds_1");
var SecondFarthest = layer_get_id("Backgrounds_2");
var ThirdFarthest = layer_get_id("Backgrounds_3");
var FourthFarthest = layer_get_id("Backgrounds_4");
var FifthFarthest = layer_get_id("Backgrounds_5");
var SixthFarthest = layer_get_id("Backgrounds_6");
var SeventhFarthest = layer_get_id("Backgrounds_7");
var EightFarthest = layer_get_id("Backgrounds_8");

// Set the speed in which each of these layers move to achieve the parallax effect
layer_x(Farthest,          lerp(0, camera_get_view_x(view_camera[0]), -0)   );
layer_x(SecondFarthest,    lerp(0, camera_get_view_x(view_camera[0]), -0.024)   );
layer_x(ThirdFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.064)   );
layer_x(FourthFarthest,    lerp(0, camera_get_view_x(view_camera[0]), -0.112)   );
layer_x(FifthFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.24)   );
layer_x(SixthFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.29)   );
layer_x(SeventhFarthest,   lerp(0, camera_get_view_x(view_camera[0]), -0.4)   );
layer_x(EightFarthest,     lerp(0, camera_get_view_x(view_camera[0]), -0.5)   );

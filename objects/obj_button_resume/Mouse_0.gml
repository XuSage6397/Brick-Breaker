/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 59FAF4CF
/// @DnDArgument : "value" "false"
/// @DnDArgument : "var" "global.paused"
global.paused = false;

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 4BB51A74
/// @DnDArgument : "obj" "obj_menu_pause"
/// @DnDSaveInfo : "obj" "obj_menu_pause"
var l4BB51A74_0 = false;
l4BB51A74_0 = instance_exists(obj_menu_pause);
if(l4BB51A74_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 0ACC92FD
	/// @DnDApplyTo : {obj_menu_pause}
	/// @DnDParent : 4BB51A74
	with(obj_menu_pause) instance_destroy();
}

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 3BC9BE96
/// @DnDArgument : "obj" "obj_button_menu"
/// @DnDSaveInfo : "obj" "obj_button_menu"
var l3BC9BE96_0 = false;
l3BC9BE96_0 = instance_exists(obj_button_menu);
if(l3BC9BE96_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 3E590B45
	/// @DnDApplyTo : {obj_button_menu}
	/// @DnDParent : 3BC9BE96
	with(obj_button_menu) instance_destroy();
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 4F34FF31
instance_destroy();
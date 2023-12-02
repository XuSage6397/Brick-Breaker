// Set the large bat powerup timer to zero because we don't want it to start active
large_bat_timer = 0;

// We want to check whether the player is moving their mouse so that we can more let them more
// efficiently switch between using the mouse and the arrow key, so we track its previous position
_prev_mouse_x = 0;

// We also don't want the bat to play its animation regularly so we randomise when it happens
image_speed = 0;

var _flash_timer = floor(random_range(60, 180 + 1));

alarm_set(0, _flash_timer);
// Once the flash animation has been played, we want to randomise when the next flash will be
image_speed = 0;

image_index = 0;

var _flash_timer = floor(random_range(60, 180));

alarm_set(0, _flash_timer);
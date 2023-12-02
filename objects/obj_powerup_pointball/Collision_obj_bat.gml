// This popup adds 500 points to the player's score and creates a popup to convey that info
score += 500;

instance_create_layer(other.x, other.y - 80, "Instances", obj_popup);

// Then it plays a sound and destroys itself
event_inherited();
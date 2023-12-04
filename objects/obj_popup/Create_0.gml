// We want to create a popup to show that the player has got 500 points when the points
// powerup hits the bat and we want it to rise from the point of impact.

// First, we create the message we will show to the player (this can also be changed after
// the popup is instantiated to show other messages) 
popup = "+500";

// We set its vertical speed to make it move upwards
vspeed = -1;

// And then we set an alarm for an event that will destroy the popup
alarm[0] = 20;
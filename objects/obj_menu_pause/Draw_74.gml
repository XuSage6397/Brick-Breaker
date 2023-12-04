//This is a poor way to handle GUI rendering. If we transform the GUI layer at all, it will create a mismatch
//between the visual representation of objects (such as buttons and sliders) and where they actually are.
//This would lead to players clicking where the game draws the button but the actual button is elsewhere.
//It's fine here because we are only doing simple GUI effects
draw_self();
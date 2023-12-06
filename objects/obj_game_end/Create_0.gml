/// @description Insert description here
// You can write your code in this editor
highscore_load()

score = global.old_score

if (score < global.highscore) {
	_highscore = "Old " + string(global.highscore)
} else {
	global.highscore = score
	highscore_save()
	_highscore = "New " + string(global.highscore)
}







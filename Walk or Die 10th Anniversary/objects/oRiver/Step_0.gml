event_inherited();

// Play sound on emitter.
if (!sndPlaying) {
	audio_play_sound_on(sndEmit, sndRiver, true, 1);
	sndPlaying = true;
}

// Allow to be destroyed once sound is out of earshot.
if (distance_to_object(oPlayer) > sndMaxDist) {
	canDestroy = true;
}

// Move the emitter with the river.
audio_emitter_position(sndEmit, x, y, 0);
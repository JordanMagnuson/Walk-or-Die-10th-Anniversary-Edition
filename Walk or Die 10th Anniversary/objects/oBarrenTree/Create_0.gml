event_inherited()

sprite_index = choose(sprBarrenTree01, sprBarrenTree02, sprBarrenTree03);
type = oBarrenTree;
Item(sprite_index, "mid", true);

barrenTreeEmitter = audio_emitter_create();
counter = 0;
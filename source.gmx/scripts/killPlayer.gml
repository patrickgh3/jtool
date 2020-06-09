if instance_exists(oPlayer) and global.deathEnabled {
    audio_play_sound(sndDeath, 0, 0);
    oDeathDisplay.death_count += 1;
    with oPlayer {
        repeat(irandom_range(32, 96)) { instance_create(x, y, oPlayerBlood); }
        instance_destroy();
    }
}

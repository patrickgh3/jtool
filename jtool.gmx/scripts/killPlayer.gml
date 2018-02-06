if instance_exists(oPlayer) and global.deathEnabled {
    audio_play_sound(global.DeathAudio,0,0)
    oDeathDisplay.death_count += 1
    with oPlayer {
        instance_create(x, y, oPlayerBloodEmitter);
        instance_destroy()
    }
}

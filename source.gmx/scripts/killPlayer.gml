if instance_exists(oPlayer) and global.deathEnabled {
    oDeathDisplay.death_count += 1;
    with oPlayer {
        repeat(irandom_range(32, 96)) { instance_create(x, y, oPlayerBlood); }
        instance_destroy();
    }
}

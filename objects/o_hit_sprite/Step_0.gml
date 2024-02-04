// Step Event of obj_trail

// Decrease the trail's lifespan
hit_lifespan -= 1;

// Check if the trail's lifespan is over
if (hit_lifespan <= 0) {
    instance_destroy(); // Destroy the trail object when its lifespan is over
}

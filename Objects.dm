obj/enemy_spawner
	icon = 'Spawn.dmi'
	var/list/enemy_type_weights = list(
		/mob/Enemies/Clone = 1,
		/mob/Enemies/Blue_Guy = 2,
		/mob/Enemies/Green_Guy = 3,
		/mob/Enemies/Red_Guy = 4,
	)
	proc/SpawnRandomEnemy()
		var/enemy_type = pickweight(enemy_type_weights)
		new enemy_type(loc)
	New()
		while(TRUE)
			sleep(rand(100,150))
			SpawnRandomEnemy()
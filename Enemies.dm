mob/Enemies
	Red_Guy
		icon='EnemyRed.dmi'
		Level=1
		Exp=5
		MaxHP=100
		Str=10
		Def=5
	Green_Guy
		icon='EnemyGreen.dmi'
		Level=2
		Exp=10
		MaxHP=150
		Str=11
		Def=6
	Blue_Guy
		icon='EnemyBlue.dmi'
		Level=3
		Exp=15
		MaxHP=200
		Str=12
		Def=7
	Clone
		icon='Clone.dmi'
		Level=4
		Exp=20
		MaxHP=250
		Str=13
		Def=8

mob/Enemies/New()
    src.HP=src.MaxHP
    spawn(-1)    src.CombatAI()
    return ..()

mob/Enemies/proc/CombatAI()
    while(src)
        for(var/mob/Player/M in oview())
            if(get_dist(src,M)<=1)
                src.dir=get_dir(src,M)
                src.Attack()
            else
                step_to(src,M)
            break
        sleep(rand(4,8))
mob/verb
	Say(t as text)
		view()<<"[src] says: [t]"
	World_Say(t as text)
		world<<"<b>[src]:</b> [t]"
	Who()
		var/counter=0
		for(var/mob/Player/M in world)
			counter+=1
			usr<<"([M.Level]) [M]"
		src<<"<b>[counter] Player(s) Online"
	Attack()
		flick("Attack",src)
		for(var/mob/M in get_step(src,src.dir))
			var/Damage=max(0,src.Str-M.Def)
			view(M)<<"[src] hit [M] for [Damage] Damage!"
			M.TakeDamage(Damage,src)
	Save()
		src.SaveProc()
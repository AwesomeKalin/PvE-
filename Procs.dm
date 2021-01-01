mob/proc
	LevelCheck()
		if(src.Exp>=src.Nexp)
			src.Exp=0
			src.Nexp+=10
			src.Level+=1
			src.MaxHP+=rand(1.5)
			src.Str+=1
			src.Def+=1
			src<<"You are now Level [src.Level]"

mob/verb
	Test_Leveling()
		usr.Exp+=100
		usr.LevelCheck()

	TakeDamage(var/mob/Damage,var/mob/Attacker)
		src.HP-=Damage
		src.DeathCheck(Attacker)

	DeathCheck(var/mob/Killer)
		if(src.HP<=0)
			if(src.client)
				world<<"[Killer] Killed [src]!"
				src.HP=src.MaxHP
				src.loc=locate(5,5,1)
			else
				Killer<<"<b>You Killed [src] for [src.Exp] Exp"
				Killer.Exp+=src.Exp
				Killer.LevelCheck
				del src

// map = list(choice = weight, ...)
proc/pickweight(list/weight_by_value)

	// build the pie chart
	var/total_weight = 0
	for(var/value in weight_by_value)
		total_weight += weight_by_value[value]

	// throw a dart at the pie chart
	var/position = total_weight * rand()

	// find the dart
	for(var/value in weight_by_value)
		if((position -= weight_by_value[value]) <= 0)
			return value

world
	name="Tutorial"
	mob=/mob/Player

mob/Player
	icon='Player.dmi'
	icon_state="Player"

mob
	Login()
		if(src.LoadProc())
			world<<"[src] has Returned"
		else
			src.loc=locate(5,5,1)
			world<<"[src] has Logged In"
		spawn(-1)	winset(src,"default","size=640x480; pos=100,100; is-maximized=true")
	Logout()
		world<<"[src] has Logged Out"
		src.SaveProc()
		del src
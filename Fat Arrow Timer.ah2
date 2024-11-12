F1::SetTimer(Timer,1000)
F2::SetTimer(Timer,0)
F3::{
	Static T:=0
	SetTimer(Timer,(T:=!T)*1000)
}
Timer() => SoundBeep(880)

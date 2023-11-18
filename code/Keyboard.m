global key 
InitKeyboard(); 
while 1 
	pause(0.1)
	switch key 
	case 'uparrow' 
		disp('UP')
		brick.MoveMotor('C',12);
	case 'downarrow' 
		disp('DOWN') 
		brick.MoveMotor('C',-12);
	case 'leftarrow' 
		disp('LEFT')
		brick.MoveMotor('AB',10);
	case 'rightarrow' 
		disp('RIGHT')
		brick.MoveMotor('AB',-10);
	case 0 
		disp('NULL')
		brick.StopMotor('C');
		brick.StopMotor('AB');
	case 'w'
		brick.MoveMotor('A',-10);
		brick.MoveMotor('B',-14);
	case 's'
		brick.MoveMotor('A',10);
		brick.MoveMotor('B',14);
	case 'a'
		brick.MoveMotor('A',-10);
	case 'd'
		brick.MoveMotor('B',-14);
	case 'q' 
		disp('EXITING') 
		break; 
	end 
end 
CloseKeyboard();

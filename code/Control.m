brick.SetColorMode(3,2); 
color = brick.ColorCode(3); 
while 1 
	touch=brick.TouchPressed(1); 
	distance = brick.UltrasonicDist(2); 
	color = brick.ColorCode(3); 
	while touch==0 
		%when not sensoring color 
		brick.MoveMotor('A',45); 
		brick.MoveMotor('B',49); 
		touch=brick.TouchPressed(1); 
		distance = brick.UltrasonicDist(2); 
		color = brick.ColorCode(3); 
		
		%color is red 
		if color==5
			display(color) 
			brick.StopAllMotors(); 
			pause(1) 
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
			color=0; 
		end
		
		color = brick.ColorCode(3);

		%color is blue 
		if color==2
			display(color) 
			brick.StopAllMotors(); 
			for i = 1:2 
				brick.playTone(100,300,300) 
				pause(0.5) 
				display(i) 
			end 
			i=0; 
			pause(1) 
			Keyboard; 
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
			pause(3) 
		end
		
		color = brick.ColorCode(3); 
		
		%color is green
		if color==3
			display(color) 
			brick.StopAllMotors();
			for i = 1:3 
				brick.playTone(100,300,300)
				pause(0.5) 
				display(i) 
			end 
			i=0; 
			pause(1) 
			Keyboard; 
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
			pause(3) 
		end
		color = brick.ColorCode(3); 
		
		%color is yellow 
		if color==4 
			display(color) 
			brick.StopAllMotors(); 
			pause(1) 
			Keyboard(); 
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
			pause(3) 
		end 
		color = brick.ColorCode(3); 
		
		%when distance>60 
		if distance>60 
			disp('distance > 60') 
			%continue goes a distance to make the car turn 
			disp('go to make the car turn') 
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
			pause(0.5); 
			disp('stop') 
			brick.StopAllMotors(); 
			pause(1); 
			disp('turn to open space') 
			brick.MoveMotor('A',-40); 
			brick.MoveMotor('B',45); 
			pause(0.85) 
			brick.StopAllMotors(); 
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
			pause(2); 
			distance = brick.UltrasonicDist(2); 
			%when detects a new open space 
			%{ 
			if distance>60 
				brick.StopAllMotors(); 
				pause(1); 
				disp('open space, 2nd turn')
				brick.MoveMotor('A',-50);
				brick.MoveMotor('B',50); 
				pause(3.4) 
				brick.StopAllMotors(); 
				brick.MoveMotor('AB',50) 
				pause(1) 
			end
			
			brick.MoveMotor('AB',50) 
			pause(1) 
		%} 
			%distance = brick.UltrasonicDist(2); 
		end
		
		%distance too close 
		if distance==225 ||distance<5
			disp('distance too close, stop') 
			brick.StopAllMotors(); 
			pause(1); 
			disp('back up') 
			brick.MoveMotor('A',-45); 
			brick.MoveMotor('B',-49); 
			pause(1) 
			disp('turn to another direction') 
			brick.MoveMotor('A',-45); 
			brick.MoveMotor('B',45); 
			pause(1.2) 
			%continue goes a distance 
			%disp('go') 
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
			pause(1); 
			distance = brick.UltrasonicDist(2); 
		end 
	end

	touch=brick.TouchPressed(1); 
	if touch==1 
		disp('hit the wall') 
		brick.MoveMotor('A',-45); 
		brick.MoveMotor('B',-49); 
		pause(0.8); 
		brick.StopAllMotors(); 
		pause(1); 
		disp('turn to left') 
		brick.MoveMotor('A',40); 
		brick.MoveMotor('B',-45); 
		pause(0.85) 
		%continue goes a distance 
		%disp('go') 
		brick.MoveMotor('A',45); 
		brick.MoveMotor('B',49); 
		pause(1); 
		distance = brick.UltrasonicDist(2); 
	end 
	touch=brick.TouchPressed(1); 
end 
%brick.MoveMotor('C',10);

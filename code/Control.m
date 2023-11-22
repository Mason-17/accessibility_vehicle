brick.SetColorMode(3,2); 
color = brick.ColorCode(3); 
left_flag = true;
while 1 
	touch=brick.TouchPressed(1);
    color = brick.ColorCode(3); 
    if left_flag == true
        distance = brick.UltrasonicDist(2);
    end
	distance = brick.UltrasonicDist(2);
    left_flag = true;
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
            brick.MoveMotor('A',49)
			%brick.MoveMotor('A',45); 
			%brick.MoveMotor('B',49);
            brick.MoveMotor('B',43);
            %potentially remove these two lines
            pause(.1)
            brick.MoveMotor('A',45)
			color=0; 
            left_flag = true;
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
			pause(2) %og 3
		end 
		color = brick.ColorCode(3); 
		
		%when distance>60 
		if distance>60 && left_flag == true 
            
			disp('distance > 60') 
			%continue goes a distance to make the car turn 
			disp('car goes forward a distance') 
			brick.MoveMotor('A',45);
			brick.MoveMotor('B',49);
            disp('pause for a bit')
			pause(0.5); 
			disp('stop') 
			brick.StopAllMotors(); 
			pause(1); 
			disp('turn to open space') 
			brick.MoveMotor('A',-32); %og -35
			brick.MoveMotor('B',42); %og 40
            disp('pause second time')
			pause(1) %og .85
			brick.StopAllMotors(); 
            disp('going forward again after turn to open space')
			brick.MoveMotor('A',45); 
			brick.MoveMotor('B',49); 
            disp('pausing yet again')
			pause(1); %og ~2
			%distance = brick.UltrasonicDist(2); 
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
            left_flag = false;
		end
		
		%distance too close 
		if distance==225 || distance<5
			disp('distance too close, stop') 
			brick.StopAllMotors(); 
			pause(1); 
			disp('back up') 
			brick.MoveMotor('A',-45); 
			brick.MoveMotor('B',-49); 
			pause(1) 
			disp('turn to another direction') 
			brick.MoveMotor('A',-35); 
			brick.MoveMotor('B',40); 
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
        left_flag = true;
		distance = brick.UltrasonicDist(2); 
	end 
	touch=brick.TouchPressed(1); 
end 
%brick.MoveMotor('C',10);

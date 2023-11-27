brick.SetColorMode(3,2);
color = brick.ColorCode(3);
colorOpt = false;
while 1
	touch=brick.TouchPressed(1);
   color = brick.ColorCode(3);
	distance = brick.UltrasonicDist(2);
	while touch==0
		%when not sensoring color
		brick.MoveMotor('A',-45.5);
		brick.MoveMotor('B',-46);
		touch=brick.TouchPressed(1);
		distance = brick.UltrasonicDist(2);
		color = brick.ColorCode(3);
		
		%color is red
		if color==5
			display(color)
			brick.StopAllMotors();
			pause(1)
           brick.MoveMotor('A',-45.5)
           brick.MoveMotor('B',-46);
			color=0;
           colorOpt = true;
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
           color=0;
			colorOpt = true;
			brick.MoveMotor('A',-45)
           brick.MoveMotor('B',-46);
			pause(2)
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
           color=0;
           colorOpt = true;
			brick.MoveMotor('A',-45);
			brick.MoveMotor('B',-46);
			pause(3)
		end
		color = brick.ColorCode(3);
		
		%color is yellow
		if color==4
			display(color)
			brick.StopAllMotors();
			pause(1)
			Keyboard();
           color=0;
           colorOpt = true;
           brick.MoveMotor('A',-45);
			brick.MoveMotor('B',-46);
			pause(2) %og 3
		end
		color = brick.ColorCode(3);
		
		%when distance>60
		if distance>60
			disp('distance > 60')
			%continue goes a distance to make the car turn
			disp('car goes forward a distance')
			brick.MoveMotor('A',-45.5);
			brick.MoveMotor('B',-45.8);
			pause(0.4);
			disp('stop')
			brick.StopAllMotors();
			pause(1);
			disp('turn to open space')
			brick.MoveMotor('A',-35); %og -35
			brick.MoveMotor('B',42); %og 40
			pause(0.63) %og .85
			brick.StopAllMotors();
           pause(0.5)
           disp('going forward again after turn to open space')
           color = brick.ColorCode(3);
           pause(1);
           disp(color)
			if color == 5
                display(color)
			    brick.StopAllMotors();
			    pause(1)
                brick.MoveMotor('A',-45.5)
                brick.MoveMotor('B',-46);
			    color=0;
                colorOpt = true;
            end

            brick.MoveMotor('A',-45.5);
			brick.MoveMotor('B',-46);
            color = brick.ColorCode(3);
            disp(color)
            if color==5
			    display(color)
                display(color)
			    brick.StopAllMotors();
			    pause(1)
                brick.MoveMotor('A',-45.5)
                brick.MoveMotor('B',-46);
			    color=0;
                colorOpt = true;
		    end
			pause(2); %og ~2
			
		end
		
		%distance too close
		if distance==225 || distance<5
			disp('distance too close, stop')
			brick.StopAllMotors();
			pause(1);
			disp('back up')
			brick.MoveMotor('A',45);
			brick.MoveMotor('B',46);
			pause(0.5)
			disp('turn to another direction')
			brick.MoveMotor('A',32);
			brick.MoveMotor('B',-40);
			pause(0.1)
			%continue goes a distance
			%disp('go')
			distance = brick.UltrasonicDist(2);
		end
	end
	touch=brick.TouchPressed(1);
	if touch==1
		    disp('hit the wall')
           brick.StopAllMotors();
           pause(0.2);
           disp('back up')
           brick.MoveMotor('A',45)
           brick.MoveMotor('B',43.8);
           pause(0.8)
           brick.StopAllMotors();
		    pause(1);
           disp('turn to right')
           brick.MoveMotor('A',35);
		    brick.MoveMotor('B',-42);
		    pause(0.65)
           disp('stop a while')
           brick.StopAllMotors();
           pause(0.5);
           distance = brick.UltrasonicDist(2);
	end
	touch=brick.TouchPressed(1);
end

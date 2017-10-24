function [L] = addBracket(x5, light, theta)
% This outputs the L = T * T * R matrix for a joint with a 90 degree bracket
% There are two options: a light bracket and a heavy bracket. 'light'
% handles this

% 'x5'=true handles an x5 motor, false a x8 motor.

% Note: this is the transformation between the input to the motor
% (described by x5 input) and to where the next motor attaches.

% T1 is the z-axis offset. This depends on the motor type and the bracket
% type
T1 = [1,0,0,0; 
      0,1,0,0; 
      0,0,1,0;
      0,0,0,1];

if(x5)
    T1(3,4) = T1(3,4) + 0.0311;
else
    T1(3,4) = T1(3,4) + 0.0451;
end

if(light)
    T1(3,4) = T1(3,4) + 0.040;
else
    T1(3,4) = T1(3,4) + 0.055;
end

% T2 is the radius, dependant on the bracket
if(light)
    T2 = [1,0,0,0.043; 
          0,1,0,0; 
          0,0,1,0;
          0,0,0,1];
else
    T2 = [1,0,0,0.0375; 
          0,1,0,0; 
          0,0,1,0;
          0,0,0,1];
end

  
% R is the rotational offset, or the angle about the x-axis between z-axes
% For these brackets, this will always be a -pi/2 rotation about the x-axis
% I've gone ahead and filled this in
R = [1,0,0,0; 
     0,0,1,0; 
     0,-1,0,0;
     0,0,0,1]; 
 
Rot = [cos(theta), -1*sin(theta), 0, 0;
         sin(theta), cos(theta), 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
 
L = Rot * T1 * T2 * R;
end
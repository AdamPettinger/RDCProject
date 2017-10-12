function [L] = addLink(l, angle, x5, EE)
% This outputs the L = T * T * R matrix for a joint with a link (tube)
% l is the length of the pipe (from motor-center to motor-center)
% angle is the rotational offset (twist) of the link

% Note: this is the transformation between the input to the motor
% (described by x5 input) and to where the next motor attaches. If EE=true
% there is no next motor (its the end effector)

% T1 is the z-axis offset. The 0.02 meters comes from the tube connectors
% at motor input side. There will be another 0.02 m if its not the EE
T1 = [1,0,0,0; 
      0,1,0,0; 
      0,0,1,0.02;
      0,0,0,1];
  
if(~EE)
    T1(3,4) = T1(3,4) + 0.02;
end

if(x5)
    T1(3,4) = T1(3,4) + 0.0311;
else
    T1(3,4) = T1(3,4) + 0.0451;
end

% T2 is the radius, or the length of the link
T2 = [1,0,0,l; 
      0,1,0,0; 
      0,0,1,0;
      0,0,0,1];
  
% R is the rotational offset, or the angle about the x-axis between z-axes
R = [1,0,0,0; 
     0,cos(angle),-1*sin(angle),0; 
     0,sin(angle),cos(angle),0;
     0,0,0,1]; 
 
L = T1 * T2 * R;
end
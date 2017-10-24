% For testing the function createMovie.m
% This is a sandbox script really

% Rl or 'RobotLinks' is a vector of booleans cooresponding to whether each
% link is a 90 degree bracket or a link. 'true' for a link.
Rl = [false, false, true, false, true, false];

% bracket is a 1x6 bool array. For bracket links, 'true' = light brackets
% (vs heavy). For tube links, 'true' = x5 motor (vs x8)
b = [false, false, false, true, true, true];

syms t1 t2 t3 t4 t5 t6;

L(:,:,1) = addBase(t1);
L(:,:,2) = addBracket(false, false, t2);
L(:,:,3) = addLink(0.3, 0, false, false, t3);
L(:,:,4) = addBracket(true, true, t4);
L(:,:,5) = addLink(0.25, 0, true, false, t5);
L(:,:,6) = addBracket(true, true, t6);
L(:,:,7) = addEE(0,0,0.04);


pos = [0, 0, 0, 0, 0, 0];

P = getPos(L, pos, t1,t2,t3,t4,t5,t6);

%[J, Ji] = findJacobian(L); % Need to redo it and take the EE into effect

% Jx = subsMatrix(J, pos, t1,t2,t3,t4,t5,t6); % Need to redo it and take the EE into effect

[p, c] = calcDrawPoints(P, Rl, b);
testing = drawLines(p,c);
f = calcFramePoints(P);
testing2 = drawFrames(f);

view(3);
grid on;
axis([0 1 -0.5 0.5 -0.5 0.5]);
xlabel('x'); ylabel('y'); zlabel('z');

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NEXT STEPS ~~~~~~~~~~~~~~~~~~~~~~~
% Convert from line objects to plot3() and drawnow
% Work on the 2x2 subplot with the iso and top/side/front views

% t = 1:15;
% W = zeros(4,4,6,length(t));
% for i=1:length(t)
%     for j=1:length(pos)
%         s = rand(1);
%         if(s < 0.5)
%             pos(j) = pos(j) + deg2rad(4*rand(1));
%         else
%             pos(j) = pos(j) - deg2rad(2*rand(1));
%         end
%     end
%     W(:,:,:,i) = getPos(L, pos, t1,t2,t3,t4,t5,t6);
% end

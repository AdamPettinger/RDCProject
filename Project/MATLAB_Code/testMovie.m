% For testing the function createMovie.m
% This is a sandbox script really

% Rl or 'RobotLinks' is a vector of booleans cooresponding to whether each
% link is a 90 degree bracket or a link. 'true' for a link.
Rl = [false, true, false, true, false, false];
syms t1 t2 t3 t4 t5 t6;

L(:,:,1) = addBase(t1);
L(:,:,2) = addBracket(false, false, t2);
L(:,:,3) = addLink(0.3, 0, false, false, t3);
L(:,:,4) = addBracket(true, true, t4);
L(:,:,5) = addLink(0.25, 0, true, false, t5);
L(:,:,6) = addBracket(true, true, t6);


pos = [0, 0, 0, 0, 0, 0];

P = getPos(L, pos, t1,t2,t3,t4,t5,t6);

%[J, Ji] = findJacobian(L); % Works, just commented it out to speed
%computation while testing the graphics

% Jx = subsMatrix(J, pos, t1,t2,t3,t4,t5,t6); % Works, just commented it out to speed
%computation while testing the graphics

[p, c] = calcDrawPoints(P, Rl);
testing = drawLines(p,c);
view(3);
grid on;
axis([0 1 0 0.3 -0.3 0.3]);
xlabel('x'); ylabel('y'); zlabel('z');

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
% 
% p0 = [0 0 0]';
% p1 = P(1:3,4,1,i);
% d = p1-p0;
% x = [1 0 0]';
% y = [0 1 0]';
% z = [0 0 1]';
% 
% a = p0 + x.*dot(x,d);
% b = a + y.*dot(y,d);
% c = b + z.*dot(z,d);
% 
% line([p0(1), a(1)], [p0(2), a(2)], [p0(3), a(3)], 'color', 'red');
% line([a(1), b(1)], [a(2), b(2)], [a(3), b(3)], 'color', 'red');
% line([b(1), c(1)], [b(2), c(2)], [b(3),c(3)], 'color', 'red');
% 
% line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'color', 'green');
% grid on;
% view(3);
% %axis([-0.5 0.5 -0.5 0.5 -0.5 0.5]);
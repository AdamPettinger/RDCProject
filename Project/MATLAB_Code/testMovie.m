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

% [J, Ji] = findJacobian(L); % Need to redo it and take the EE into effect

% Jx = subsMatrix(J, pos, t1,t2,t3,t4,t5,t6); % Need to redo it and take the EE into effect

%% Works but I took it out to test the subplotting
% % az = 0; el = 90;
% % view(az, el);
% 
% [p, c] = calcDrawPoints(P, Rl, b);
% testing = drawLines(p,c);
% f = calcFramePoints(P);
% testing2 = drawFrames(f);
% 
% grid on;
% axis([0 1 -0.5 0.5 -0.5 0.5]);
% xlabel('x'); ylabel('y'); zlabel('z');
%% 
t = 1:30;
W = zeros(4,4,7,length(t));
for i=1:length(t)
    for j=1:length(pos)
        s = rand(1);
        if(s < 0.5)
            pos(j) = pos(j) + deg2rad(10*rand(1));
        else
            pos(j) = pos(j) - deg2rad(10*rand(1));
        end
    end
    W(:,:,:,i) = getPos(L, pos, t1,t2,t3,t4,t5,t6);
end
%% 
xmin = 0; xmax = 0.75; ymin = -0.5; ymax = 0.5; zmin = -0.5; zmax = 0.5;
figure('units','normalized','outerposition',[0 0 1 1]);
for i=1:length(t)
    subplot(2,2,4)
        grid on; hold off;
        [p3, c3] = calcDrawPoints(W(:,:,:,i), Rl, b);
        joints3 = drawLines(p3,c3);
        f3 = calcFramePoints(W(:,:,:,i));
        frames3 = drawFrames(f3);
        xlabel('x'); ylabel('y'); zlabel('z');
        title('3D View');
        axis([xmin xmax ymin ymax zmin zmax]);
        
    subplot(2,2,1)
        grid on; hold off;
        view([0 90])
        jointsz = drawLines(p3,c3);
%         framesz = drawFrames(f3);
        xlabel('x'); ylabel('y');
        title('Top View');
        axis([xmin xmax ymin ymax]);
        
    subplot(2,2,2)
        grid on; hold off;
        view([0 0])
        jointsx = drawLines(p3,c3);
%         framesx = drawFrames(f3);
        xlabel('x'); ylabel('y'); zlabel('z');
        title('Side View');
        axis([xmin xmax ymin ymax zmin zmax]);
        
    subplot(2,2,3)
        grid on; hold off;
        view([90 0])
        jointsy = drawLines(p3,c3);
%         framesy = drawFrames(f3);
        xlabel('x'); ylabel('y'); zlabel('z');
        title('Front View');
        axis([xmin xmax ymin ymax zmin zmax]);
    
    pause(0.5);
    if(i ~= length(t))
        delete(frames3);
        delete(joints3);
%         delete(framesz);
        delete(jointsz);
%         delete(framesy);
        delete(jointsy);
%         delete(framesx);
        delete(jointsx);
    end
end


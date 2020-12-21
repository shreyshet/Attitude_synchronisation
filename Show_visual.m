%% Sat Motion
close all
load('Data_1.mat')
%%
% CUBE_PLOT plots a cube with dimension of X, Y, Z.
%
% INPUTS:
% origin = set origin point for the cube in the form of [x,y,z].
% X      = cube length along x direction.
% Y      = cube length along y direction.
% Z      = cube length along z direction.
% color  = STRING, the color patched for the cube.
%         List of colors
%         b blue
%         g green
%         r red
%         c cyan
%         m magenta
%         y yellow
%         k black
%         w white
% OUPUTS:
% Plot a figure in the form of cubics. And Translates and Rotates it..
%
%
% ------------------------------Code Starts Here------------------------------ %

% for i = 1:N
%     [yaw(:,i),pitch(:,i),roll(:,i)] = quat2angle(X(:,7*(i-1) + 1: 7*i-3));
%     w1(:,i) = X(:,7*(i-1) + 5);
%     w2(:,i) = X(:,7*(i-1) + 6);
%     w3(:,i) = X(:,7*(i-1) + 7);
% end

r0=[0,0,0];
X=1;
Y=1;
Z=1;
color = {'cyan','black','white','yellow','magenta'};

    % Define the vertexes of the unit cubic
    ver = [ .5  .5 -.5;
           -.5  .5 -.5;
           -.5  .5  .5;
            .5  .5  .5;
           -.5 -.5  .5;
            .5 -.5  .5;
            .5 -.5 -.5;
           -.5 -.5 -.5];
    a=.52;

    %  Define the faces of the unit cubic
    fac = [ 1 2 3 4;
            4 3 5 6;
            6 7 8 5;
            1 2 8 7;
            6 7 1 4;
            2 3 5 8];
clear thx thy thz h t
for i = 1:N
    subplot(2,3,i)
    %% Th_ver_x
    [z,y,x] = cylinder([.05,.05]);
    [zc,yc,xc] = cylinder([0.08,0]);
%      x=.3*x;
     thx(1)=surface(x,y,z,'FaceColor','red');
     thx(1).EdgeColor = 'none';
     thx(2)=surface(xc*.3 + 1,yc,zc,'FaceColor','red');
     thx(2).EdgeColor = 'none';
%      thx(2)=surface((x-.02),(y-a),(z-a),'FaceColor','red');
%      thx(3)=surface((-x+.02),(y+a),(z-a),'FaceColor','red');
%      thx(4)=surface((-x+.02),(y-a),(z+a),'FaceColor','red');
     

     %% Th_ver_y
     %
    [x,z,y] = cylinder([.05,.05]);
    [xc,zc,yc] = cylinder([0.08,0]);
%      x=.3*x;
     thy(1)=surface(x,y,z,'FaceColor','green');
     thy(1).EdgeColor = 'none';
     thy(2)=surface(xc,yc*.3 + 1,zc,'FaceColor','green');
     thy(2).EdgeColor = 'none';

     %}
     %% Th_ver_z
     %
     [y,x,z] = cylinder([.05,.05]);
     [yc,xc,zc] = cylinder([0.08,0]);
%      x=.3*x;
     thz(1)=surface(x,y,z,'FaceColor','blue');
     thz(1).EdgeColor = 'none';
     thz(2)=surface(xc,yc,zc*.3 + 1,'FaceColor','blue');
     thz(2).EdgeColor = 'none';
     %}
    %% 
    cube = [ver(:,1)*X+r0(1),ver(:,2)*Y+r0(2),ver(:,3)*Z+r0(3)];
    %
    view([135,45]);
    pbaspect([1,1,1]);

    h(1:2) = thx;
    h(3:4) = thy;
    h(5:6) = thz;
    h(7)  = patch('Faces',fac,'Vertices',cube,'FaceColor',color{i});
    sp(:,:,i) = h;
    t(:,i)  = hgtransform;
    set(sp(:,:,i),'Parent',t(:,i));
    %}
end

%%
%
writerObj = VideoWriter('Video_underact_2.avi');
writerObj.FrameRate = 100;
% open the video writer
open(writerObj);

ts = time(find(time<1.5));

for j = 1:1000:length(ts)
    time(j)
    sgtitle(strcat('t = ',num2str(time(j)),'s'))
    for i = 1:N
        subplot(2,3,i)
        title(strcat('Agent ',num2str(i)))
        Rot = makehgtform('xrotate',roll(j,i),'yrotate',...
            pitch(j,i),'zrotate',yaw(j,i));
        % Concatenate the transforms and
        % set the transform Matrix property
        set(t(:,i),'Matrix',Rot)
        hold on
        view([135,45])
        drawnow
        frame = getframe(gcf);
        writeVideo(writerObj, frame);
    end
end

% close the writer object
close(writerObj);
%}

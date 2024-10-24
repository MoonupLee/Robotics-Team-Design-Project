clc;
clear;
load('Ball_data.mat');
hold on
% 创建足球场
Create_Field();
% 创建足球并让它运动
Ball_falling();

%view(0, -90); % set initial view(Angle of vertical)
%view(-47, -32); % set initial view(nomal view)

view(0, 0);

% Constants

%B = 0.02;
%I = (2/5) * Ball_m * Ball_R^2;




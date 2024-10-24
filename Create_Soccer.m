% Create the ball and one of the behavier
function Create_Soccer(X0, Y0, Z0)
    load('Ball_data.mat');
    % Create a point(X,Y,Z) in the surface of ball  
    [X, Y, Z] = sphere(50);  
    X = Ball_R * X + X0;  
    Y = Ball_R * Y + Y0;  
    Z = Ball_R * Z + Ball_R + Z0;  
    zlim([0 10]);  % 限制 z 轴的范围（高度）
    % Create the ball
    surf(X, Y, Z, 'FaceColor', [255/255, 102/255, 0/255], 'EdgeColor', 'none');
    % Set more details, which could let the ball be more realistic
    light('Position', [1 0 1], 'Style', 'infinite');  % light
    lighting gouraud;  % light mode
    material([0.6, 0.7, 0.1, 10, 0.5]); %material leather
    axis equal;
    set(gca, 'visible', 'off');  % Hide the axes
    set(gcf, 'Color', 'w');      % background color
    title('Pitch or Field of Play in 3D');
    grid on;
end
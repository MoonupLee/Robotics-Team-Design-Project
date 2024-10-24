function Ball_falling()
    load Ball_data.mat;
    height0 = 10;    
    t = 0.05;
    Create_Soccer(0,0,height0);
    total_t = 0;
    state = 0;
    v = 1;
    e = 0.7;
    height = height0;
    while true
        if state == 0
            height0 = height;
            while height > 0
                % 绘制球体（z 方向运动，x, y 坐标保持不变）
                total_t = total_t + t;
                height = (height0 - (Ball_m^2*g/C^2)*(1-exp(-C*total_t/Ball_m)) - Ball_m*g/C*total_t);
                v = Ball_m*g/C*(1-exp(-C*total_t/Ball_m));
                if height < 0  % 防止高度低于地面
                    height = 0;
                end
                Create_Soccer(0,0,height);% 球体的 z 坐标更新
                Create_Field();
                pause(t);  % 控制仿真速度 
                clf;  % 清除当前图形，准备绘制下一帧   
            end
            Create_Soccer(0,0,0);% 球体的 z 坐标更新
            Create_Field();
            v = e*Ball_m*g/C*(1-exp(-C*total_t/Ball_m));
            total_t = 0;
            state = 1;
            if v <0.1
                break;
            end
        elseif state ==1
            v0 = v;
            while v > 0
                % 绘制球体（z 方向运动，x, y 坐标保持不变）
                total_t = total_t + t;
                height =  -(Ball_m*g/C)*total_t + (Ball_m/C*(v0+Ball_m*g/C))*(1-exp(-C*total_t/Ball_m));
                v = -(Ball_m*g/C) + ((v0+Ball_m*g/C))*exp(-C*total_t/Ball_m);
                if v < 1e-5  % 防止高度低于地面
                    v = 0;
                end
                Create_Soccer(0,0, height);% 球体的 z 坐标更新
                Create_Field();
                pause(t);  % 控制仿真速度 
                clf;  % 清除当前图形，准备绘制下一帧   
            end
            Create_Soccer(0,0,height);% 球体的 z 坐标更新
            Create_Field();
            state = 0;
            
            total_t = 0;
            
        end
        
    end
end
    
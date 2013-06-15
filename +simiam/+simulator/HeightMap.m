classdef HeightMap
   properties
       map
       scale %map size to simu size
   end
   methods
       function obj = HeightMap(map_size)
           obj.map = generate_height_map(100);
           obj.scale = size(obj.map,1)/map_size;
           
           function map = generate_height_map(n)
                map = rand(5);
                base_h = mean(mean(map));
                map(3,3) = base_h;
                i = 1;
                while(size(map,1) < n)
                    map = interp2(map, 'spline');
                    map((ceil(size(map,1)/2) - i):(ceil(size(map,1)/2)+i),  (ceil(size(map,2)/2) - i):(ceil(size(map,2)/2)+i)) = mean(mean(map));
                    i = i+1;
                end
           end
       end
        
       function alpha = getAngle(obj, pose)
           movedX = pose.x + cos(pose.theta)*0.01;
           movedY = pose.y + cos(pose.theta)*0.01;
           
           alpha = atan((obj.getHeight(movedX,movedY) - obj.getHeight(pose.x, pose.y))/0.01);
       end
       
       function z = getHeight(obj, x, y)
           %handles negative args
           map_size = size(obj.map,1)/obj.scale;
           x = x + map_size/2 + 1;
           y = y + map_size/2 + 1;
           
           x_scaled = floor(obj.scale*x);
           y_scaled = floor(obj.scale*y);
           
           %x_diff = obj.scale*x - x_scaled;
           %y_diff = obj.scale*y - y_scaled
           
           %theta = atan2(y_diff, x_diff);
           if(x_scaled < size(obj.map,1) && y_scaled < size(obj.map,2))
               alphaX = obj.map(x_scaled + 1, y_scaled) - obj.map(x_scaled, y_scaled);
               alphaY = obj.map(x_scaled, y_scaled + 1) - obj.map(x_scaled, y_scaled);
               %should be weighted
               z = alphaX*(obj.scale*x - x_scaled) + alphaY*(obj.scale*y - y_scaled) + obj.map(x_scaled, y_scaled);
           else
               z = obj.map(x_scaled, y_scaled);
           end
           
       end
       
       function [Z, X, Y] = getScaledMap(obj, prec)
          X = -(size(obj.map,1)/(2*obj.scale)):prec:(size(obj.map,1)/(2*obj.scale)-1);
          Y = X;
          Z = zeros(size(Y,2),size(X,2));
          for i = 1:size(X,2)
              for j = 1:size(Y,2)
                  Z(i,j) = obj.getHeight(X(i), Y(j));
              end
          end
       end
       
   end
end
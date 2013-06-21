classdef Dock < simiam.ui.Drawable
    properties
        type
        occupied
        x_d
        y_d
        cycles
        charging_robot
    end
    
    methods
        function obj = Dock(parent, pose, geometry)
           obj = obj@simiam.ui.Drawable(parent, pose);
           obj.type = 'dock';
           obj.x_d = pose.x;
           obj.y_d = pose.y;
           geometry(:,3) = ones(size(geometry,1),1);
           surface = obj.add_surface(geometry, [0.4 0.4 1]);
           set(surface.handle_, 'EdgeColor', 'b');
           obj.occupied = false;
           obj.cycles = 0;
           charging_robot = [];
        end
        
        function bool = robot_detection(obj, world)
            bool = 0;
            body_r_s = obj.surfaces.head_.key_;
            token_l = world.robots.head_; 
            while(~isempty(token_l))
                robot_o = token_l.key_.robot;
                supervisor_o = token_l.key_.supervisor;
                body_o_s = robot_o.surfaces.head_.key_;
                if(body_r_s.precheck_surface(body_o_s))
                    pts = body_r_s.intersection_with_surface(body_o_s, true);
                    bool = (size(pts,1) > 0);
                    if (bool && (supervisor_o.goal(1) == obj.x_d) && (supervisor_o.goal(2) == obj.y_d) && (obj.cycles ~= 500) )
                        supervisor_o.switch_to_state('stop');
                        obj.charging_robot = robot_o;
                        return;
                    end
                end
                token_l = token_l.next_;
            end
        end
    end
end
classdef Dock < simiam.ui.Drawable
    properties
        type
        occupied
    end
    
    methods
        function obj = Dock(parent, pose, geometry)
           obj = obj@simiam.ui.Drawable(parent, pose);
           obj.type = 'dock';
           geometry(:,3) = ones(size(geometry,1),1);
           surface = obj.add_surface(geometry, [0.4 0.4 1]);
           set(surface.handle_, 'EdgeColor', 'b');
           obj.occupied = 0;
        end
        
        function bool = robot_detection(obj, world)
            bool = 0;
            body_r_s = obj.surfaces.head_.key_;
            token_l = world.robots.head_; 
            while(~isempty(token_l))
                robot_o = token_l.key_.robot;
                body_o_s = robot_o.surfaces.head_.key_;
                if(body_r_s.precheck_surface(body_o_s))
                    pts = body_r_s.intersection_with_surface(body_o_s, true);
                    bool = (size(pts,1) > 0);
                    if (bool)
                        token_l.key_.supervisor.switch_to_state('stop');
                        return;
                    end
                end
                token_l = token_l.next_;
            end
        end
    end
end
classdef Base < simiam.ui.Drawable
    properties
        docks
        type
    end
    
    methods
        function obj = Base(parent, pose, geometry)
           obj = obj@simiam.ui.Drawable(parent, pose);
           obj.type = 'base';
           geometry(:,3) = ones(size(geometry,1),1);
           surface = obj.add_surface(geometry, [0.4 0.4 1]);
           set(surface.handle_, 'EdgeColor', 'b');
           
           obj.docks =  mcodekit.list.dl_list();
        end
        
        function add_dock(obj, x, y, theta, geometry)
           pose = simiam.ui.Pose2D(x, y, theta);
           obj.docks.append_key(struct('dock', simiam.base.Dock(obj.parent, pose, geometry), 'pose', pose)); 
        end
        
        function allocate_waiting_robots(obj, world)
            token_r = world.robots.head_;
            while(~isempty(token_r))
                robot_o = token_r.key_.robot;
                supervisor_o = token_r.key_.supervisor;
                if( supervisor_o.is_in_state('waiting_for_dock'))
                    token_d = obj.docks.head_;
                    while(~isempty(token_d))
                        dock_o = token_d.key_.dock;
                        if( ~dock_o.occupied )
                            supervisor_o.change_goal( dock_o.x_d, dock_o.y_d );
                            supervisor_o.switch_to_state('go_to_goal');
                            dock_o.occupied = true;
                            return;
                        end
                    token_d = token_d.next_;
                    end
                end
                token_r = token_r.next_;
            end
        end
        
    end
end
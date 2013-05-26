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
    end
end
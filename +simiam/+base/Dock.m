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
        end
    end
end
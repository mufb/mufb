classdef Robot < simiam.ui.Drawable

% Copyright (C) 2013, Georgia Tech Research Corporation
% see the LICENSE file included with this software
    
    properties
        supervisor
    end
    
    methods
        function obj = Robot(parent, start_pose)
            obj = obj@simiam.ui.Drawable(parent, start_pose);
        end
        
        function attach_supervisor(obj, supervisor, pose)
            obj.supervisor = supervisor;
            supervisor.attach_robot(obj, pose);
        end
    end
    
end


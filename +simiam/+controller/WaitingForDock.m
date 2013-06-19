classdef WaitingForDock < simiam.controller.Controller
    
    properties
        %p
    end 
    
    properties (Constant)
        % I/O
        inputs = struct();
        outputs = struct('v', 0, 'w', 0);
    end
    
    methods
        
        function obj = WaitingForDock()
            obj = obj@simiam.controller.Controller('waiting_for_dock');
        end
    end
    
    methods
        
        function outputs = execute(obj, robot, state_estimate, inputs, dt)
            outputs = obj.outputs;
            outputs.v = 0;
            outputs.w = 0;
        end
        
    end
    
end
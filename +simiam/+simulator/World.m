classdef World < handle
    
% Copyright (C) 2013, Georgia Tech Research Corporation
% see the LICENSE file included with this software

    properties
        robots
        obstacles
        parent
        apps
        root_path
        base
        height_map
    end
    
    methods
        function obj = World(parent)
            obj.parent = parent;
            obj.robots = mcodekit.list.dl_list(); %struct('robot', {}, 'pose', {});
            obj.obstacles = mcodekit.list.dl_list(); %struct('obstacle', {}, 'pose', {});
            obj.apps = mcodekit.list.dl_list();
            obj.root_path = '';
            obj.base = [];
            obj.height_map = [];
        end
        
        function build_from_file(obj, root, file)
            
            % Read in XML file
            blueprint = xmlread(file);
            obj.root_path = root;
            
            % Parse XML file for robot configurations
            app_list = blueprint.getElementsByTagName('app').item(0);
            app = char(app_list.getAttribute('type'));
            
            r = str2func(strcat('simiam.app.', app));
            obj.apps.append_key(r(root));

            %%
            %robots config
            robot_list = blueprint.getElementsByTagName('robot');
            
            for k = 0:(robot_list.getLength-1)
               robot = robot_list.item(k);
               
               type = char(robot.getAttribute('type'));
               
               s = robot.getElementsByTagName('supervisor').item(0);
               spv = char(s.getAttribute('type'));
               goal = [str2double(s.getAttribute('goalX')),
                   str2double(s.getAttribute('goalY'))];
               
               pose = robot.getElementsByTagName('pose').item(0);
               x = str2double(pose.getAttribute('x'));
               y = str2double(pose.getAttribute('y'));
               theta = str2double(pose.getAttribute('theta'));         

               obj.add_robot(type, spv, x, y, theta, goal);
            end
            %%
            % Parse XML file for obstacle configurations
            obstacle_list = blueprint.getElementsByTagName('obstacle');
            
            for i = 0:(obstacle_list.getLength-1)
               obstacle = obstacle_list.item(i);
               
               pose = obstacle.getElementsByTagName('pose').item(0);
               x = str2double(pose.getAttribute('x'));
               y = str2double(pose.getAttribute('y'));
               theta = str2double(pose.getAttribute('theta'));
               
               geo = obstacle.getElementsByTagName('geometry').item(0);
               point_list = geo.getElementsByTagName('point');
               
               obstacle_geometry = zeros(point_list.getLength, 2);
               for j=0:(point_list.getLength-1)
                  point = point_list.item(j);
                  obstacle_geometry(j+1,1) = str2double(point.getAttribute('x'));
                  obstacle_geometry(j+1,2) = str2double(point.getAttribute('y'));
               end
               
               obj.add_obstacle(x, y, theta, obstacle_geometry);
               
            end
               
                           %%
            %base configuration
            baseXML = blueprint.getElementsByTagName('base').item(0);
            pose = baseXML.getElementsByTagName('pose').item(0);
            x = str2double(pose.getAttribute('x'));
            y = str2double(pose.getAttribute('y'));
            theta = str2double(pose.getAttribute('theta'));

            base_geo = baseXML.getElementsByTagName('geometry').item(0);
            base_point_list = base_geo.getElementsByTagName('point');

            base_geometry = zeros(base_point_list.getLength, 2);
            for j=0:(base_point_list.getLength-1)
                point = base_point_list.item(j);
                base_geometry(j+1,1) = str2double(point.getAttribute('x'));
                base_geometry(j+1,2) = str2double(point.getAttribute('y'));
            end


            pose = simiam.ui.Pose2D(x, y, theta);
            obj.base = simiam.base.Base(obj.parent, pose, base_geometry);
            
            %docks
            docks_list = baseXML.getElementsByTagName('dock');
            for k = 0:(docks_list.getLength-1)
               dock = docks_list.item(k);
               
               pose = dock.getElementsByTagName('pose').item(0);
               x = str2double(pose.getAttribute('x'));
               y = str2double(pose.getAttribute('y'));
               theta = str2double(pose.getAttribute('theta'));  
               
               geo = dock.getElementsByTagName('geometry').item(0);
               point_list = geo.getElementsByTagName('point');

               geometry = zeros(point_list.getLength, 2);
               for j=0:(base_point_list.getLength-1)
                    point = point_list.item(j);
                    geometry(j+1,1) = str2double(point.getAttribute('x'));
                    geometry(j+1,2) = str2double(point.getAttribute('y'));
               end
               
               obj.base.add_dock(x, y, theta, geometry);
            end
            
            
        end
        
        function add_base(obj, x, y, theta, geometry)
        end
        
        function add_height_map(obj, h)
           obj.height_map = h; 
        end
        
        function add_robot(obj, type, spv, x, y, theta, goal)
           pose = simiam.ui.Pose2D(x, y, theta);
           
           r = str2func(strcat('simiam.robot.', type));
           robot = r(obj.parent, pose);
           
           r = str2func(strcat('simiam.controller.', spv));
           supervisor = r(goal);
           
           supervisor.attach_robot(robot, pose);
           
%            parameter_file = fullfile(obj.root_path, 'parameters.xml');
%            [file, path, extension] = uigetfile(parameter_file, 'Pick a XML file with the parameters for the PID regulator.');
%            
%            parameter_file = fullfile(path, file);
%            supervisor.configure_from_file(parameter_file);
           
           s = struct('robot', robot, 'supervisor', supervisor, 'pose', pose);
           obj.robots.append_key(s);
           obj.apps.head_.key_.supervisors.append_key(supervisor);
        end
        
        function add_obstacle(obj, x, y, theta, geometry)
           pose = simiam.ui.Pose2D(x, y, theta);
           obj.obstacles.append_key(struct('obstacle', simiam.simulator.Obstacle(obj.parent, pose, geometry), 'pose', pose));
        end
           
    end
    
end

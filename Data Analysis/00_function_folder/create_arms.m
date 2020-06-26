% function arm_10R = create_arms(trial)
% %create_arms given a specific trial, constructs the 10R serial robot
% %representing a human torso-arm.
% %   This function, using Peter Corke toolbox and a Denavit-Hartenberg
% %   parametrization, builds a structure containing the left and right 10R
% %   serial robot objects. To get the DH table it uses the function 
% %	par_10R().
% 
% %% initialization of robot parameters
% par = par_10R(trial);
% %first omogeneous transform from xsens to our frame_0
% Tg0 = rt2tr(rotx(-pi/2), par.L5_pos); 
% 
% %% Costruction, right arm
% d3 = par.depth_shoulder.right;
% a3 = par.L5_shoulder.right;
% d6 = -par.upperarm.right;
% d8 = -par.forearm.right;
% d10 = par.hand;
% 
% th3_r = -pi/2 - par.theta_shoulder.right;
% al4_r = +pi/2 + par.theta_shoulder.right;
% 
% % serial links connection
% Link_r = [	... % L5-L5:				theta torso flexion  (pitch)
% 			Link('d', 0,	'a',	0,		'alpha', +pi/2,						'qlim',	[-pi/4, +pi/2]),...
% 			... % L5-L5:				theta torso twist 
% 			Link('d', 0,	'a',	0,		'alpha', -pi/2, 'offset', +pi/2,	'qlim',	[-pi/4, +pi/4]),...	
% 			... % L5-shoulder:			theta shoulder "raise" 
% 			Link('d', d3,	'a',	a3,		'alpha', +pi/2,	'offset', +th3_r,	'qlim', [-0.26, +0.26]),...
% 			... % shoulder1-shoulder2:	theta shoulder front opening
% 			Link('d', 0,	'a',	0,		'alpha', al4_r, 'offset', +pi/2,	'qlim', [-2.96, +pi/2]),...
% 			... % shoulder2-shoulder3:	theta shoulder lateral opening
% 			Link('d', 0,	'a',	0,		'alpha', -pi/2, 'offset', -pi/2,	'qlim', [-pi, +0.87]),...
% 			... % shoulder3-elbow1:		theta shoulder pronosupination
% 			Link('d', d6,	'a',	0,		'alpha', +pi/2,						'qlim', [-pi/2, +pi]),...
% 			... % elbow1-elbow2:		theta elbow flexion
% 			Link('d', 0,	'a',	0,		'alpha', +pi/2, 'offset', pi,		'qlim', [-0.17, 2.53]),...
% 			... % elbow2-wrist1:		theta forearm pronosupination
% 			Link('d', d8,	'a',	0,		'alpha', -pi/2,						'qlim', [-pi/2, pi]),...
% 			... % wrist1-wrist2:		theta wrist flexion
% 			Link('d', 0,	'a',	0,		'alpha', +pi/2, 'offset', +pi/2,	'qlim', [-pi/2, 1.22]),...
% 			... % wrist2-hand:			theta wrist (yaw)
% 			Link('d', d10,	'a',	0,		'alpha', +pi/2, 'offset', +pi/2,	'qlim', [-0.26, 0.26])];		
% 
% Right_Arm = SerialLink(Link_r, 'name', 'Right arm');
% Right_Arm.base = Tg0;
% 
% %% Costruction, left arm
% 
% d3 = -par.depth_shoulder.left;
% a3 = par.L5_shoulder.left;
% d6 = par.upperarm.left;
% d8 = par.forearm.left;
% d10 = par.hand;
% 
% th3_l = -pi/2 - par.theta_shoulder.left;
% al4_l = +pi/2 + par.theta_shoulder.left;
% 
% % serial links connection
% Link_l = [	... % L5-L5:				theta torso flexion  (pitch)
% 			Link('d', 0,	'a',	0,		'alpha', -pi/2,						'qlim',	[-pi/4, +pi/2]),...	
% 			... % L5-L5:				theta torso twist
% 			Link('d', 0,	'a',	0,		'alpha', +pi/2, 'offset', +pi/2,	'qlim',	[-pi/4, +pi/4]),...	
% 			... % L5-shoulder:			theta shoulder "raise" 
% 			Link('d', d3,	'a',	a3,		'alpha', -pi/2,	'offset', +th3_l,	'qlim', [-0.26, +0.26]),...	 
% 			... % shoulder1-shoulder2:	theta shoulder front opening
% 			Link('d', 0,	'a',	0,		'alpha', al4_l,	'offset', -pi/2,	'qlim', [-2.96, +pi/2]),...	
% 			... % shoulder2-shoulder3:	theta shoulder lateral opening
% 			Link('d', 0,	'a',	0,		'alpha', -pi/2, 'offset', -pi/2,	'qlim', [-pi, +0.87]),...	
% 			... % shoulder3-elbow1:		theta shoulder pronosupination
% 			Link('d', d6,	'a',	0,		'alpha', -pi/2, 'offset', +pi,		'qlim', [-pi/2, +pi]),...		
% 			... % elbow1-elbow2:		theta elbow flexion
% 			Link('d', 0,	'a',	0,		'alpha', -pi/2, 'offset', +pi,		'qlim', [-0.17, 2.53]),...		
% 			... % elbow2-wrist1:		theta forearm pronosupination
% 			Link('d', d8,	'a',	0,		'alpha', +pi/2,						'qlim', [-pi/2, pi]),...	
% 			... % wrist1-wrist2:		theta wrist flexion
% 			Link('d', 0,	'a',	0,		'alpha', -pi/2, 'offset', +pi/2,	'qlim', [-pi/2, 1.22]),...	
% 			... % wrist2-hand:			theta wrist (yaw)
% 			Link('d', d10,	'a',	0,		'alpha', +pi/2, 'offset', +pi/2,	'qlim', [-0.26, 0.26])];		
% 
% Left_Arm = SerialLink(Link_l, 'name', 'Left arm');
% Left_Arm.base = Tg0;
% 
% %% output struct definition
% arm_10R = struct('left', Left_Arm, 'right', Right_Arm);
% 
% end

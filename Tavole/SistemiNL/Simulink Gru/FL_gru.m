clear all
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 real
g = 9.81;
fprintf('lo stato iniziale considerato è \n:')

x0 = [0; 0; 0; 0; pi/4; pi/20; pi/4; pi/20];



x = [x1; x2; x3; x4; x5; x6; x7; x8; x9; x10]; 
fprintf('il sistema è dato da: \n')

f = [ x2;...
	  0;...
	  x4;...
	  0;...
	  x6;...
	  -2*(x10/x9)*x6+0.5*x8^2*sin(2*x5)-(g/x9)*sin(x5)*sin(x7);...
	  x8;...
	  -2*(x10/x9)*x8-2*x8*x6*cot(x5);...
	  x10;...
	  0];
g1 = [0;...
	  1;...
	  0;...
	  0;...
	  0;...
	  -cos(x5)*sin(x7)/x9;...
	  0;...
	  -cos(x7)/(sin(x5)*x9);...
	  0;...
	  0];
g2 = [0;...
	  0;...
	  0;...
	  1;...
	  0;...
	  -cos(x5)*cos(x7)/x9;...
	  0;...
	  -sin(x7)/(sin(x5)*x9);...
	  0;...
	  0];
g3 = [0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  1;...
	  0]
G = [g1 g2 g3];
y1 = x1
y2 = x3
y3 = x5
y = [y1;y2;y3];
[r_mimo,Lf_full_mimo, T, E] = relative_degree_mimo(f,G,y,x)
%% aumentiamo il sistema
syms x_ddot
x = [x;...
	 x_ddot]
f = [f+g1*x_ddot;...
		0]
g1 = [0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  1]
g2 = [g2;...
	   0]
g3 = [g3;...
	   0]
G = [g1 g2 g3];
[r_mimo,Lf_full_mimo, T, E] = relative_degree_mimo(f,G,y,x)
%% aumentiamo il sistema
syms y_ddot
x = [x;...
	 y_ddot]
f = [f+g2*y_ddot;...
		0]
g1 = [g1;...
	   0]
g2 = [0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  0;...
	  1]
g3 = [g3;...
	   0]
	G = [g1 g2 g3];
[r_mimo,Lf_full_mimo, T, E] = relative_degree_mimo(f,G,y,x)
%%
% syms l_ddot
% x = [x;...
% 	 l_ddot]
% f = [f+g3*y_ddot;...
% 		0]
% g1 = [g1;...
% 	   0]
% g3 = [0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  0;...
% 	  1]
%  g2 = [g2;...
% 		0]
% G = [g1 g2 g3];
% [r_mimo,Lf_full_mimo, T, E] = relative_degree_mimo(f,G,y,x)
%%define link of our serial links manipulator

%upper arm and forearm lenght
l_0 = 0.2;		%shoulder
l_1 = 0.5;		%upperarm
l_2 = 0.5;		%forearm
l_3 = 0.15; 	%hand

%add L1 and L8 to connect our arm to the neck and to the hand
%link definitions (to do)										link tra giunti
L1 = Link('d', 0, 'a', l_0, 'alpha', -pi/2);					%collo-spalla1:		theta collo
L2 = Link('d', 0, 'a', 0,	'alpha', +pi/2);					%spalla1-spalla2:	theta spalla pronosupinazione
L3 = Link('d', 0, 'a', 0,	'alpha', -pi/2, 'offset', +pi/2);	%spalla2-spalla3:	theta spalla spazzata orizzontale
L4 = Link('d', 0, 'a', l_1, 'alpha', +pi/2);					%spalla3-gomito:	theta spalla spazzata verticale
L5 = Link('d', 0, 'a', l_2, 'alpha', -pi/2);					%gomito-polso1:		theta gomito
L6 = Link('d', 0, 'a', 0,	'alpha', +pi/2);					%polso1-polso2:		theta polso pitch
L7 = Link('d', 0, 'a', 0,	'alpha', -pi/2, 'offset', -pi/2);	%polso2-polso3:		theta polso yaw
L8 = Link('d', l_3, 'a', 0, 'alpha', +pi/2);					%polso3-ee:			theta polso pronosupinazione


%serial links connection
bot = SerialLink ([L1 L2 L3 L4 L5 L6 L7 L8], 'name', '7R prova');

%plot of the 7R in its initial configuration
q0 = [0 0 0 0 0 0 0 0];		%initial config
q = q0;


%plot of the 7R in another configuration
q = q0;
for i=0:0.01:pi
	q(5) = i;
	bot.plot(q);
end
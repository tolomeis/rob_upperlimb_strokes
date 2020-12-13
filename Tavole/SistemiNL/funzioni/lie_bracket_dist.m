function [output] = lie_bracket_dist(D,D0,x)

%LIE_BRACKET_DIST computes lie bracket between two distributions
%   The two distributions should be row cell arrays

Dout = [];

% Lie bracket for each pair
for i = 1 : size(D,2)
   for j = 1 : size(D0,2)
       Dnow = lie_bracket(D(:,i), D0(:,j), x);
       Dout = [Dout Dnow];
   end
end

output = Dout;

end

function plotTSP(permutation, coordinates, s, varargin)

% plotTSP(permutation, coordinates, s, flag=0)
%
% Plots a TSP permutation given the coordinates of all the cities. s is the
% string s given to the plot command. flag determines the way in which the
% cities are labeled:
%    0: no label
%    1: labeled in visited order 
%    2: labeled with their original number
%
% % See also: plot, invTSP, fcnTSP, tableTSP

%************************************************************
%*                                                          *
%*   vgGA: The Virtual Gene Genetic Algorithm               *
%*                                                          *
%*   Copyright (c) All Rights Reserved                      *
%*   Manuel Valenzuela-Rend�n                               *
%*   valenzuela@itesm.mx                                    *
%*   http://homepages.mty.itesm.mx/valenzuela               *
%*                                                          *
%*   Tecnol�gico de Monterrey, Campus Monterrey             *
%*   Monterrey, N.L., Mexico                                *
%*                                                          *
%************************************************************


if length(varargin)>=1
   flag = varargin{1};
else
   flag = 0;
end

n = length(permutation);
xy = [];
for i=1:n
   xy = [xy;coordinates(permutation(i)+1,:)];
end
xy = [xy; xy(1,:)];
%axis([0 1 0 1])
if flag==0
   plot(xy(:,1),xy(:,2),s)
   %axis([0 1 0 1])
end
if flag==1
   % Label cities in visited order
   plot(xy(:,1),xy(:,2),s,...
      xy(:,1),xy(:,2),'.r',...
      xy(1,1),xy(1,2),'ok',...
      xy(2,1),xy(2,2),'sb')
   %axis([0 1 0 1])
   for i=1:n
      text(coordinates(permutation(i)+1,1)+0.01,coordinates(permutation(i)+1,2),...
         sprintf('%d',i), 'FontSize', 8)
   end
end
if flag==2
   % Label cities with orginal number
   plot(xy(:,1),xy(:,2),s,...
      xy(:,1),xy(:,2),'.r',...
      xy(1,1),xy(1,2),'ok',...
      xy(2,1),xy(2,2),'sb')
   %axis([0 1 0 1])
   for i=1:n
      text(coordinates(permutation(i)+1,1)+0.01,coordinates(permutation(i)+1,2),...
         sprintf('%d',permutation(i)), 'FontSize', 8)
   end
end


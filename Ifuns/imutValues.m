function res = imutValues(p, m1, m2, varargin)

% imutValues(p, m1, m2, B=2)
%
% Returns a vector of all the possible results of the
% mutation of digits m1+1 through m2.

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
 
  if length(varargin) >= 1
    B = varargin{1};
  else
    B = 2;
  end

  delta = m2 - m1;
  ran = [0:1:B^(delta)-1];
  res = ones(size(ran))*(ilow(p,m1,B)+ihigh(p,m2,B)) + B^(m1)*ran;




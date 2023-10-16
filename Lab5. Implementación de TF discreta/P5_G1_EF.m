clc
clear

% y/u = 0.36254/(z-0.8187)
% y*(1-0.8187*Z^-1) = 0.36254*u*Z^-1
%y=0.36254*u1+0.8187*y1

function y = fcn(u)
    persistent u0 u1 y0 y1
    
    if isempty(u0)
        u1=0;u0=0;y1=0;y0=0;
    end
    
    u1=u0;y1=y0;
    u0=u;
    y=0.36254*u1+0.8187*y1;
    y0=0;
end
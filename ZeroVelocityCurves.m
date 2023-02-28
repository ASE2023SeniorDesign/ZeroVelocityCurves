function ZeroVelocityCurves(C, mu)
% Input Jacobi Constant, C
% Input gravitational parameter mu of the system

% Refer to Dr. Russell Celestial Mechanics Course Slide 370! 

x = -2:.001:2;
y = -2:.001:2;

[X,Y] = meshgrid(x,y);

% No Z direction for SC position! (I omitted it for 2D)
r1 = sqrt((X + mu).^2 + Y.^2);
r2 = sqrt((X + mu - 1).^2 + Y.^2); 

% solves for the vlaue of 
for i = 1:1:length(x)
    for j = 1:1:length(y)
        v_squared(i,j) = X(i,j)^2 + Y(i,j)^2 + 2*(1-mu)/r1(i,j) + 2*mu/r2(i,j) - C;
    end
end

figure(1)
contour(X,Y,v_squared)
grid on
title('Zero Velocity Curve')
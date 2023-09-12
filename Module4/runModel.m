function [T, X] = runModel(ep, a, b, tspan, y0)
    dvdt = @(v, w) v - v^3/3 - w;
    dwdt = @(v, w) ep*(v + a -b*w);
    [T, X] = ode45(@(t,x) [dvdt(x(1), x(2)); dwdt(x(1), x(2))], tspan, y0);
end


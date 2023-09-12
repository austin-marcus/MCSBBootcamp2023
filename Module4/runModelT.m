function [T, X] = runModelT(ep, a, b, tspan, y0, Itspan)
    IO = 1.0;
    I = @(t) IO*(t>Itspan(1)).*(t<Itspan(2));
    dvdt = @(t, v, w) v - v^3/3 - w + I(t);
    dwdt = @(t, v, w) ep*(v + a -b*w);
    [T, X] = ode45(@(t,x) [dvdt(t, x(1), x(2)); dwdt(t, x(1), x(2))], tspan, y0);
end
function [T, X] = runModelD(ep, a, b, tspan, y0, TI)
    odefunc = @(t, x) buildArray(t, x, ep, a, b, TI);
    [T, X] = ode45(odefunc, tspan, y0);
end

function [X] = buildArray(t, x, ep, a, b, TI)
    
    X = zeros(20, 1);
    for i = 1:10
        IO = 1.0;
        Itspan = [40 47];
        I = @(t) IO*(t>Itspan(1)).*(t<Itspan(2));
        D = 0.9;
        if i == TI
            dvdt = @(v1, v2, v3, w) v1 - v1^3/3 - w + D*(v2 - 2*v1 + v3) + I(t);
        else
            dvdt = @(v1, v2, v3, w) v1 - v1^3/3 - w + D*(v2 - 2*v1 + v3);
        end
        dwdt = @(v, w) ep*(v + a -b*w);

        X(i) = dvdt(x(i), x(mod(i-1-1, 10)+1), x(mod(i+1-1, 10)+1), x(i+10));
        X(i+10) = dwdt(x(i), x(i+10));
    end
end
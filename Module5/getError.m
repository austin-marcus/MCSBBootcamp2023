function [SSE] = getError(index, N0, lambda, theta, alpha)
    dNdt = @(N) lambda*N*(1-(N/theta^2)^alpha);
    [T, X] = ode45(@(t,x) dNdt(x(1)), [0 30 59 89 118 148 183], N0);
    times = [0 30 59 89 118 148 183];
    % data = [
    %     0.00 0.09 0.00 0.06;
    %     0.07 0.12 0.00 0.07;
    %     0.00 0.20 0.00 0.14;
    %     0.00 0.38 0.00 0.27;
    %     0.00 0.58 0.00 0.48;
    %     0.00 0.76 0.00 0.71;
    %     0.00 1.10 0.00 1.06;
    % ];
    data = [0.09 0.12 0.20 0.38 0.58 0.76 1.10];
    % [SSE] = sum( (X-data(:,index)).^2 );
    % display(X)
    SSE = sum( (X'-data).^2 );
end
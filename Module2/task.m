% How much caffeine is there in the jar?

% n - number of days
% x - fraction of caffeinated 

nMax = 50; % max number of days to simulate

rs = 0:0.05:3;
x = zeros(length(rs),nMax); % fraction caffeinated
K =0.6;
x(:,1) = 0.2; % initial fraction caffeinated

% rs = [0.1, 2.1, 2.5];
% Ks = [0.6, 0.6, 0.6];

for i=1:length(rs)
    r = rs(i);
    for n=2:nMax
        
        x(i, n) = x(i, n-1) + r*(1 - x(i, n-1)/K)*x(i, n-1);
        
    end % finished loop through days
end

% THE MODEL ^
% ------------------------------------------
% THE BEHAVIOR / THE OUTPUT ? 

figure(1); 
hold on;
for i=1:length(rs)
    plot(x(i, :));
end
hold off;

figure(2);
hold on;
for i=1:length(rs)
    p1 = floor(nMax/2);
    p2 = nMax;
    for y=x(i,p1:p2)
        scatter(rs(i), y, 20, "black");
    end
end
hold off;
xlim([rs(1) rs(length(rs))]);
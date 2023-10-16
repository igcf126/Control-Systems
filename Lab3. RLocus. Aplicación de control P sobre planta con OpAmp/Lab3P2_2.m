clear
clc

sys = tf(1000, [1 110 1000])

step(sys)
[y,t] = step(sys);
ymax = max(y)
i = find(y==ymax);
Tp = t(i)

% PO = 100*(ymax-y(end))/y(end)
PO = 100*abs(ymax-1)/1

% j = find(abs(y-y(end))/y(end)>0.02)
j = find(abs(y-1)/1>0.02);
Ts = t(max(j))
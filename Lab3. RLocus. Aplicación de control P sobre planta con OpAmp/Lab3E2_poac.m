clear
clc

sys = tf(2000, [1 110 3000]);

poac = readtable('poac.txt')
[y,t] = step(sys);

time = poac.t;
V = poac.V;

plot(t, y, 'k')
hold on
plot(time, V, 'y-.')

%axis([0 0.12 0 1.2])
title('Gráfica respuesta a Step')
xlabel('Tiempo (s)')
ylabel('Magnitud (V)')
legend('Función de transferencia','Experimento')
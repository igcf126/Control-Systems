clear
clc

sys = tf(14000, [1 110 15000]);

po20 = readtable('po20.txt')
[y,t] = step(sys);

time = po20.t;
V = po20.V;

plot(t, y, 'k')
hold on
plot(time, V, 'y-.')

%axis([0 0.12 0 1.2])
title('Gráfica respuesta a Step')
xlabel('Tiempo (s)')
ylabel('Magnitud (V)')
legend('Función de transferencia','Experimento')
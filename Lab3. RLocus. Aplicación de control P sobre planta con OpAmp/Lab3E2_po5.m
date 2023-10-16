clear
clc

sys = tf(5000, [1 110 6000]);

po5 = readtable('po5.txt')
[y,t] = step(sys);

time = po5.t;
V = po5.V;

plot(t, y, 'k')
hold on
plot(time, V, 'y-.')

%axis([0 0.12 0 1.2])
title('Gráfica respuesta a Step')
xlabel('Tiempo (s)')
ylabel('Magnitud (V)')
legend('Función de transferencia','Experimento')
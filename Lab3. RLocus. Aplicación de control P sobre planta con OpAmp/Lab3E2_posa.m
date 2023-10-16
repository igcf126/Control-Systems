clear
clc

sys = tf(1000, [1 110 2000]);

posa = readtable('posa.txt')
[y,t] = step(sys);

time = posa.t;
V = posa.V;

plot(t, y, 'k')
hold on
plot(time, V, 'y-.')

%axis([0 0.12 0 1.2])
title('Gráfica respuesta a Step')
xlabel('Tiempo (s)')
ylabel('Magnitud (V)')
legend('Función de transferencia','Experimento')
clear
clc

sys = tf(10000, [1 110 10000]);

F0002CH1 = readtable("F0002CH1.csv");
[y,t] = step(sys);

time = F0002CH1.t;
Vo = F0002CH1.V;

plot(t, y, 'k')
hold on
plot(time, Vo, 'y-.')

axis([0 0.12 0 1.2])
title('Gráfica respuesta a Step')
xlabel('Tiempo (s)')
ylabel('Magnitud (V)')
legend('Función de transferencia','Experimento')
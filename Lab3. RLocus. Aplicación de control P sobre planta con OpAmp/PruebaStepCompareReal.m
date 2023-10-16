clear
clc

sys = tf(1000, [1 110 2000]);

F0002CH1 = readtable("F0001CH1.xlsx");
[y,t] = step(sys);

time = F0002CH1.t;
Vo = F0002CH1.V;

plot(time, Vo, 'y-.')
hold on
plot(t, y, 'k')

%axis([0 0.12 0 1.2])
title('Gráfica respuesta a Step')
xlabel('Tiempo (s)')
ylabel('Magnitud (V)')
legend('Experimento', 'Función de transferencia')
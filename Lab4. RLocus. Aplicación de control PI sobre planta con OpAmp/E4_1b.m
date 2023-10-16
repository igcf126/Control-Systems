clear
clc

sys = tf(51, [1 10 51]);

LTStep = readtable("E4_1b.txt");
[y,t] = step(sys);

time = LTStep.time;
Vo = LTStep.Vo;

plot(t, y, 'k')
hold on
plot(time, Vo, 'y-.')

title('Gráfica respuesta a Step')
xlabel('Tiempo (s)')
ylabel('Magnitud (V)')
legend('Función de transferencia','Experimento')
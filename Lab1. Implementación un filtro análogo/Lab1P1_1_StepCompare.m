clear
clc

sys = tf(10000, [1 110 10000]);

LTStep = readtable("Step1.txt");
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
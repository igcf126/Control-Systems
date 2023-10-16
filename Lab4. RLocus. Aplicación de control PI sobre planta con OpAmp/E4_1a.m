clear
clc

sys = tf(5102, [1 100 5102]);

LTStep = readtable("E4_1a.txt");
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
clear
clc

sys = tf(10000, [1 110 10000]);

[Mag, Phase, Wout] = bode(sys, 'k-.');
Mag = Mag(:);
LogMag = 20*log10(Mag/1); % en dB
Phase = Phase(:);

LTBode = readtable("Bode1.xlsx");


freqRad = LTBode.FreqRad;
Magnitud = LTBode.Magnitud;
Fase = LTBode.Fase;

subplot(2,1,1),semilogx(Wout, LogMag, 'k')

hold on
grid on

subplot(2,1,1),semilogx(freqRad, Magnitud, 'y-.'),title('Diagrama de magnitud de Bode')
legend('Función de transferencia','Experimento'),ylabel('Magnitud (dB)'),xlabel('Frecuencia (rad/s)')

subplot(2,1,2),semilogx(Wout, Phase, 'k')

hold on
grid on

subplot(2,1,2),semilogx(freqRad, Fase, 'y-.'),title('Diagrama de fase de Bode')
legend('Función de transferencia','Experimento'),ylabel('Fase (grados)'),xlabel('Frecuencia (rad/s)')

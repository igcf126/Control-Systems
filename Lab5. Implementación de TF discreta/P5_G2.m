clc
clear

G2 = tf(200, [1 14 100])

TFd40 = c2d(G2, 0.04)
TFd300 = c2d(G2, 0.3)
TFd500 = c2d(G2, 0.5)

step(G2)
hold on
step(TFd40)
step(TFd300)
step(TFd500)
legend('Continuo', '40 ms', '300 ms', '500 ms')
axis([0 1.5 0 2.2])
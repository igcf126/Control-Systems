clc
clear

G1 = zpk ([], -5, 10)

TFd40 = c2d(G1, 0.04)
TFd300 = c2d(G1, 0.3)
TFd500 = c2d(G1, 0.5)

step(G1)
hold on
step(TFd40)
step(TFd300)
step(TFd500)
legend('Continuo', '40 ms', '300 ms', '500 ms')
axis([0 1.5 0 2.1])
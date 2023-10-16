clear
clc

sys = tf(10000, [1 110 10000])

bode(sys)
[mag, ph, w] = bode(sys);

maglinear = mag(:);
phlinear = ph(:);

i = find(abs(maglinear-0.7)/0.7<0.07);

wc = w(i)
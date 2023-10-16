clear
clc

%% Declaración de variables para sistema dinámico rotacional accionado por motor, conectado a través de banda elástica. 
% Como referencia se pueden ver las dos fuentes a continuación:
% Ver: http://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling
% Ver: https://www.researchgate.net/profile/Ibraheem_Ibraheem3/post/Experiments_are_presented_assuming_nonlinear_friction_however_there_is_not_any_evidence_of_what_type_of_such_friction_is_presented_in_the_testbed/attachment/5b0e7059b53d2f63c3cef2ce/AS%3A631920186650625%401527672921693/download/Nonlinear_Modeling_and_Identification_of.pdf
%
% Estoy tomando el modelo usado en ctms, inicialmente usando sus valores.
% Pero añadí condiciones de fricción a partir de lo que recomienda el paper
% referenciado. 
%
% Sin embargo, las ecuaciones del manejo de la fuerza de contacto estático,
% en el paper me parece qeu no toman en consideración que el signo de dicha
% fuerza debe ser en el sentido contrario a la aplicada y que a su vez
% nunca es mayor al resto de fuerzas aplicadas en reposo. Además, en
% simulaciones tuve problemas cuando utilicé la función signo, por
% excesivos cruces por cero. 
%
%Por esto estoy modificando la manera en que aplico ambas fuerzas de
%fricción:
%
% 1: estoy manejando la fricción dinámica como T=Tdin*tanh(100*w). Esto es
% aprovechando tanh como una función que aproxima de forma suave la función
% de signo y usando 100 para hacer más rápida la transición. (Tdin es el
% torque de rozamiento dinámico)
%
% 2: estoy aplicando el torque de contacto como un deadzone para el torque
% de entrada al sistema. Y utilizando un switch dependiente, de manera que
% dicho deadzone solo se aplique cuando el sistema en cuestión esté en
% reposo. 

L  =  0.02; % H   electric inductance
R  =  0.47; % Ohm  electric resistance
 
 
Jm  =  0.0003; % kg.m^2   moment of inertia of the rotor
Bm  =  0.00015; % (N.m)/(rad/s)   motor viscous friction constant
% Fricción dinámica y estática motor.  

% Cambié Ke y a0M para que tengan una fórmula para lograr lo esperado en la resp a step 
Ke =  (sqrt(1-4900*Bm*R)+1)/70;%0.1; % V/(rad/sec)  electromotive force constant
Kt =  Ke; % N.m/Amp  motor torque constant

a1M = 0; %0.1; % N.m min torque para iniciar mov en el motor. 
a0M = 3/7*Kt/R; %0.7*a1M; % (N.m)/(rad/s) torque de fricción motor debido a la velocidad

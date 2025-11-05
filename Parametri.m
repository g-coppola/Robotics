clear
%Lunghezza dei bracci 
a1 = 1;
a2 = 0.8;
L = [a1;a2];

%Masse
m1 = 1.2;
m2 = 0.8;

%Asse di rotazione
l1 = 0.5;
l2 = 0.4;

%Inerzie
I1 = 1/10;
I2 = 16/325;

%Istanti di tempo
T = [10;30];

%Punti 
P1 = [0.5; 0.3];
P2 = [1.5; 0.3];

%Gravità
g = 9.8;

%Condizioni iniziali
Q = twolink_inverse(L,P1);
q10 = Q(1);
q20 = Q(2);

%Calcolo dei parametri dinamici
bc11 = I1+I2+m1*l1^2+m2*(a1^2+l2^2);
bc12 = I2+m2*l2^2;
bc21 = bc12;
bc22 = m2*l2^2+I2;
BC = [bc11 bc12; bc21 bc22];

bv11 = 2*a1*m2*l2;
bv12 = a1*m1*l2;
bv21 = bv12;
bv22 = 0;
BV = [bv11 bv12; bv21 bv22];

H = -m2*a1*l2;

G1 = (m1*l1+m2*a1)*g;
G2 = m2*l2*g;

%masse fittizie
mm1 = 1.15;
mm2 = 0.73;

%Stima vettori gravità
GG1 = (mm1*l1+mm2*a1)*g;
GG2 = mm2*l2*g; 

%Stima forze apparenti
HH = -mm2*a1*l2;

Simulatore

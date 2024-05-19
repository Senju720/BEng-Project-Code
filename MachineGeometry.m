%Variables
nPoles = 16;
thetaP = 2*pi/nPoles;
thetaA = 3*pi/180;
thetaB = 19.5*pi/180;
r1 = 154;
r2 = 184; 


% Initialising arrays with zeros
A1 = zeros(nPoles/2, 1);
A2 = zeros(nPoles/2, 1);
B1 = zeros(nPoles/2, 1);
B2 = zeros(nPoles/2, 1);
A3 = zeros(nPoles/2, 1);
A4 = zeros(nPoles/2, 1);
B3 = zeros(nPoles/2, 1);
B4 = zeros(nPoles/2, 1);

A1x = zeros(nPoles/2, 1);
A2x = zeros(nPoles/2, 1);
B1x = zeros(nPoles/2, 1);
B2x = zeros(nPoles/2, 1);
A3x = zeros(nPoles/2, 1);
A4x = zeros(nPoles/2, 1);
B3x = zeros(nPoles/2, 1);
B4x = zeros(nPoles/2, 1);

A1y = zeros(nPoles/2, 1);
A2y = zeros(nPoles/2, 1);
B1y = zeros(nPoles/2, 1);
B2y = zeros(nPoles/2, 1);
A3y = zeros(nPoles/2, 1);
A4y = zeros(nPoles/2, 1);
B3y = zeros(nPoles/2, 1);
B4y = zeros(nPoles/2, 1);

%initialize main x and y arrays
X = zeros(8*nPoles/2, 1);
Y = zeros(8*nPoles/2, 1);

%loop to generate all points

for loop = 1:nPoles/2
    thetaLoop = (loop-1)*2*thetaP;
    A1(loop) =  pi/2 + thetaA + thetaLoop;
    A2(loop) =  pi/2 + thetaA + thetaLoop;
    B1(loop) =  pi/2 + thetaB + thetaLoop;
    B2(loop) =  pi/2 + thetaB + thetaLoop;

    A3(loop) =  pi/2 - thetaA + thetaLoop;
    A4(loop) =  pi/2 - thetaA + thetaLoop;
    B3(loop) =  pi/2 - thetaB + thetaLoop;
    B4(loop) =  pi/2 - thetaB + thetaLoop;

    A1x(loop) = r1*sin(A1(loop));
    A2x(loop) = r2*sin(A2(loop));
    A3x(loop) = r1*sin(A3(loop));
    A4x(loop) = r2*sin(A4(loop));
    B1x(loop) = r1*sin(B1(loop));
    B2x(loop) = r2*sin(B2(loop));
    B3x(loop) = r1*sin(B3(loop));
    B4x(loop) = r2*sin(B4(loop));

    A1y(loop) = r1*cos(A1(loop));
    A2y(loop) = r2*cos(A2(loop));
    A3y(loop) = r1*cos(A3(loop));
    A4y(loop) = r2*cos(A4(loop));
    B1y(loop) = r1*cos(B1(loop));
    B2y(loop) = r2*cos(B2(loop));
    B3y(loop) = r1*cos(B3(loop));
    B4y(loop) = r2*cos(B4(loop));

end

%Array concantenation
X = [A1x; A2x; A3x; A4x; B1x; B2x; B3x; B4x];
Y = [A1y; A2y; A3y; A4y; B1y; B2y; B3y; B4y];

%Scatter plot
scatter(X, Y);
title('Scatter Plot');
xlabel('X');
ylabel('Y');
grid on;

xlim([-200, 200]);
ylim([-200, 200]);



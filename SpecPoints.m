clc;
close all;
clear all;

x_p1 = -0.033;
y_p1 = 0.02; 
x_p2 = 0; %coordinate of the center coil 2
y_p2 = 0.058; 
x_p3 = 0.033; % coordinate of the center coil 3
y_p3 = 0.02; 
x_p4 = 0.033; % coordinate of the center coil 4
y_p4 = -0.02;
x_p5 = 0; % coordinate of the center coil 5
y_p5 = -0.058; 
x_p6 = -0.033; % coordinate of the center coil 6
y_p6 = -0.02;


poz1 = 1; % coil 1 orientation
poz2 = 3; % coil 2 orientation
poz3 = 2; % coil 3 orientation
poz4 = 2; % coil 4 orientation
poz5 = 4; % coil 5 orientation
poz6 = 1; % coil 6 orientation




gridSize = 0.2; % Size of the grid for plotting (meters)
numPoints = 100; % Number of points in the grid
d = 0.041; % Separation between the two wires (meters)
I = 225; % Current in the wires (Ampere)
Nt = 20; % Number of turns
 

% Call the fieldCalc2 function to calculate the magnetic field components
[Bx_total1, By_total1, Bz1, B_total1] = fieldCalcArray(x_p1, y_p1, numPoints, d, I, Nt, poz1);
[Bx_total2, By_total2, Bz2, B_total2] = fieldCalcArray(x_p2, y_p2, numPoints, d, I, Nt, poz2);
[Bx_total3, By_total3, Bz3, B_total3] = fieldCalcArray(x_p3, y_p3, numPoints, d, I, Nt, poz3);
[Bx_total4, By_total4, Bz4, B_total4] = fieldCalcArray(x_p4, y_p4, numPoints, d, I, Nt, poz4);
[Bx_total5, By_total5, Bz5, B_total5] = fieldCalcArray(x_p5, y_p5,  numPoints, d, I, Nt, poz5);
[Bx_total6, By_total6, Bz6, B_total6] = fieldCalcArray(x_p6, y_p6, numPoints, d, I, Nt, poz6);

% adding all the components
By_total = By_total1 + By_total2 + By_total3 + By_total4 + By_total5 + By_total6; 
Bx_total = Bx_total1 + Bx_total2 + Bx_total3 + Bx_total4 + Bx_total5 + Bx_total6;

B_total = sqrt(Bx_total.^2 + By_total.^2);


% Create a grid of points for plotting
%[x, y] = meshgrid(linspace(-gridSize, gridSize, numPoints), linspace(-gridSize, gridSize, numPoints));

 x = linspace(-0.2,0.2,200)*1000;
   y = linspace(-0.2,0.2, 200);

% Assuming B_total is calculated correctly and is a 2D array
% x is your vector of x-coordinates

% Select the middle row for y = 0 or closest to it
middleIndex = round(size(B_total, 1) / 2); % Assuming y = 0 is at the middle
selectedB_total = B_total(middleIndex, :); % This selects the B_total values along the central y value

figure;
plot(x, selectedB_total); % Plotting B_total against x
title('Magnetic Field Magnitude (B_total) against X');
xlabel('X-axis (mm)');
ylabel('Magnetic Field Strength (Tesla)');

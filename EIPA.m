%{
Author: Maharshi Gurjar 
ELEC 4700 - Finite Difference modeling of the harmonic wave equation in 2D
%}
clc; close all; clear;
set(0, 'DefaultFigureWindowStyle', 'docked')

nx = 50;
ny = 50;

M = sparse(nx*ny,nx*ny);

for i = 1:nx
    for j = 1:ny
        
        n = j + (i-1)*ny;
        
        if (i == 1 || i == nx ||j == 1 || j == ny)
            M(n,n) = 1;
        else
            M(n, n) = -4; % middle
            M(n, n+1) = 1; % left 
            M(n, n-1) = 1; % right 
            M(n, n+ny) = 1; % first
            M(n, n-ny) = 1; % last
        end
        
    end
    spy(M)
    pause(0.01)
end
figure(1) 
spy(M)
[E, D] = eigs(M, 9, 'SM');
grid on;

new = zeros(nx, ny, 9);
figure(2)
for m = 1:9
   new(:, :, m) = reshape(E(:, m), nx, ny);
   subplot(3, 3, m)
   surf(new(:, :, m))
end
grid on;

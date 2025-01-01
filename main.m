%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Signal Generator                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Visualize harmonic signals and how they can be used to create a resulting
% harmonic - essentially generate any waveform, composed of a sum of simple
% "x(t) = A * cos(2 * π * f * t) + ϕ" equations.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Folder Structure:
%   > main.m - this file
%   > pages - contains the layouts & page logic
%       -> homePage.m - home page, view docs & open generator
%       -> generatorPage.m - generator page, create the signals & view plot
%   > lib - misc. pieces of logic & resources
%       -> openGenerator.m / openDocs.m - self explanatory
%       -> createHarmonic - takes in the params of the eq., and builds it
%       -> createHarmonicString - builds the 'pretty' repr. of the eq.
%       -> createHarmonicFromString - reconstructs the value of the eq.,
%                           starting from the 'pretty' representation.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Repo Link: https://github.com/davidp-ro/matlab_signal_generator
% 
% CAG 2024-2025, David Pescariu, UTCN/ETTI
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
close all;

homePage();

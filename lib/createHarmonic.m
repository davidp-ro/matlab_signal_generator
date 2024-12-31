%% createHarmonic
% Create a harmonic signal using the formula: x(t) = A * (2 * π * f * t) + ϕ
% 
% Inputs:
%   A   - Amplitude, >= 1, numeric
%   f   - Frequency, >= 1, numeric
%   t   - Time value, numeric
%   phi - Phase, numeric
% 
% Outputs:
%   h   - Harmonic signal, x(t)
function h = createHarmonic(A, f, t, phi)
    arguments
        A (1, :) {mustBeNumeric}
        f (1, :) {mustBeNumeric}
        t {mustBeNumeric}
        phi {mustBeNumeric}
    end

    h = A * cos(2 * pi * f * t + phi);
end
%% createHarmonicString
% Create a string to represent a harmonic: A × cos(2 × π × f × t) + ϕ
% 
% Inputs:
%   A   - Amplitude, >= 1, numeric
%   f   - Frequency, >= 1, numeric
%   t   - Time value, numeric
%   phi - Phase, numeric
% 
% Outputs:
%   s   - Harmonic signal, string
function s = createHarmonicString(A, f, t, phi)
    arguments
        A (1, :) {mustBeNumeric}
        f (1, :) {mustBeNumeric}
        t {mustBeNumeric}
        phi {mustBeNumeric}
    end

    if phi ~= 0
        s = A + " × " + "cos(2 × π × " + f + " × t) + " + phi;
    else
        s = A + " × " + "cos(2 × π × " + f + " × t)";
    end
end
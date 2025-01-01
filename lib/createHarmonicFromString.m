%% createHarmonicFromString
% Reconstruct a harmonic signal using the formula: x(t) = A * cos(2 * π * f * t)
% + ϕ, starting from the harmonic string created by createHarmonicString,
% in the form "A × cos(2 × π × f × t) + ϕ"
% 
% Inputs:
%   s   - Harmonic signal string
%   t   - Time value, numeric
% 
% Outputs:
%   h   - Harmonic signal, x(t)
function h = createHarmonicFromString(s, t)
    arguments
        s string
        t {mustBeNumeric}
    end

    sp = split(s, "×");

    A = str2double(sp(1));
    f = str2double(sp(4));
    phi = 0;

    if contains(sp(5), "+")
        % We have a phase as well, parse it
        sp2 = split(sp(5), "+");
        phi = str2double(sp2(2));
    end

    % disp(A + ", " + f + ", " + phi); % Debug Log
    h = createHarmonic(A, f, t, phi);
end

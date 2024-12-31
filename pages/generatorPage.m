%% generatorPage.m
% Creates the layout for the signal generator page.
function generatorPage()
    generatorContainer = uifigure('Name', 'Signal Generator - Generate', ...
        'NumberTitle', 'off', ...
        'Resize', 'off', ...
        'ToolBar', 'none', ...
        'Position', [500 500 1280 720] ...
    );

    % --- Logic ---

    signalTexts = ["5 * cos(2πt)"];
    signalDefs = [3 -1 5 2 -6 4 -3];

    % --- UI ---

    % Grid definition
    mainGrid = uigridlayout(generatorContainer);
    mainGrid.RowHeight = {'1x'};
    mainGrid.ColumnWidth = {200,'1x'};

    % Left column (grid) definition
    leftCol = uigridlayout(mainGrid);
    leftCol.RowHeight = {'1x', 80};
    leftCol.ColumnWidth = {'1x'};

    % >> [Right Column] Plot
    ax = uiaxes(mainGrid);
    ax.Layout.Column = 2;
    plotSignals(ax, signalDefs);

    % >> [Left Column] Signal List
    signals = uilistbox(leftCol);
    signals.Items = signalTexts;
    signals.ItemsData = signalDefs;
    signals.Layout.Row = 1;
    signals.Layout.Column = 1;

    % >> [Left Column] Buttons
    buttons(leftCol, ax, signalTexts, signalDefs);
end

%% buttons
% Add the buttons to the left column + callbacks
function buttons(leftCol, ax, signalTexts, signalDefs)
    col = uigridlayout(leftCol);
    col.RowHeight = {'1x', '1x'};
    col.ColumnWidth = {'1x'};

    addButton = uibutton(col);
    addButton.Layout.Row = 1;
    addButton.Layout.Column = 1;
    addButton.Text = "Add Signal";

    removeButton = uibutton(col);
    removeButton.Layout.Row = 2;
    removeButton.Layout.Column = 1;
    removeButton.Text = "Remove Selected Signal";
end

%% plotSignals
% Plot the signals from signalDefs
function plotSignals(ax, signalDefs)
    % plot(ax, signalDefs);
    % Parameters
    Fs = 1e4; % Sampling frequency in Hz
    T = 1/4; % Duration in seconds
    t = 0:1/Fs:T; % Time vector
    
    % Define harmonics (amplitude, frequency, phase)
    A = [1, 0.5, 0.3]; % Amplitudes
    f = [50, 120, 200]; % Frequencies in Hz
    phi = [0, pi/4, pi/2]; % Phases in radians
    
    % Initialize the signal
    x = zeros(size(t));
    
    % Add harmonics
    for k = 1:length(A)
        x = x + A(k) * cos(2 * pi * f(k) * t + phi(k));
    end
    
    % Plot the result
    plot(ax, t, x);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;

end

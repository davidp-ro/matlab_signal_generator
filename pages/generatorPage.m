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

    signalTexts = ["Add Signals using the Controls below"];
    signalDefs = zeros(size(getTimeVector));

    % --- UI ---

    % Grid definition
    mainGrid = uigridlayout(generatorContainer);
    mainGrid.RowHeight = {'1x'};
    mainGrid.ColumnWidth = {250,'1x'};

    % Left column (grid) definition
    leftCol = uigridlayout(mainGrid);
    leftCol.RowHeight = {'1x', 220};
    leftCol.ColumnWidth = {'1x'};

    % >> [Right Column] Plot
    ax = uiaxes(mainGrid);
    ax.Layout.Column = 2;
    ax.XGrid = "on";
    ax.YGrid = "on";
    plotSignals(ax, signalDefs);

    % >> [Left Column] Signal List
    signals = uilistbox(leftCol);
    signals.Items = signalTexts;
    signals.ItemsData = signalDefs;
    signals.Layout.Row = 1;
    signals.Layout.Column = 1;

    % >> [Left Column] Control Panel
    bottomPanel(generatorContainer, leftCol, ax, signals, signalTexts, signalDefs);
end

%% buttons
% Add the control panel to the left column + callbacks
function bottomPanel(generatorContainer, leftCol, ax, signals, signalTexts, signalDefs)
    col = uigridlayout(leftCol);
    col.RowHeight = {130, '1x', '1x'};
    col.ColumnWidth = {'1x'};

    inputRow = uigridlayout(col);
    inputRow.RowHeight= {'1x', '1x', '1x'};
    inputRow.ColumnWidth  = {'1x'};

    uilabel(inputRow, "Text", "Properties for the new signal:");
    a = uieditfield(inputRow, "numeric", "ValueDisplayFormat", "Amplitude [V]: %d");
    f = uieditfield(inputRow, "numeric", "ValueDisplayFormat", "Frequency [Hz]: %d");
    p = uieditfield(inputRow, "numeric", "ValueDisplayFormat", "Phase [rad]: %d");

    function addSignal()
        amplitude = a.Value;
        frequency = f.Value;
        phase = p.Value;
        disp("addSignal( A=" + amplitude + ", f=" + frequency + ", p=" + phase + " )");

        if amplitude < 1
            uialert(generatorContainer, "The Amplitude must be at least 1.", "Invalid Harmonic Signal");
            return;
        end

        if frequency < 1
            uialert(generatorContainer, "The Frequency must be at least 1.", "Invalid Harmonic Signal");
            return;
        end

        t = getTimeVector;
        harmonic = createHarmonic(amplitude, frequency, t, phase);
        harmonicStr = createHarmonicString(amplitude, frequency, t, phase);

        disp("addSignal -> Adding: " + harmonicStr);

        signalTexts = [signalTexts, harmonicStr];
        signalDefs = signalDefs + harmonic;

        signals.Items = signalTexts;
        signals.ItemsData = signalDefs;

        plotSignals(ax, signalDefs);
    end

    addButton = uibutton(col, "ButtonPushedFcn", @(src, ev) addSignal());
    addButton.Layout.Row = 2;
    addButton.Layout.Column = 1;
    addButton.Text = "Add Signal";

    function removeSignal()
        % todo: maybe reconstruct the harmonic from the string
        % representation and substract it?
    end

    removeButton = uibutton(col, "ButtonPushedFcn", @(src, ev) removeSignal());
    removeButton.Layout.Row = 3;
    removeButton.Layout.Column = 1;
    removeButton.Text = "Remove Selected Signal";
end

%% getSamplingFreq
% Returns the Sampling Frequency, Fs [Hz]
function Fs = getSamplingFreq()
    Fs = 1e4;
end

%% getSamplingTime
% Returns the Sampling Duration, T [s]
function T = getSamplingTime()
    T = 1/4;
end

%% getTimeVector
% Returns the Time Vector, the period count is given by the result from
% getSamplingTime, and the granularity by getSamplingFreq.
function t = getTimeVector()
    Fs = getSamplingFreq;
    T = getSamplingTime;

    t = 0:1/Fs:T;
end

%% plotSignals
% Plot the signals from signalDefs
function plotSignals(ax, signalDefs)
    t = getTimeVector;
    p = plot(ax, t, signalDefs);
end

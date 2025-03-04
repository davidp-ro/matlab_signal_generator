%% homePage.m
% Creates the layout for the home page.
function homePage()
    mainContainer = figure('Name', 'Signal Generator', ...
        'NumberTitle', 'off', ...
        'Resize', 'off', ...
        'ToolBar', 'none', ...
        'Position', [500 500 1000 600] ...
    );
    
    documentationToolbar(mainContainer);

    % --- UI ---

    title();
    subtitle();

    harmonicsImage(mainContainer);
    buttons(mainContainer);

    footer();
end

%% getLeftPad
% Get the left padding (left arg. for position params)
function pad = getLeftPad()
    pad = 80;
end

%% documentationToolbar
% Adds the "Documentation" toolbar item
function docsToolbar = documentationToolbar(mainContainer)
    docsToolbar = uimenu(mainContainer, 'Text', 'Documentation');

    % Open repo
    uimenu(docsToolbar, ...
        "Text", 'Open Repository on GitHub', ...
        "Accelerator",  'G', ...
        "Callback", 'web("https://github.com/davidp-ro/matlab_signal_generator")' ...
    );

    % Open .docx
    uimenu(docsToolbar, ...
        "Text", 'Open Documentation - .docx', ...
        "Accelerator",  'D', ...
        "Separator", "on", ...
        "Callback", 'openDocs("docx")' ...
    );
    % Open .pdf
    uimenu(docsToolbar, ...
        "Text", 'Open Documentation - .pdf', ...
        "Accelerator",  'P', ...
        "Callback", 'openDocs("pdf")' ...
    );
end

%% title
% Adds the title to the page
function titleText = title()
    titleText = uicontrol('Style','text', ...
        'Fontsize', 38, ...
        'FontWeight', 'bold', ...
        'Position', [getLeftPad 410 500 100], ...
        'HorizontalAlignment', 'left', ...
        'String','Signal Generator' ...
    );

end

%% subtitle
% Adds the title to the page
function subtitleText = subtitle()
    subtitleText = uicontrol('Style','text', ...
        'Fontsize', 18, ...
        'Position', [getLeftPad 360 500 100], ...
        'HorizontalAlignment', 'left', ...
        'String','Generate a signal composed of one or more harmonics.' ...
    );
end

%% harmonicsImage
% Adds the "harmonics" image to the page
function harmonicsImage(mainContainer)
    ax = uiaxes(mainContainer, ...
        'Position', [600 250 380 300], ...
        'Color', '#f0f0f0', ...
        'MinorGridLineStyle', 'none' ...
    );
    axis(ax, "off");
    [img, ~, alphachannel] = imread('harmonics-nobg.png');
    % Image Credit: https://electronics.stackexchange.com/a/32314
    image(img, 'AlphaData', alphachannel, 'Parent', ax);
end

%% buttons
% Adds the controls (push buttons) to the page, and registers their callbacks
function buttons(mainContainer)
    uicontrol('Style','pushbutton', ...
        'Fontsize', 16, ...
        'FontWeight', 'bold', ...
        'ForegroundColor', '#ed853d', ...
        'Position',[getLeftPad 300 300 60], ...
        'String','Open Generator', ...
        'Callback', @(src, event) openGenerator(mainContainer) ...
    );

    uicontrol('Style','pushbutton', ...
        'Fontsize', 12, ...
        'ForegroundColor', '#0f3d8d', ...
        'Position',[getLeftPad 140 200 35], ...
        'String','Open Documentation (.docx)', ...
        'Callback', 'openDocs("docx")' ...
    );

    uicontrol('Style','pushbutton', ...
        'Fontsize', 12, ...
        'ForegroundColor', '#af0c02', ...
        'Position',[getLeftPad 100 200 35], ...
        'String','Open Documentation (.pdf)', ...
        'Callback', 'openDocs("pdf")' ...
    );
end



%% footer
% Adds the footer text to the bottom of the page
function footer()
    uicontrol('Style','text', ...
        'Fontsize', 12, ...
        'Position',[0 0 1000 40], ...
        'String','David Pescariu - Final project for CAG 2024-2025' ...
    );
    uicontrol('Style','text', ...
        'Fontsize', 12, ...
        'Position',[0 0 1000 25], ...
        'Enable', 'inactive', ...
        'ButtonDownFcn', 'web("https://github.com/davidp-ro/matlab_signal_generator")', ...
        'String','github.com/davidp-ro/matlab_signal_generator' ...
    );
end

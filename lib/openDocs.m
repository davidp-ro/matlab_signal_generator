%% openDocs
% Open the documentation
% 
% Inputs:
%   format  : string, which format of the docs to open ("docx" or "pdf")
function openDocs(format)
    arguments
        format string
    end

    if format == "docx"
        open("Signal Generator - Documentation.docx");
    else
        open("Signal Generator - Documentation.pdf");
    end
end
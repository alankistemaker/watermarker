function [DCTExtracted, elapsedTime, result] = DCTExtract(aEmbedded)
try
    % TODO
    start = tic;
    elapsedTime = toc(start);
    result = true;
    DCTExtracted = 1;
catch
    elapsedTime = 0;
    result = false;
    DCTExtracted = 0;
end
end
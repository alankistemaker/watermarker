function [DCTEmbedded, elapsedTime, result] = DCTEmbed(aHost, aWatermark)
try
    lHost = aHost;
    lWatermark = aWatermark;
    start = tic;
    % TODO
    result = true;
    DCTEmbedded = 1;
    elapsedTime = toc(start);
catch
    elapsedTime = 0;
    result = false;
    DCTEmbedded = 0;
end

end
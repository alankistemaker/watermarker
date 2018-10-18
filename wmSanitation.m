function lSanitised = wmSanitation(aWatermark)
if isempty(aWatermark) == false
    try
        lWatermark = aWatermark;
        lWatermark = double(imbinarize(lWatermark));
        lSanitised = lWatermark;
    catch
        disp('Error: wmSanitiation - FAILED');
    end
else
    lSanitised = 0;
    disp('Error: wmSanitiation - FAILED: aWatermark is empty');
end
end
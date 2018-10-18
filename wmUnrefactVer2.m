%% This function has been abandoned, but we'll keep it just in case
function lAverage = wmUnrefactVer2(aWatermark, aExtracted)
lWatermark = aWatermark;                    % copy control
lExtracted = aExtracted;                    % copy control
[wm_xSize, wm_ySize] = size(lWatermark);    % x and y variables for watermark size
[ex_xSize, ex_ySize] = size(lExtracted);    % x and y variables for extracted watermark size
xBlocks = ex_xSize/wm_xSize;                % number of blocks expected in x direction
yBlocks = ex_ySize/wm_ySize;                % number of blocks expected in y direction
totalBlocks = xBlocks*yBlocks;              % total number of blocks expected in whole image
xOffset = 1;
yOffset = 1;
lBlock = zeros(wm_xSize, wm_ySize);         % matrix to hold each block as its extracted

xPosBlock = 0;
yPosBlock = 0;
blockNo = 1;

for yPos = (yOffset) : (wm_ySize + yOffset)
    for xPos = (xOffset) : (wm_xSize + xOffset)
        lBlock(xPos, yPos) = lExtracted((xPos + xOffset), (yPos + yOffset));
    end
end
lAverage(:,:,blockNo) = lBlock;
end

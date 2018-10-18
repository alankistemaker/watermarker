function average = wmUnrefact(aWatermark, aExtracted)
lWatermark = aWatermark;
lExtracted = aExtracted;
[wm_xsize, wm_ysize] = size(lWatermark);
[ex_xsize, ex_ysize] = size(lExtracted);
x_result = ex_xsize / wm_xsize;
y_result = ex_ysize / wm_ysize;
noBlocks = x_result * y_result;
lAver = zeros(wm_xsize, wm_ysize, noBlocks);

lBlock = zeros(wm_xsize, wm_ysize);
for block_yPos = 1 : y_result
    if block_yPos == 1
        yOffset = 1;
    else
        yOffset = (y_result * block_yPos) - y_result;
    end
    for block_xPos = 1 : x_result
        if block_xPos == 1
            xOffset = 1;
            for yPos = xOffset : wm_ysize + xOffset
                for xPos = xOffset : wm_xsize
                    lBlock(xPos, yPos) = lExtracted(xPos, yPos);
                end
            end
        else
            xOffset = (block_xPos * wm_xsize) - wm_xsize;
            for yPos = xOffset : (wm_ysize + xOffset - 1)
                for xPos = xOffset : (wm_xsize + xOffset - 1)
                    lBlock((xPos - xOffset + 1), (yPos - xOffset + 1), block_xPos) = lExtracted(xPos, yPos);
                end
                %lAver(:, :, iii) = lBlock;
            end
        end
        lAver = lAver + lBlock(:, :, block_xPos);
    end
    
    
    lAver = lAver/x_result;
    average = lAver;
end

% for iii = 1 : x_result
%     if iii == 1
%         lOffset = 1;
%         for ii = lOffset : wm_ysize
%             for i = lOffset : wm_xsize
%                 lBlock(i, ii) = lExtracted(i, ii);
%             end
%         end
%     else
%         lOffset = (iii * wm_xsize) - wm_xsize;
%         for ii = lOffset : (wm_ysize + lOffset - 1)
%             for i = lOffset : (wm_xsize + lOffset - 1)
%                 lBlock((i - lOffset + 1), (ii - lOffset + 1), iii) = lExtracted(i, ii);
%             end
%             %lAver(:, :, iii) = lBlock;
%         end
%     end
% end
% lAver = zeros(wm_xsize, wm_ysize);
% for i = 1 : x_result
%     lAver = lAver + lBlock(:, :, i);
% end
% lAver = lAver/x_result;
% average = lAver;



% for iii = 1 : x_result
%     if iii == 1
%         lOffset = 1;
%     else
%         lOffset = (iii * wm_xsize) - wm_xsize;
%     end
%     for ii = lOffset : wm_ysize + lOffset
%         for i = lOffset : wm_xsize + lOffset
%             lBlock(i, ii) = lExtracted(i, ii);
%         end
%     end
% end

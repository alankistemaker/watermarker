function [BPExtracted, elapsedTime, result] = BitplaneExtract(aEmbedded)
% try
%     if nargin > 1
%         lBlocks = [64,64];   % TODO
%     else
%         lBlocks = [64,64];
%     end
    start = tic;
    
%     lBlockX = lBlocks(1);
%     lBlockY = lBlocks(2);
    lWatermarkedHost = aEmbedded;
    
    lExtracted = bitget(lWatermarkedHost,1)*255;
%     lBlockCells = blocker(lExtracted, lBlockX, lBlockY);
%     BPExtracted = blockAverage(lBlockCells);
    BPExtracted = lExtracted;
    elapsedTime = toc(start);
    result = true;
% catch
%     disp('Error: LSB Extraction has failed');
%     BPExtracted = 0;
%     result = false;
%     elapsedTime = 0;
% end
end
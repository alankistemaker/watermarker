% % refactors the watermark to the size of the host image by tiling the watermark
% function refactoredWM = wmRefact(aWatermark, aBlockSize)
% lWatermark = aWatermark;
% % lHost = aHost;
% [wm_xsize, wm_ysize] = size(lWatermark);
% % [h_xsize, h_ysize] = size(lHost);
% blockX = aBlockSize(1);
% blockY = aBlockSize(1);
% x_result = blockX / wm_xsize;
% y_result = blockY / wm_ysize;
% 
% lWatermark_concat = lWatermark;
% for i = 0 : x_result - 2
%     lWatermark_concat = [lWatermark_concat lWatermark];             % concatenate sideways
% end
% lWatermark_concat_x = lWatermark_concat;
% 
% for i = 0 : y_result - 2
%     lWatermark_concat = [lWatermark_concat ; lWatermark_concat_x];  % concatenate downwards
% end
% refactoredWM = lWatermark_concat;
% end
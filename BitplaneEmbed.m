%% BitplaneEmbed embeds aWatermark into aHost using LSB.
% Param1: aHost is the host image
% Param2: aWatermark is the watermark image
% Param3: aBlocks is a

function [BPEmbedded, elapsedTime, result] = BitplaneEmbed(aHost, aWatermark)
% try
lHost = aHost;
[hx_size, hy_size] = size(lHost);

lWatermark = double(aWatermark);
lWatermark = imresize(lWatermark, [hx_size, hy_size]);
% lWatermark = wmRefact(lWatermark, lBlockSize);

lHost = double(lHost);
%[hx_size, hy_size] = size(lHost);
start = tic;
%B1 = bitget(lHost,1);
B2 = bitget(lHost,2);
B3 = bitget(lHost,3);
B4 = bitget(lHost,4);
B5 = bitget(lHost,5);
B6 = bitget(lHost,6);
B7 = bitget(lHost,7);
B8 = bitget(lHost,8);

lWatermark = lWatermark*2^0 + B2*2^1 + B3*2^2 + B4*2^3 + B5*2^4 + B6*2^5 + B7*2^6 + B8*2^7;
% lWatermark = mat2gray(lWatermark);
% lWatermark = rescale(lWatermark, 0, 255);
lWatermark = uint8(lWatermark);
BPEmbedded = lWatermark;
elapsedTime = toc(start);
result = true;
disp('LSB embedding complete');
% catch
%     elapsedTime = 0;
%     BPEmbedded = 0;
%     result = false;
% end
end
init;
% ref_watermark = wmRefact(host, watermark);
% bpEmbedded = BitplaneEmbed(host, ref_watermark);
% bpExtracted = BitplaneExtract(bpEmbedded);
% block = wmUnrefact(watermark, ref_watermark);
% bigBlock = imread('images\extractedWatermark.bmp');
bigBlock = host;
blockX = 64;
blockY = 64;
blockCell = blocker(bigBlock, blockX, blockY);

% figure,
% subplot(8, 8, 1), imshow(blockCell{1, 1});
% subplot(8, 8, 2), imshow(blockCell{1, 2});
% subplot(8, 8, 3), imshow(blockCell{1, 3});
% subplot(8, 8, 4), imshow(blockCell{1, 4});
% subplot(8, 8, 5), imshow(blockCell{1, 5});
% subplot(8, 8, 6), imshow(blockCell{1, 6});
% subplot(8, 8, 7), imshow(blockCell{1, 7});
% subplot(8, 8, 8), imshow(blockCell{1, 8});

plotIndex = 1;
averageBlock = zeros(64, 64);
figure,
for j = 1 : 8
    for i = 1 : 8
        block = double(blockCell{j, i});
        subplot(8, 8, plotIndex), imshow(blockCell{j, i});
        plotIndex = plotIndex + 1;
        averageBlock = averageBlock + block;
    end
end
averageBlock = averageBlock / 64;
figure, imshow(averageBlock);

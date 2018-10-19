function [lEmbeddedImage, lEmbeddingTime, lResult] =  LSBEmbedImage(aHostImage, aWatermarkImage)
% init local variables
lBlockSize = [512, 512];
lHost = aHostImage.matrix;
lWatermarkImage = aWatermarkImage;

start = tic;                                                % start timer

lTitledWatermarkImage = lWatermarkImage.tile(lBlockSize);   % tile watermarkImage
lWatermark = lTiledWatermarkImage.matrix;
%lWatermark = wmRefact(lWatermark, lBlockSize);
lEmbedded = BitplaneEmbed(lHost, lWatermark);


lEmbeddingTime = toc(start);
lEmbeddedImage = AppImage(lEmbedded, 'embedded', lEmbeddingTime);
lResult = true;
end
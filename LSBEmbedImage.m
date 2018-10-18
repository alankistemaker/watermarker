function [lEmbeddedImage, lEmbeddingTime, lResult] =  LSBEmbedImage(aHostImage, aWatermarkImage)
start = tic;
lBlockSize = [512, 512];
lHost = aHostImage.matrix;
lWatermark = aWatermarkImage.matrix;
lWatermark = wmRefact(lWatermark, lBlockSize);
lEmbedded = BitplaneEmbed(lHost, lWatermark);


lEmbeddingTime = toc(start);
lEmbeddedImage = AppImage(lEmbedded, 'embedded', lEmbeddingTime);
lResult = true;
end
function [lEmbeddedImage, lEmbeddingTime, lResult] =  LSBEmbed(aHostImage, aWatermarkImage)
start = tic;
lBlockSize = [512, 512];
lHost = aHostImage.matrix;
lWatermark = aWatermarkImage.matrix;
lWatermark = wmRefact(lWatermark, lBlockSize);
lEmbedded = BitplaneEmbed(lHost, lWatermark);

lEmbeddedImage = AppImage(lEmbedded, 'embedded');
lEmbeddingTime = toc(start);
lResult = true;
end
function [lEmbeddedImage, lEmbeddingTime, lResult] = SVDEmbedImage(aHostImage, aWatermarkImage)
start = tic;
lBlockSize = [512,512];
lHost = aHostImage.matrix;
lWatermark = aWatermarkImage.matrix;
lWatermark = wmRefact(lWatermark, lBlockSize);
lEmbedded = SVDEmbed(lHost, lWatermark);

lEmbeddingTime = toc(start);
lEmbeddedImage = AppImage(lEmbedded, 'svd_embedded', lEmbeddingTime);
lResult = true;

end
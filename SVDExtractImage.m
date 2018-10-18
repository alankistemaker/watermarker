function [lExtractedImage, lExtractionTime, lResult] = SVDExtractImage(aEmbeddedImage)
start = tic;
lEmbedded = aEmbeddedImage.matrix;
lExtracted = SVDExtract(lEmbedded);
cellBlock = blocker(lExtracted, 64, 64);
lBlockAverage = blockAverage(cellBlock);
lExtractedImage = AppImage(lBlockAverage, 'svd_extracted');
lResult = true;
lExtractionTime = toc(start);
end
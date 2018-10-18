function [lExtractedImage, lExtractionTime, lResult] = LSBExtract(aEmbeddedImage)
start = tic;
lEmbedded = aEmbeddedImage.matrix;
lExtracted = BitplaneExtract(lEmbedded);
cellBlock = blocker(lExtracted, 64, 64);
lBlockAverage = blockAverage(cellBlock);
lExtractedImage = AppImage(lBlockAverage, 'Extracted');
lResult = true;
lExtractionTime = toc(start);
end
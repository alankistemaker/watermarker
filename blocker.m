%% blocker takes an image and breaks it into blocks of size aBlockX x aBlockY.
%% Block sizes must divide evenly into aImage eg aImage = 512x512, block = 64x64, returns 16 blocks
function lBlocks = blocker(aImage, aBlockX, aBlockY)
lImage = aImage;
[lImageX, lImageY] = size(aImage);
rem = mod(lImageX, aBlockX);
if rem == 0
    xBlocks = lImageX/aBlockX;
    yBlocks = lImageY/aBlockY;
    lBlockVectorX = [1, xBlocks];
    lBlockVectorY = [1, yBlocks];
    for i = 1 : xBlocks
        lBlockVectorX(1, i) = aBlockX;
        lBlockVectorY(1, i) = aBlockY;
    end
    lBlocks = mat2cell(lImage, lBlockVectorX, lBlockVectorY);
    
else
    lBlocks = 0;
    disp('Error: blocker - FAILED: specified block size does not divide evenly into aImage');
end


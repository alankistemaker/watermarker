% Compares two images by scaling the smaller to the size of the larger then subtracting one from the other
function compImg = directCompare(aImage1, aImage2)
lImage1 = double(aImage1);
lImage2 = double(aImage2);
[im1x_size, im1y_size] = size(lImage1);
[im2x_size, im2y_size] = size(lImage2);
im1total_size = im1x_size * im1y_size;
im2total_size = im2x_size * im2y_size;
if im1total_size < im2total_size
    lImage1 = imresize(lImage1, [im2x_size, im2y_size]);
else
    lImage2 = imresize(lImage2, [im1x_size, im1y_size]);
end

compImg = lImage1 - lImage2;
end
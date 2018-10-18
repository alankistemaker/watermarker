% This init file loads some default images into the app.  No image sanitation occurs here
% set working directory to app
wd = cd();
wd_images = strcat(wd, '\images');
% load watermark
wm_dir = strcat(wd_images, '\watermark.tiff');
watermark = imread(wm_dir);
if class(watermark) == 'logical'
    watermark = uint8(watermark);
    disp('INIT read watermark as logical, repackaged as uint8');
end
% load host
hst_dir = strcat(wd_images, '\host.bmp');
host = imread(hst_dir);

%% Testing, remove before submission - TODO

% load colour image
clrimg_path = strcat(wd_images, '\colorImage.jpg');
colorImage = imread(clrimg_path);

clear hst_dir wd wd_images wm_dir clrimg_path;      % keep this line though
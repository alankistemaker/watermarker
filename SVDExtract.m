function [SVDextracted, elapsedTime, result] = SVDExtract(aEmbedded, aWatermark)
try
    lWatermarkedHost = aEmbedded;
    lWatermark = aWatermark;
    start = tic;
    % Using Haar wavelet, decompose the noisy watermarked image into four
    % sub-bands: LL, HL, LH, HH
    [LL, HL, LH, HH] = dwt2(lWatermarkedHost, 'haar');
    
    % Apply SVD to HH band
    %       H = U_H * S_H * V_H
    [U_H, S_H, V_H] = svd(HH, 'econ');
    
    % Extract the singular values from HH band
    HH_sv = zeros(length(lWatermark));
    Shh_diag = diag(HH_sv);
    S_H_diag = diag(S_H);
    
    if (length(lWatermark) >= 256)
        Shh_diag(1:length(S_H), 1) = S_H_diag;
    elseif (length(lWatermark) < 256)
        Shh_diag(1:length(lWatermark), :) = S_H_diag(1:length(lWatermark), :);
    end
    HH_sv(logical(eye(size(HH_sv)))) = Shh_diag;
    
    % Construct the watermark using singular values and orthogonal matricies
    % U_w and V_w obtained using SVD of original watermark
    %       W_E = U_w * S_H * V_w
    [U_w, S_w, V_w] = svd(lWatermark, 'econ');
    
    SVDextracted = U_w * HH_sv * V_w';
    SVDextracted = imbinarize(SVDextracted);
    elapsedTime = toc(start);
    result = true;
catch
    SVDextracted = 0;
    result = false;
    elapsedTime = 0;
end
end
function [SVDembedded, elapsedTime, result] = SVDEmbed(aHost, aWatermark)
% try
    lWatermark = aWatermark;
    lHost = aHost;
    % image sanitation
    lHost = double(lHost);
    [hx_size, hy_size] = size(lHost);
    lWatermarkBIN = imresize(lWatermark, [hx_size, hy_size]);
    %                 lWatermarkBIN = double(imbinarize(lWatermark));
    
    start = tic;    % start timer
    % 1. Watermark W is decomposed using SVD
    %       W = U_w * S_w * V_w
    [U_w, S_w, V_w] = svd(lWatermarkBIN, 'econ');
    
    % 2. Apply Haar wavelet and decompose cover image into four sub-bands [LL
    % ,HL, LH, HH]
    [LL, HL, LH, HH] = dwt2(lHost, 'haar');
    
    % 3. Apply SVD to HH
    %       H = U_H * S_H * V_H
    [U_H, S_H, V_H] = svd(HH, 'econ');
    
    % 4. Replace the singluar values of the HH band with the singular values of
    % the watermark
    S_H_diag = diag(S_H);
    S_w_diag = diag(S_w);
    
    if (length(lWatermark) >= 256)
        S_H_diag(1:length(S_H), :) = S_w_diag(1:length(S_H), :);
    elseif (length(lWatermark) < 256)
        S_H_diag(1:length(lWatermark), :) = S_w_diag(1:length(lWatermark), :);
    end
    
    S_H(logical(eye(size(S_H)))) = S_H_diag;
    
    % 5. Apply inverse SVD to obtain the modified HH band.
    %       H' = U_H * S_w * V_H
    
    HH_mod = U_H * S_H * V_H;
    
    % 6. Apply inverse DWT to produce the watermarked host
    SVDembedded = idwt2(LL, LH, HL, HH_mod, 'haar');
    SVDembedded = mat2gray(SVDembedded);
    elapsedTime = toc(start);       % stop timer
    result = true;
    
    
% catch
%     SVDembedded = 0;
%     result = false;
%     elapsedTime = 0;
% end

end
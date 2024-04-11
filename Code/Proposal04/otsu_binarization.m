function binary_image = otsu_binarization(original_image)
    % threshold using graythresh. [0,1]
    level = graythresh(original_image);
    binary_image = imbinarize(original_image, level);
   % binary_image = imbinarize(original_image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);

end
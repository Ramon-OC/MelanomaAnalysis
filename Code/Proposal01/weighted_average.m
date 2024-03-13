function smooth_image = weighted_average(original_image, mask_size)
    if mod(mask_size, 2) == 0
        error('Error: the mask must be of odd size.');
    end
    
    % Create the weighted averaging mask (all weights equal)
    % mask = fspecial('average', mask_size);
    % Gives higher weight to the central pixel 
    mask = fspecial('gaussian', mask_size, 1);

    smooth_image = imfilter(original_image, mask);
end
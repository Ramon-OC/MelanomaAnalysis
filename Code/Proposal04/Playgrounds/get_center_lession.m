function segmented_image = get_center_lession(original_image)
    [m, n] = size(original_image(:, :, 1)); 
    segmented_image = bwselect(original_image,round(n/2),round(m/2));
end
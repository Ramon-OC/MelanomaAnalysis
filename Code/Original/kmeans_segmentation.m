function segmented = kmeans_segmentation(original_image, no_classes)    
    red_channel = original_image(:, :, 1);
    green_channel = original_image(:, :, 2);
    blue_channel = original_image(:, :, 3);
    
    original_values = double([red_channel(:), green_channel(:), blue_channel(:)]);
    
    [m, n] = kmeans(original_values, no_classes);
    
    m = reshape(m, size(original_image,1), size(original_image,2));
    n = n/255;

    segmented = label2rgb(m,n);
end

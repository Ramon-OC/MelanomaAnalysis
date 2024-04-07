function segmented_image = remove_dermastocope_shadow(original_image)

    segmented_image = original_image;

    [m, n] = size(original_image); 

    if(original_image(1,1) == 1)
        current_image = (bwselect(original_image,1,1));
        segmented_image = segmented_image - current_image;
    end

    if(original_image(1,n) == 1)
        current_image = (bwselect(original_image,n,1));
        segmented_image = segmented_image - current_image;
    end

    if(original_image(m,1) == 1)
        current_image = (bwselect(original_image,1,m));
        segmented_image = segmented_image - current_image;
    end

    if(original_image(m,n) == 1)
        current_image = (bwselect(original_image,n,m));
        segmented_image = segmented_image - current_image;
    end
    
end
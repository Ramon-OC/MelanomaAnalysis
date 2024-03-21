function result_image = multilevel_otsu(original_image, levels)
    thresh = multithresh(original_image,levels);
    labels = imquantize(original_image,thresh);
    result_image = label2rgb(labels);
end
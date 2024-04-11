function segmented_image = active_contours(image, mask)
    % Active contours maximum iteration, and smooth factor
    maxIterations=600;
    smoothfact=5;
    segmented_image = activecontour(image,mask,maxIterations,'Chan-Vese','ContractionBias',-0.3,'SmoothFactor',smoothfact);
end

original_image = imread('Images/Intermediate/ISIC_0011082.jpg');
ground_thruth = imread("Images/Intermediate/ISIC_0011082_Segmentation.png"); 

order = 10;        
cut_frequency = 20;    
no_classes = 5;  
%no_classes = findOptimalCluster(original_image,10,100);  

segmented_image = kmeans_segmentation(original_image, no_classes);
gray_image = im2gray(segmented_image);
binary_image = otsu_binarization(gray_image); 
smooth_image = butterworth_lowpass(gray_image , order, cut_frequency);
binary_smooth_image = otsu_binarization(smooth_image);
inverse_gray_image = imcomplement(binary_smooth_image);

subplot(2, 4, 1);
imshow(original_image);
title('Original');

subplot(2, 4, 2);
imshow(segmented_image);
title('Segmentación K-Means');

subplot(2, 4, 3);
imshow(gray_image);
title('Escala de Grises (segmentación)');

subplot(2, 4, 4);
imshow(binary_image);
title('Binarización (Otsu)');

subplot(2, 4, 5);
imshow(smooth_image);
title('Butterworth Paso Bajas');

subplot(2, 4, 6);
imshow(binary_smooth_image);
title('Binarización (Butterworth)');

subplot(2, 4, 7);
imshow(inverse_gray_image);
title('Binarización Invertida');

subplot(2, 4, 8);
imshow(ground_thruth);
title('Ground Truth');
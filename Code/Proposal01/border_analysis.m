original_image = imread("Images/Good/ISIC_0000039.jpg"); 
ground_thruth = imread("Images/Good/ISIC_0000039_Segmentation.png"); 
mask_size = 5;

smooth_image = weighted_average(original_image, mask_size);
gray_image = im2gray(smooth_image);
binary_image = otsu_binarization(gray_image);
inverse_gray_image = imcomplement(binary_image);

subplot(2, 3, 1);
imshow(original_image);
title('Original');

subplot(2, 3, 2);
imshow(smooth_image);
title('Promedio Ponderado');

subplot(2, 3, 3);
imshow(gray_image);
title('Escala de Grises');

subplot(2, 3, 4);
imshow(binary_image);
title('Binarización (Otsu)');

subplot(2, 3, 5);
imshow(inverse_gray_image);
title('Binarización Invertida');

subplot(2, 3, 6);
imshow(ground_thruth);
title('Ground Truth');
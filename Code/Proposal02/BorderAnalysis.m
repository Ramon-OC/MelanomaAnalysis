original_image = imread('Images/Bad/ISIC_0000363.jpg');
ground_thruth = imread('Images/Bad/ISIC_0000363_Segmentation.png');

order = 2;        
cut_frequency = 20;    

smooth_image = color_butterworth_lowpass(original_image , order, cut_frequency);
binary_image = otsu_binarization(im2gray(smooth_image));
inverse_gray_image = imcomplement(binary_image);
tumor_filling = imfill(inverse_gray_image,'holes');
tumor_extraction = get_center_lession(tumor_filling);
tumor_border = bwmorph(tumor_filling,'remove');

subplot(2, 4, 1);
imshow(original_image);
title('Original');

subplot(2, 4, 2);
imshow(smooth_image);
title('Butterworth Paso Bajas');

subplot(2, 4, 3);
imshow(binary_image);
title('Binarización (Otsu)');

subplot(2, 4, 4);
imshow(inverse_gray_image);
title('Binarización Invertida');

subplot(2, 4, 5);
imshow(tumor_filling);
title('Imfill holes');

subplot(2, 4, 6);
imshow(tumor_border);
title('General Border');

subplot(2, 4, 7);
imshow(tumor_extraction);
title('Center extraction');

subplot(2, 4, 8);
imshow(ground_thruth);
title('Ground Truth');
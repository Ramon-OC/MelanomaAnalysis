original_image = imread('Images/Intermediate/ISIC_0000175.jpg');
ground_thruth = imread('Images/Intermediate/ISIC_0000175_Segmentation.png');

order = 2;        
cut_frequency = 20;    

original_image_ic = imadjust(original_image, [0.2 0.8], []);
smooth_image = color_butterworth_lowpass(original_image_ic , order, cut_frequency);
binary_image = otsu_binarization(im2gray(smooth_image));

%gray_Image = rgb2gray(smooth_image); 
%binary_image = imbinarize(gray_Image, 'adaptive', 'Sensitivity', 1);

inverse_gray_image = imcomplement(binary_image);
tumor_filling = imfill(inverse_gray_image,'holes');
tumor_extraction = get_center_lession(tumor_filling);
tumor_border = bwmorph(tumor_filling,'remove');

subplot(2, 5, 1);
imshow(original_image);
title('Original');

subplot(2, 5, 2);
imshow(original_image_ic);
title('Mejora Contraste');

subplot(2, 5, 3);
imshow(smooth_image);
title('Butterworth Paso Bajas');

subplot(2, 5, 4);
imshow(binary_image);
title('Binarización (Otsu)');

subplot(2, 5, 5);
imshow(inverse_gray_image);
title('Binarización Invertida');

subplot(2, 5, 6);
imshow(tumor_filling);
title('Imfill holes');

subplot(2, 5, 7);
imshow(tumor_border);
title('General Border');

subplot(2, 5, 8);
imshow(tumor_extraction);
title('Center extraction');

subplot(2, 5, 9);
imshow(ground_thruth);
title('Ground Truth');
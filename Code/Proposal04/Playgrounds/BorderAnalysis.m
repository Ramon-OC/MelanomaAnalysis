original_image = imread('Images/DermatoscopeShadow/ISIC_0010233.jpg');
ground_thruth = imread('Images/DermatoscopeShadow/ISIC_0010233_Segmentation.png');

order = 2;        
cut_frequency = 20;    

dermatoscope_free = dermatoscope_free(original_image);


original_image_ic = imadjust(dermatoscope_free, [0.2 0.8], []);
smooth_image = color_butterworth_lowpass(original_image_ic , order, cut_frequency);
binary_image = otsu_binarization(im2gray(smooth_image));
inverse_gray_image = imcomplement(binary_image);
tumor_filling = imfill(inverse_gray_image,'holes');

subplot(2, 4, 1);
imshow(original_image);
title('Original');

subplot(2, 4, 2);
imshow(dermatoscope_free);
title('Eliminar Fondo (D)');

subplot(2, 4, 3);
imshow(original_image_ic);
title('Mejora Contraste');

subplot(2, 4, 4);
imshow(smooth_image);
title('Filtro Butterworth Paso Bajas');

subplot(2, 4, 5);
imshow(binary_image);
title('Binarización de la imagen (Otsu)');

subplot(2, 4, 6);
imshow(inverse_gray_image);
title('Binarización con val Invertida');

subplot(2, 4, 7);
imshow(tumor_filling);
title('Imfill holes');

subplot(2, 4, 8);
imshow(ground_thruth);
title('Ground thruth');

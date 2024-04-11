clear;
original_image = imread('Images/Good/ISIC_0000039.jpg');
ground_thruth = imread('Images/Good/ISIC_0000039_Segmentation.png');

order = 2;        
cut_frequency = 20;    

original_image_ic = imadjust(original_image, [0.1 0.7], []);
smooth_image = color_butterworth_lowpass(original_image_ic , order, cut_frequency);
binary_image = otsu_binarization(im2gray(smooth_image));
inverse_gray_image = imcomplement(binary_image);
tumor_filling = imfill(inverse_gray_image,'holes');
dermatoscope_free = uint8(remove_dermastocope_shadow(tumor_filling)).*255;
largest_area = extract_larger_size(dermatoscope_free);
zoom_out_image = zoom_out(largest_area, 0.9);
active_contours = active_contours(original_image, zoom_out_image);

subplot(3, 4, 1);
imshow(original_image);
title('Imagen Original');

subplot(3, 4, 2);
imshow(original_image_ic);
title('Ajuste de Contraste');

subplot(3, 4, 3);
imshow(smooth_image);
title('Filtro Butterworth Paso Bajas');

subplot(3, 4, 4);
imshow(binary_image);
title('Otsu para binarización');

subplot(3, 4, 5);
imshow(inverse_gray_image);
title('Binarización Invertida');

subplot(3, 4, 6);
imshow(tumor_filling);
title('Imfill holes');

subplot(3, 4, 7);
imshow(dermatoscope_free);
title('Eliminar marca de Dermastocopio');

subplot(3, 4, 8);
imshow(largest_area);
title('Más grande');

subplot(3, 4, 9);
imshow(zoom_out_image);
title('Alejamiento a 0.8');

subplot(3, 4, 10);
imshow(active_contours);
title('Active Contours');

subplot(3, 4, 11);
imshow(ground_thruth);
title('Ground Thruth');

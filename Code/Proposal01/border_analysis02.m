original_image = imread("Images/Bad/ISIC_0000390.jpg"); 
ground_thruth = imread("Images/Bad/ISIC_0000390_Segmentation.png"); 
mask_size = 5;

fk = fspecial('average',[20 20]); % using 5x5 so it's easier to see here
smooth_image = imfilter(original_image,fk); % no loops, no splitting

gray_image = im2gray(smooth_image);
binary_image = otsu_binarization(gray_image);
inverse_gray_image = imcomplement(binary_image);
%inverse_gray_image = binary_image;


% Trabajo con la máscara binaria
subplot(1, 3, 1);
imshow(inverse_gray_image);
title('Binaria');

subplot(1, 3, 2);
imshow(ground_thruth);
title('Ground Truth');

BW2 = imfill(inverse_gray_image);

subplot(1, 3, 3);
imshow(BW2);
title('Llenado');


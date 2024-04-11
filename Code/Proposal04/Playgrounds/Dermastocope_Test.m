one_original_image = imread('Images/DermatoscopeShadow/ISIC_0000079.jpg');
two_original_image = imread('Images/DermatoscopeShadow/ISIC_0001133.jpg');
three_original_image = imread('Images/DermatoscopeShadow/ISIC_0010233.jpg');
four_original_image = imread('Images/DermatoscopeShadow/ISIC_0010237.jpg');
five_original_image = imread('Images/DermatoscopeShadow/ISIC_0010436.jpg');
six_original_image = imread('Images/DermatoscopeShadow/ISIC_0010472.jpg');

one_original_image_clean = clean_shade(one_original_image);
two_original_image_clean = clean_shade(two_original_image);
three_original_image_clean = clean_shade(three_original_image);
four_original_image_clean = clean_shade(four_original_image);
five_original_image_clean = clean_shade(five_original_image);
six_original_image_clean = clean_shade(six_original_image);

subplot(2, 6, 1);
imshow(one_original_image);

subplot(2, 6, 2);
imshow(two_original_image);

subplot(2, 6, 3);
imshow(three_original_image);

subplot(2, 6, 4);
imshow(four_original_image);

subplot(2, 6, 5);
imshow(five_original_image);

subplot(2, 6, 6);
imshow(six_original_image);

subplot(2, 6, 7);
imshow(one_original_image_clean);

subplot(2, 6, 8);
imshow(two_original_image_clean);

subplot(2, 6, 9);
imshow(three_original_image_clean);

subplot(2, 6, 10);
imshow(four_original_image_clean);

subplot(2, 6, 11);
imshow(five_original_image_clean);

subplot(2, 6, 12);
imshow(six_original_image_clean);


function shadow_free = clean_shade(original_image)
    order = 2;        
    cut_frequency = 20;    
    original_image_ic = imadjust(original_image, [0.2 0.8], []);
    smooth_image = color_butterworth_lowpass(original_image_ic , order, cut_frequency);
    binary_image = otsu_binarization(im2gray(smooth_image));
    inverse_gray_image = imcomplement(binary_image);
    tumor_filling = imfill(inverse_gray_image,'holes');
    shadow_free = remove_dermastocope_shadow(tumor_filling);
end
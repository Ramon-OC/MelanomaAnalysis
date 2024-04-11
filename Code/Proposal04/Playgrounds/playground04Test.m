files = dir('ImagesPlayground04/IMG/*.jpg');

for i = 1:length(files)
    filename = files(i).name;
    fullpath = fullfile('ImagesPlayground04/IMG/', filename);
    
    % Leer la imagen y convertirla a escala de grises
    original_image = imread(fullpath);
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

    % Guardar la imagen segmentada en un directorio específico
    savepath = fullfile('ImagesPlayground04/AUTO/', filename);
    imwrite(active_contours, savepath);
    clearvars -except files
end

files = dir('ImagesPlayground02-03/*.jpg');

for i = 1:length(files)
    filename = files(i).name;
    fullpath = fullfile('ImagesPlayground02-03', filename);
    
    % Leer la imagen y convertirla a escala de grises
    original_image = imread(fullpath);
    original_image_ic = imadjust(original_image, [0.1 0.7], []);
    dermatoscope_free_image = dermatoscope_free(original_image_ic);

    I_gray = rgb2gray(dermatoscope_free_image);
    % Calcular los umbrales múltiples
    thresh = multithresh(I_gray, 2);
    
    % Segmentar la imagen utilizando los umbrales calculados
    labels = imquantize(I_gray, thresh);
    
    % Convertir las etiquetas a una imagen RGB para visualización
    labelsRGB = label2rgb(labels);
  
    % Guardar la imagen segmentada en un directorio específico
    savepath = fullfile('Directorio_de_guardado02', ['Segmented_' filename]);
    imwrite(labelsRGB, savepath);
end

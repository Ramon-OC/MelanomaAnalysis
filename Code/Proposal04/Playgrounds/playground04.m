% Read images
filesIMG = dir('ImagesPlayground04/IMG/*.jpg');
filesGT = dir('ImagesPlayground04/GT/*.png');
filesAUTO = dir('ImagesPlayground04/AUTO/*.jpg');

for i = 1:length(files)
    
    filename01 = filesIMG(i).name;
    fullpath01 = fullfile('ImagesPlayground04/IMG/', filename01);

    filename02 = filesGT(i).name;
    fullpath02 = fullfile('ImagesPlayground04/GT/', filename02);
    
    filename03 = filesAUTO(i).name;
    fullpath03 = fullfile('ImagesPlayground04/AUTO/', filename03);
    
    Img=imread(fullpath01);
    GT=imread(fullpath02);
    auto=imread(fullpath03);

    combined = imfuse(auto,GT);     % combined image (auto and GT)
    % compute the evaluation metrics
    % metrics vector=[Accuracy Precision Sensitivity Specificityc FPR Jaccard Dice];
    [metrics_vector] = compute_metrics(GT,auto);

    figure(1)
    subplot(2,2,1)
    imshow(Img); title('Original color image')
    subplot(2,2,2)
    imshow(GT); title('Manual segmentation (GT)')
    subplot(2,2,3)
    imshow(auto); title('Automatic segmentation')
    subplot(2,2,4)
    imshow(combined); title('Overlap (auto,GT) images')
    sgtitle(num2str(metrics_vector))

    % Guardar la imagen segmentada en un directorio específico
    savepath = fullfile('ResultadosPlayGround04', filename01); 
    saveas(gcf, savepath);

end

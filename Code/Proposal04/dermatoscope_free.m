function [Clean_Image] = dermatoscope_free(I)
%
% Genera la mascara para elimincar el fondo
% del dermatoscopio.
% I = imagen de entrada a color
% final_mask = la mascara con 1's dentro del area del dermatoscopio y
% 0's fuera del area del dermatoscopio.
% 


% Calculo del histograma de la banda Roja,
h=imhist(I(:,:,1));
%  Calculo del umbral con otsu, solo de 1:50 (valores bajos)
T = otsuthresh(h(1:50));
% Se utiliza el umbral para binarizar la imagen
% y se genera la primera mascara
mask = imbinarize(I(:,:,1),T);
mask1 = I(:,:,1) >=(T*255);

% Se busca el objeto de mayor area
[labeledImage, numRegions] = bwlabel(mask1);
props = regionprops(labeledImage, 'Area');
allAreas = [props.Area];
[mm,ind]=max(allAreas);
mask2 = labeledImage==ind; % el objeto mas grande

% Se le incluye un marzo negro alrededor de la imagen
[row,col,z]=size(mask2);
aux=zeros(size(mask2));
%rect=[xmin ymin width height]
Ierased = imerase(aux,[10,10,col-10,row-10]);

se = strel('disk',7);
mask3=imerode(mask2,se);
mask3=mask3.*double(~Ierased);  % se aplica el marco a la imagen
% se rellenan los hoyos
mask4=imfill(mask3,'holes');

%  Se calcula el convex hull a mask4
%  para obtener la mascara final
final_mask=bwconvhull(mask4);

% Se aplica la mascara a la imagen original (a las tres bandas de color)
Clean_Image = bsxfun(@times, I, cast(final_mask, 'like', I));

end
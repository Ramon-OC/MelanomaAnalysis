function optimalCluster = findOptimalCluster(original_image, max_clusters, max_iter)
    % Convertir la imagen a una matriz de dos dimensiones y normalizar
    im2 = double(original_image(:)) / 255;

    % Obtener el número de píxeles
    pixelNo = numel(im2);

    distortions = zeros(1, max_clusters);

    for k = 1:max_clusters
        % Se inicializan centroides de clústeres de manera aleatoria con ayuda de randperm 
        randIndices = randperm(pixelNo, k);
        centers = im2(randIndices);

        for iter = 1:max_iter
            D = pdist2(centers, im2);
            [~, min_indices] = min(D);

            for j = 1:k
                centers(j) = mean(im2(min_indices == j));
            end
        end
        % La distorsión (suma de los cuadrados de las distancias mínimas al cuadrado) 
        % se calcula y se almacena para evaluar la calidad del agrupamiento.
        distortions(k) = sum(min(D).^2) / pixelNo;
    end

    figure;
    plot(1:max_clusters, distortions, 'o-');
    title('Método del Codo para encontrar el número óptimo de clústers');
    xlabel('Número de clústers');
    ylabel('Distorsión');

    
    disp(distortions);
    [~, optimalCluster] = findKnee(distortions(2:end));

    fprintf('El número óptimo de clústers es: %d\n', optimalCluster);
    optimalCluster = round(optimalCluster * 1000); 
    disp(optimalCluster);
end

% Encuentra el codo de los resultados con la primera derivada
function [x, y] = findKnee(xValues)

    dx = xValues(2:end) - xValues(1:end-1);
    dy = diff(dx);

    % Punto con la mayor pendiente
    [~, idx] = max(dy); 

    x = idx + 1;  % Ajustar el índice para obtener el valor correcto en x_vals
    y = xValues(x);
end

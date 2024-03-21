function smooth_image = butterworth_lowpass(original_image, order, cut_frequency)
	    
    [m, n] = size(original_image); 
    
    % Fourier Transform of the original_image 
    fourier_transform = fft2(double(original_image)); 
        
    % Designing filter 
    u = 0:(m-1); 
    v = 0:(n-1); 
    idx = find(u > m/2); 
    u(idx) = u(idx) - m; 
    idy = find(v > n/2); 
    v(idy) = v(idy) - n; 
    
    [V, U] = meshgrid(v, u); 
    
    % Euclidean Distance 
    euclidean_distance = sqrt(U.^2 + V.^2); 
    
    % Filtering mask 
    filtering_mask = 1./(1 + (euclidean_distance./cut_frequency).^(2*order)); 
    
    % Convolution: Fourier Transformed image and the mask 
    g = filtering_mask.*fourier_transform; 
    
    % Inverse Fourier Transform 
    smooth_image = uint8(ifft2(double(g))); 
end
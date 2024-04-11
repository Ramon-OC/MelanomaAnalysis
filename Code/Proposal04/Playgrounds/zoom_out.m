function imagen_zoom_out = zoom_out(original_image, factor_zoom_out)
      
    imagen_zoom_out = imresize(original_image, factor_zoom_out);
    
    black_background = uint8(zeros(size(original_image)));
    
    pos_x = round((size(black_background, 2) - size(imagen_zoom_out, 2)) / 2);
    pos_y = round((size(black_background, 1) - size(imagen_zoom_out, 1)) / 2);
    
    % Paste reduced image into the black background
    black_background(pos_y:pos_y+size(imagen_zoom_out, 1)-1, pos_x:pos_x+size(imagen_zoom_out, 2)-1) = imagen_zoom_out;
    
    imagen_zoom_out = black_background;
end
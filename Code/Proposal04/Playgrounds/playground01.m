x = otsu_binarization(imread("mask_image.jpg"));

[a, bc] = bwlabel(x);
b = [];
temp = 0;
gk = 1;
[f, g] = size(a);

for i=1:bc
    for wk=1:f
        for tk=1:g
            if(a(wk,tk)==gk)
                temp=temp+1;
            end
        end
    end
    b =[b temp];
    temp=0;
    gk=gk+1;
end

[m, n] = max(b);

output = [f,g];
for i=1:f
    for j=1:g
        if(a(i,j)==n)
            output(i,j)=0;
        elseif(a(i,j)>=1)
            output(i,j)=1;
        else
            output(i,j)=0;
        end
    end
end

final_output = [f,g];
for i=1:f
    for j=1:g
        if(a(i,j)==n)
            final_output(i,j)=1;
        else
            final_output(i,j)=0;
        end
    end
end

subplot(1,3,1);
imshow(x);
title('Original Image');

subplot(1,3,2);
imshow(output);
title('Smallest objects in the binary image');

subplot(1,3,3);
imshow(final_output);
title('Largest Object');
function biggest = extract_larger_size(binary_image)
    
    [a, bc] = bwlabel(binary_image);
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
    
    biggest = [f,g];

    for i=1:f
        for j=1:g
            if(a(i,j)==n)
                biggest(i,j)=255;
            else
                biggest(i,j)=0;
            end
        end
    end
   
end


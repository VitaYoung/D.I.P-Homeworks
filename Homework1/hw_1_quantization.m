function ft = hw_1_quantization( imgpath,level )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

    % read the image
    f = imread(imgpath);  
    
    % get the size of the image
    [m,n] = size(f);
    
    % get the counts of the sections
    b = 255/(level - 1);
    
    ft = uint8(f);
    
    % for each pixel, decide which section it belongs to 
    for i = 1:m
        for j = 1:n
            
            ft(i,j) = (round(f(i,j)/b))*b;
        end
    end
    
    imshow(ft);
    
    % write the output image
    imwrite(ft, 'G:\temp\result.png');

end


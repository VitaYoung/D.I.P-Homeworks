function hw_1_scaling( imgpath, tx, ty )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

    % read the input image
    f = imread(imgpath);
    
    % get the size of the input image
    [m,n] = size(f);
    
    % get the rate of the target image and input image
    x_rate = tx/m;
    y_rate = ty/n;
   
    % target image
    img = zeros(tx, ty);
    
   
    

        for i = 1:tx
            for j = 1:ty
                
                 % find the source piexl through the rate
                 sx = i/x_rate;
                 sy = j/y_rate;
                
                 % get the bias
                 si = floor(sx);
                 sj = floor(sy);
                    
                 u = sx - si;
                 v = sy - sj;
                 
                 % edge solution
                 if si >= m
                     si = m - 1;
                 end
                 
                 if sj >= n
                     sj = n - 1;
                 end
                 
                 % edge solution
                 if si == 0
                     si = 1;
                 end 
                 
                 if sj == 0
                     sj = 1;
                 end 
                 
                 % bilinear interpolation
                 
                 img(i, j) = f(si + 1, sj + 1) * u * v + f(si, sj) * (1 - u) * (1 - v) + f(si + 1, sj) * u * (1 - v) + f(si, sj + 1) * (1 - u) * v;

            end
        end

    
        imshow(f);          
    img = uint8(img);            
  
    figure, imshow(img);
    
    % write target image
    imwrite(img, 'G:\temp\result.png');
    
end


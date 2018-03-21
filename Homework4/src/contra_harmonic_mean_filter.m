function contra_harmonic_mean_filter( imgpath, s )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(imgpath);
    
    [sm, sn] = size(f);
    filter = ones(s, s);
    

    bias = s - 1;
    
 
    nm = sm + 2*bias;
    nn = sn + 2*bias;
    
    maps = zeros(nm, nn);
    result = zeros(nm, nn);
    

    for i = 1 : sm
        for j = 1 : sn
            maps(i + bias, j + bias) = f(i, j);
        end
    end
    

    for i = (1 + bias/2) : (nm - bias/2)
        for j = (1 + bias/2) : (nn - bias/2)
            sum1 = 0;
            sum2 = 0;
            for x = 1 : s
                for y = 1: s
                    sum1 = sum1 + (filter(x, y)*maps(i - bias/2 + x - 1, j - bias/2 + y - 1))^-0.5;
                    sum2 = sum2 + (filter(x, y)*maps(i - bias/2 + x - 1, j - bias/2 + y - 1))^-1.5;
                end
            end
            result(i, j) = sum1/sum2;
        end
    end
    
    % get the result
    imgout = zeros(sm, sn);
    for i = 1 : sm
        for j = 1 : sn
            imgout(i,j) = result(i + bias, j +bias);
        end
    end
    imgout = uint8(imgout);
    figure, imshow(imgout);
    title('谐波均值滤波器滤波结果');
end


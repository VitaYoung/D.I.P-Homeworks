function median_filter( impath, s )
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    
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
            array = zeros(s*s);
            flag = 1;
            for x = 1 : s
                for y = 1: s
                    array(flag) = (filter(x, y)*maps(i - bias/2 + x - 1, j - bias/2 + y - 1));
                    flag = flag + 1;
                end
            end
            array = sort(array);
            result(i, j) = array(((s*s) + 1)/2);
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
    figure,imshow(imgout);
    title('中值滤波结果');
end


function filter2d( imgpath, filter)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    f = imread(imgpath);
    
    % get the size of source image and filter
    [sm, sn] = size(f);
    [fm, fn] = size(filter);
    
    % get the bias 
    bias = fm - 1;
    
    % extend the source image
    nm = sm + 2*bias;
    nn = sn + 2*bias;
    
    maps = zeros(nm, nn);
    result = zeros(nm, nn);
    
    % copy the source image to the extended one
    for i = 1 : sm
        for j = 1 : sn
            maps(i + bias, j + bias) = f(i, j);
        end
    end
    
    % filter operation
    for i = (1 + bias/2) : (nm - bias/2)
        for j = (1 + bias/2) : (nn - bias/2)
            sum = 0;
            for x = 1 : fm
                for y = 1: fn
                    sum = sum + filter(x, y)*maps(i - bias/2 + x - 1, j - bias/2 + y - 1);
                end
            end
            result(i, j) = sum;
        end
    end
    
    % get the result
    imgout = zeros(sm, sn);
    for i = 1 : sm
        for j = 1 : sn
            imgout(i,j) = result(i + bias, j +bias)/(fm*fn);
        end
    end
    imgout = uint8(imgout);
    figure, imshow(f);
    title('ԭͼ');
    figure, imshow(imgout);
    title('�˲����');

end


function average( impath )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    ft = imread(impath);
    r = f(:,:,1);
    g = f(:,:,2);
    b = f(:,:,3);
    
    [m,n] = size(r);
    
    aveR = zeros(256);
    aveG = zeros(256);
    aveB = zeros(256);
    ave = zeros(256);

    % count the number of pixels with same value
    for i = 1:m
        for j = 1:n
            aveR(r(i,j)+1) = aveR(r(i,j)+1) + 1;
            aveG(g(i,j)+1) = aveG(g(i,j)+1) + 1;
            aveB(b(i,j)+1) = aveB(b(i,j)+1) + 1;
        end
    end
    
    for i = 1:256
        ave(i) = (aveR(i) + aveG(i) + aveB(i))/3;
    end
    % histogram processing
    temp = 0;
    for i = 1:256
        ave(i) = ave(i)/(m*n);
        temp = temp + ave(i);
        ave(i) = temp*255;
    end
 
    
    % transform the result into int
    for i = 1:m
        for j = 1:n
            r(i,j) = round(ave(r(i,j)+1));
            g(i,j) = round(ave(g(i,j)+1));
            b(i,j) = round(ave(b(i,j)+1));
        end
    end

    ft(:,:,1) = r;
    ft(:,:,2) = g;
    ft(:,:,3) = b;
    
    figure,imshow(ft);
    title('平均直方图均衡化');
end


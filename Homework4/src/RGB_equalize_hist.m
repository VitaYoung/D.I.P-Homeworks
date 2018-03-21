function  RGB_equalize_hist( impath )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    ft = imread(impath);
    r = f(:,:,1);
    g = f(:,:,2);
    b = f(:,:,3);
    
    r = equalize_hist(r);
    g = equalize_hist(g);
    b = equalize_hist(b);
    
    ft(:,:,1) = r;
    ft(:,:,2) = g;
    ft(:,:,3) = b;
    
    figure,imshow(f);
    title('原图');
    figure,imshow(ft);
    title('直方图均衡化结果');
end


function  RGB_equalize_hist( impath )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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
    title('ԭͼ');
    figure,imshow(ft);
    title('ֱ��ͼ���⻯���');
end


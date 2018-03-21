function HSI_trans( impath)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    ft = imread(impath);
    f = double(f);
    r = f(:,:,1);
    g = f(:,:,2);
    b = f(:,:,3);
    
    [m,n] = size(r);
    H = zeros(m,n);
    S = zeros(m,n);
    I = zeros(m,n);
    
    for i = 1 : m
        for j = 1 : n
            angle = acos((0.5*((r(i,j)-g(i,j))+(r(i,j)-b(i,j))))./((sqrt((r(i,j)-g(i,j)).^2+(r(i,j)-b(i,j)).*(g(i,j)-b(i,j))))+eps));
            if (b(i,j) <= g(i,j))
                H(i,j) = angle;
                min = b(i,j);
            else
                H(i,j) = 2*pi - angle;
                min = g(i,j);
            end
            if (r(i,j) <= min)
                min = r(i,j);
            end
            S(i,j) = 1 - (3.*min) ./ (r(i,j) + g(i,j) + b(i,j) + eps);
            I(i,j) = (r(i,j) + g(i,j) + b(i,j))/3;
            if (S(i,j) == 0) 
                H(i,j) = 0;
            end
        end
    end
    
    I = equalize_hist(uint8(I));
    I = double(I);
    
    for i = 1 : m
        for j = 1 : n
            if (0 <= H(i,j) && H(i,j) < pi*2/3)
                
                b(i,j) = I(i,j) .* (1 - S(i,j));
                
                r(i,j) = I(i,j) .* (1 + (S(i,j) .* cos(H(i,j)) ./ cos(pi/3 - H(i,j))));
                
                g(i,j) = 3*I(i,j) - (r(i,j) + b(i,j));
                
            elseif (pi*2/3 <= H(i,j) && H(i,j) < pi*4/3)
                    
                r(i,j) = I(i,j) .* (1 - S(i,j));
                
                g(i,j) = I(i,j) .* (1 + (S(i,j) .* cos(H(i,j) - 2*pi/3) ./ cos(pi - H(i,j))));
                
                b(i,j) = 3*I(i,j) - (r(i,j) + g(i,j));
                
            elseif (pi*4/3 <= H(i,j) && H(i,j) <= 2*pi)
                    
                g(i,j) = I(i,j) .* (1 - S(i,j));
                
                b(i,j) = I(i,j) .* (1 + (S(i,j) .* cos(H(i,j) - 4*pi/3) ./ cos(pi*5/3 - H(i,j))));
                
                r(i,j) = 3*I(i,j) - (g(i,j) + b(i,j));
            end
        end
    end
    
    ft(:,:,1) = uint8(r);
    ft(:,:,2) = uint8(g);
    ft(:,:,3) = uint8(b);
    
    figure,imshow(ft);
    title('HSI强度通道直方图均衡化结果');
end



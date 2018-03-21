function [ft] = equalize_hist(f)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

    [m,n] = size(f);
    
    r = zeros(256);

    % count the number of pixels with same value
    for i = 1:m
        for j = 1:n
            
            r(f(i,j)+1) = r(f(i,j)+1) + 1;
        end
    end
    
    % histogram processing
    temp = 0;
    for i = 1:256
        r(i) = r(i)/(m*n);
        temp = temp + r(i);
        r(i) = temp*255;
    end
 
    ft = uint8(f);
    
    % transform the result into int
    for i = 1:m
        for j = 1:n
            ft(i,j) = round(r(f(i,j)+1));
        end
    end
    %imshow(f);
    %figure,imshow(ft);
%     rt = zeros(256);
    
    % count in result image
%     for i = 1:m
%         for j = 1:n      
%             rt(ft(i,j)+1) = rt(ft(i,j)+1) + 1;
%         end
%     end
%     
%     for i = 1:256
%         rt(i) = rt(i)/(m*n);
%     end
%     bar(1:256, rt);

end


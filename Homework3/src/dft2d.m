function dft2d( impath, flag)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    ff = imread(impath);
    f = double(f);
    ff = double(ff);
   
    [m,n] = size(f);
    
    result = zeros(m,n);
    temp = zeros(m,n);
    back = zeros(m,n);
    backresult = zeros(m,n);
    
    if flag == 0 
        
    for u = 1 : m
        for v = 1 : n
            if (mod((u + v),2) == 1)
                f(u,v) = -f(u,v);
            end
        end
    end
    
    
    for u = 1 : m
        for v = 1 : n
            sum = 0;
            for y = 1 : n
                sum = sum + f(u,y)*exp(-2*1i*pi*v*y/n);            
            end
            temp(u, v) = sum;
        end
    end
    
    for u = 1 : m
        for v = 1 : n
            sum = 0;
            for x = 1 : m
                sum = sum + temp(x, v)*exp(-2*1i*pi*u*x/m);
            end
            result(u,v) = sum;
        end
    end
    
    max = 0;
    

    
    for u = 1: m
        for v = 1: n
            result(u,v) = abs(result(u,v));
            result(u,v) = log(1 + result(u,v));
            
            if (result(u,v) > max)
                max = result(u,v);
            end
        end
    end
    
    
    level = 255.0/max;
    for u = 1 : m
        for v = 1 : n
            result(u,v) = result(u,v)*level;
        end
    end
    
    result = uint8(result);
    imshow(result);
    end 
    % deverse

    if flag == 1
    for u = 1 : m
        for v = 1 : n
            sum = 0;
            for y = 1 : n
                sum = sum + ff(u,y)*exp(-2*1i*pi*v*y/n);            
            end
            temp(u, v) = sum;
        end
    end
    
    for u = 1 : m
        for v = 1 : n
            sum = 0;
            for x = 1 : m
                sum = sum + temp(x, v)*exp(-2*1i*pi*u*x/m);
            end
            back(u,v) = sum;
        end
    end
   
    for u = 1 : m
        for v = 1 : n
            sum = 0;
            for y = 1 : n
                sum = sum + back(u,y)*exp(2*1i*pi*v*y/n)/n;            
            end
            temp(u, v) = sum;
        end
    end
    
    for u = 1 : m
        for v = 1 : n
            sum = 0;
            for x = 1 : m
                sum = sum + temp(x, v)*exp(2*1i*pi*u*x/m)/m;
            end
            backresult(u,v) = sum;
            backresult(u,v) = real(backresult(u,v));
        end
    end
    
    
    backresult = uint8(backresult);
    imshow(backresult);
    
    end 
    
end


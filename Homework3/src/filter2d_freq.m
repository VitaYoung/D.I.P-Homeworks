function filter2d_freq( impath, filter )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    f = double(f);
    
    [a,b] = size(f);
    [c,d] = size(filter);
    
    p = a + c + 1;
    q = b + d + 1;
    
    src = zeros(p,q);
    src_filter = zeros(p,q);
    
    for i = 1 : a
        for j = 1 : b
            src(i,j) = f(i,j);
        end
    end
    
    for i = 1 : c
        for j = 1 : d
            src_filter(i,j) = filter(i,j);
        end
    end
    
    temp = zeros(p,q);
    temp_filter = zeros(p,q);
    result = zeros(p,q);
    result_filter = zeros(p,q);
    dft = zeros(p,q);
    backresult = zeros(p,q);
    result_final = zeros(a,b);
    
    for u = 1 : p
        for v = 1 : q
            sum1 = 0;
            sum2 = 0;
            for y = 1 : q
                sum1 = sum1 + src(u,y)*exp(-2*1i*pi*v*y/q);     
                sum2 = sum2 + src_filter(u,y)*exp(-2*1i*pi*v*y/q);
            end
            temp(u, v) = sum1;
            temp_filter(u,v) = sum2;
        end
    end
    
    for u = 1 : p
        for v = 1 : q
            sum1 = 0;
            sum2 = 0;
            for x = 1 : p
                sum1 = sum1 + temp(x, v)*exp(-2*1i*pi*u*x/p);
                sum2 = sum2 + temp_filter(x,v)*exp(-2*1i*pi*u*x/p);
            end
            result(u,v) = sum1;
            result_filter(u,v) = sum2;
            dft(u,v) = sum1*sum2;
        end
    end
    
   for u = 1 : p
        for v = 1 : q
            sum1 = 0;
            for y = 1 : q
                sum1 = sum1 + dft(u,y)*exp(2*1i*pi*v*y/q)/q;  
            end
            temp(u, v) = sum1;
        end
    end
    
    for u = 1 : p
        for v = 1 : q
            sum1 = 0;
            for x = 1 : p
                sum1 = sum1 + temp(x, v)*exp(2*1i*pi*u*x/p)/p;
            end
            backresult(u,v) = real(sum1);
        end
    end
    
    for i = 1 : a
        for j = 1 :b 
            result_final(i,j) = backresult(i,j);
        end
    end
    
    
    result_final = uint8(result_final);
    imshow(result_final);
    
end


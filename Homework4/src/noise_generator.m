function noise_generator( impath, type, value1, value2 )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    
    f = rgb2gray(f);
    [m,n] = size(f);
    result = zeros(m,n);
    
    if (strcmp(type, 'gaussian'))
        noise = value1 + value2.*randn(m,n);
        for i = 1 : m
            for j = 1 :n
                result(i,j) = f(i,j) + noise(i,j);
            end
        end
        result = uint8(result);
        imwrite(result,'./temp/Gaussian_noise.png');
        arithmetic_mean_filter('./temp/Gaussian_noise.png', 3);
        title('算术均值滤波结果');
        geometric_mean_filter('./temp/Gaussian_noise.png',3);
        median_filter('./temp/Gaussian_noise.png',3);
    end
    
    if (strcmp(type, 'salt-and-pepper'))
        noise = rand(m,n);
        for i = 1 : m
            for j = 1 : n
                result(i,j) = f(i,j);
                if (noise(i,j) <= value1)
                    result(i,j) = 255;
                end
                if (noise(i,j) > value1 && noise(i,j) <= (value1 + value2))
                    result(i,j) = 0;
                end
            end
        end
        result = uint8(result);
        imwrite(result,'./temp/salt-and-pepper_noise.png');
        figure,imshow(result);
        title('noise');
        harmonic_mean_filter('./temp/salt-and-pepper_noise.png',3);
        contra_harmonic_mean_filter('./temp/salt-and-pepper_noise.png',3);
        arithmetic_mean_filter('./temp/salt-and-pepper_noise.png',3);
        geometric_mean_filter('./temp/salt-and-pepper_noise.png',3);
        max_filter('./temp/salt-and-pepper_noise.png',3);
        min_filter('./temp/salt-and-pepper_noise.png',3);
        median_filter('./temp/salt-and-pepper_noise.png',3);
    end
    
    
    
end


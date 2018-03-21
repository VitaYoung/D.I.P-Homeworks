function arithmetic_mean_filter(impath, size)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    filter = ones(size,size);
    filter2d(impath, filter);

end


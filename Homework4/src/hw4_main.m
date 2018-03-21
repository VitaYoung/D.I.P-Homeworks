function hw4_main( )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    %2.2.1
    arithmetic_mean_filter('./temp/task_1.png', 3);
    arithmetic_mean_filter('./temp/task_1.png', 9);
    %2.2.2
    harmonic_mean_filter('./temp/task_1.png', 3);
    harmonic_mean_filter('./temp/task_1.png', 9);
    %2.2.3
    contra_harmonic_mean_filter('./temp/task_1.png', 3);
    contra_harmonic_mean_filter('./temp/task_1.png', 9);
    
    
    %2.3.2
    noise_generator('./temp/task_2.png', 'gaussian', 0, 40);
    %2.3.3
    noise_generator('./temp/task_2.png', 'salt-and-pepper', 0.2, 0);
    %2.3.4
    noise_generator('./temp/task_2.png', 'salt-and-pepper', 0.2, 0.2);
    
    
    %2.4.1
    RGB_equalize_hist('./temp/54.png');
    %2.4.2
    average('./temp/54.png');
    %2.4.3
    HSI_trans('./temp/54.png');
end


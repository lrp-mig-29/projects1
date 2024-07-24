%%  lab3. histograms 
% H-1

images = cell(1, 5);
images{1} = zeros(256, 256);
images{2} = 255 * ones(256, 256); 
images{3} = [zeros(256, 128), 255 * ones(256, 128)]; 
images{4} = uint8(rand(256, 256) * 255);
images{5} = uint8((0:255).' * ones(1, 256));

figure;
for i = 1:5
    
    subplot(2, 5, i);
    imshow(images{i}, []);
    title(['Figure ' num2str(i)]);
 
    subplot(2, 5, i + 5);
    histogram(images{i}(:), 0:255);
    title(['Hist ' num2str(i)]);
end

%% H-2

original_image = imread('C:\Users\pltra\OneDrive\Belgeler\baboon.bmp');
grayscale_image = rgb2gray(original_image);

G1 = grayscale_image + 70;
G2 = grayscale_image - 70;
G3 = 2 * grayscale_image;
G4 = 0.5 * grayscale_image;

figure;

subplot(2, 5, 1); imshow(grayscale_image, []);
title('G');
subplot(2, 5, 2); imshow(G1, []);
title('G1');
subplot(2, 5, 3); imshow(G2, []);
title('G2');
subplot(2, 5, 4); imshow(G3, []);
title('G3');
subplot(2, 5, 5); imshow(G4, []);
title('G4');

subplot(2, 5, 6); histogram(grayscale_image(:), 0:255);
title('Histogram G');
subplot(2, 5, 7); histogram(G1(:), 0:255);
title('Histogram G1');
subplot(2, 5, 8); histogram(G2(:), 0:255);
title('Histogram G2');
subplot(2, 5, 9); histogram(G3(:), 0:255);
title('Histogram G3');
subplot(2, 5, 10); histogram(G4(:), 0:255);
title('Histogram G4');



%% H-3
original_image = imread('C:\Users\pltra\OneDrive\Belgeler\hist1.bmp');

stretched_image = imadjust(original_image);

subplot(2, 2, 1); imshow(original_image);
title('Original Image');

subplot(2, 2, 2); imshow(stretched_image);
title('Image after Histogram Stretching');

original_histogram = imhist(original_image);
stretched_histogram = imhist(stretched_image);

subplot(2, 2, 3); bar(original_histogram);
title('Histogram of Original Image');

subplot(2, 2, 4); bar(stretched_histogram);
title('Histogram after Stretching');

sgtitle('Histogram Stretching for hist1.bmp');
original_image = imread('C:\Users\pltra\OneDrive\Belgeler\hist1.bmp');

stretched_image = imadjust(original_image);

subplot(2, 2, 1); imshow(original_image);
title('Original Image');

subplot(2, 2, 2); imshow(stretched_image);
title('Image after Histogram Stretching');

original_histogram = imhist(original_image);
stretched_histogram = imhist(stretched_image);

subplot(2, 2, 3); bar(original_histogram);
title('Histogram of Original Image');

subplot(2, 2, 4); bar(stretched_histogram);
title('Histogram after Stretching');

sgtitle('Histogram Stretching for hist1.bmp');





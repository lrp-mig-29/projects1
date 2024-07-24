clearvars;
close all;
clc;


load functionsLUT;

figure;
title('LUT Function: Square');

inputImage = imread('C:\Users\pltra\OneDrive\Belgeler\jet.bmp');
imshow(inputImage);
title('Input Image');


squareLUT = intlut(input,square);
inverseLUT = intlut(input,inverse);
sawLUT = intlut(input,saw);

lutFunctions = {squareLUT, inverseLUT, sawLUT};

outputImages = cell(1, length(lutFunctions));

for i = 1:length(lutFunctions)
    outputImage = lutFunctions{i}(inputImage); 
    outputImages{i} = uint8(outputImage);
end

for i = 1:length(lutFunctions)
    figure;
    subplot(1, 3, 1);
    imshow(inputImage);
    title('Input Image');

    subplot(1, 3, 2);
    plot(0:255, lutFunctions{i}(0:255));
    title(['LUT Function: ' func2str(lutFunctions{i})]); 
    xlim([0 255]);
    ylim([0 255]);
    daspect([1 1 1]);

    subplot(1, 3, 3);
    imshow(outputImages{i});
    title('Output Image');
end


%% BO-2 Arithmetical operations - Addition
clearvars;
close all;
clc;

lenaImage = imread('C:\Users\pltra\OneDrive\Belgeler\lena.bmp');
jetImage = imread('C:\Users\pltra\OneDrive\Belgeler\jet.bmp');

figure;
subplot(1, 2, 1);
imshow(lenaImage);
title('Lena Image');

subplot(1, 2, 2);
imshow(jetImage);
title('Jet Image');

% Perform image addition using the addition operator
sumImage = int16(lenaImage) + int16(jetImage); % Convert to int16 before addition

figure;
imshow(sumImage, []);
title('Sum of Lena and Jet');

%% BO-2 Arithmetical operations - Linear combination (custom)
clearvars;
close all;
clc;

lenaImage = imread('C:\Users\pltra\OneDrive\Belgeler\lena.bmp');
jetImage = imread('C:\Users\pltra\OneDrive\Belgeler\jet.bmp');


alpha = 0.5;  % Weight for Lena
beta = 0.5;   % Weight for Jet

linearCombinedImage = alpha * double(lenaImage) + beta * double(jetImage);
linearCombinedImage = uint8(linearCombinedImage);

figure;
subplot(1, 2, 1);
imshow(lenaImage);
title('Lena Image');

subplot(1, 2, 2);
imshow(jetImage);
title('Jet Image');

figure;
imshow(linearCombinedImage, []);
title('Linear Combination of Lena and Jet');

%% BO-2 Arithmetical operations - Subtraction (with improved data type)
clearvars;
close all;
clc;

lenaImage = imread('C:\Users\pltra\OneDrive\Belgeler\lena.bmp');
jetImage = imread('C:\Users\pltra\OneDrive\Belgeler\jet.bmp');

figure;
subplot(1, 2, 1);
imshow(lenaImage);
title('Lena Image');

subplot(1, 2, 2);
imshow(jetImage);
title('Jet Image');

% Perform image subtraction using the subtraction operator
subtractedImage = lenaImage - jetImage;

figure;
imshow(subtractedImage, []);
title('Subtraction: Lena - Jet');


%% BO-2 Arithmetical operations - Absolute Difference
clearvars;
close all;
clc;

lenaImage = imread('C:\Users\pltra\OneDrive\Belgeler\lena.bmp');
jetImage = imread('C:\Users\pltra\OneDrive\Belgeler\jet.bmp');

figure;
subplot(1, 2, 1);
imshow(lenaImage);
title('Lena Image');

subplot(1, 2, 2);
imshow(jetImage);
title('Jet Image');

% Calculate the absolute difference using the abs function and subtraction operator
absoluteDiffImage = abs(int16(lenaImage) - int16(jetImage)); % Convert to int16 before subtraction

figure;
imshow(absoluteDiffImage, []);
title('Absolute Difference: |Lena - Jet|');
%% BO-2 Arithmetical operations - Multiplication
% Load images
lenaImage = imread('C:\Users\pltra\OneDrive\Belgeler\lena.bmp');
jetImage = imread('C:\Users\pltra\OneDrive\Belgeler\jet.bmp');

figure;
subplot(1, 2, 1);
imshow(lenaImage);
title('Lena Image');

subplot(1, 2, 2);
imshow(jetImage);
title('Jet Image');

% Perform image multiplication using element-wise multiplication
multipliedImage = int16(lenaImage) .* int16(jetImage); % Convert to int16 before multiplication

figure;
imshow(multipliedImage, []);
title('Multiplication: Lena * Jet');
%% BO-2 Arithmetical operations - Absolute Difference (Corrected)
clearvars;
close all;
clc;


lenaImage = imread('C:\Users\pltra\OneDrive\Belgeler\lena.bmp');
jetImage = imread('C:\Users\pltra\OneDrive\Belgeler\jet.bmp');


absoluteDiffImage = abs(int16(lenaImage) - int16(jetImage)); 

figure;
imshow(absoluteDiffImage, []);
title('Absolute Difference: |Lena - Jet|');

%% BO-3 Logical operations
clearvars;
close all;
clc;

circle = logical(imread('C:\Users\pltra\OneDrive\Belgeler\circle.bmp'));
square = logical(imread('C:\Users\pltra\OneDrive\Belgeler\square.bmp'));

notCircle = ~circle;
andResult = circle & square;
orResult = circle | square;
xorResult = xor(circle, square);

figure;
subplot(2, 2, 1);
imshow(circle);
title('Circle');

subplot(2, 2, 2);
imshow(square);
title('Square');

subplot(2, 2, 3);
imshow(notCircle);
title('NOT Circle');

subplot(2, 2, 4);
imshow(andResult);
title('Circle AND Square');

figure;
subplot(2, 2, 1);
imshow(orResult);
title('Circle OR Square');

subplot(2, 2, 2);
imshow(xorResult);
title('Circle XOR Square');

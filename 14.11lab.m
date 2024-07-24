A = imread ('C:\Users\pltra\OneDrive\Belgeler\ertka.bmp');

SE = strel('square',3);

B1 = imerode(A, SE);
B2 = imerode(B1, SE);
B3 = imerode(B2, SE);

figure(1)

subplot(2,2,1), imshow(A), title('Original image');
subplot(2,2,2), imshow(B1), title('Single erosion');
subplot(2,2,3), imshow(B2), title('Double erosion');
subplot(2,2,4), imshow(B3), title('Triple erosion');


B = imread('C:\Users\pltra\OneDrive\Belgeler\face.bmp');

SE_1 = [0,0,1; 0,1,0; 1,0,0];
SE_2 = [1,0,0; 0,1,0; 0,0,1];

B_1 = imerode(B,SE_2);
B_2 = imerode(B,SE_1);

figure(2)
subplot(1,3,1), imshow(B), title('Original image');
subplot(1,3,2), imshow(B_1), title('Remowing lines /');
subplot(1,3,3), imshow(B_2), title('Remowing lines \');


C = imread('C:\Users\pltra\OneDrive\Belgeler\ertka.bmp');

SE_5x5 = strel('square', 5);

C_1 = imerode(C,SE_5x5);
C_2 = imdilate(C,SE_5x5);
C_3 = imopen(C,SE_5x5);
C_4 = imclose(C,SE_5x5);
C_5 = imclose(imopen(C, SE_5x5), SE_5x5);

figure(3)
subplot(2,3,1), imshow(C), title('Original image');
subplot(2,3,2), imshow(C_1), title('After erosion');
subplot(2,3,3), imshow(C_2), title('After dilation');
subplot(2,3,4), imshow(C_3), title('After opening');
subplot(2,3,5), imshow(C_4), title('After closing');
subplot(2,3,6), imshow(C_5), title('After opening, then closing');



A_hom = imread('C:\Users\pltra\OneDrive\Belgeler\hom.bmp');

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = ~SE1;
B_hom_hitmiss = bwhitmiss(A_hom, SE1, SE2);

figure(3)
subplot(1,2,1), imshow(A_hom), title('Original image');
subplot(1,2,2), imshow(B_hom_hitmiss), title('After hit or miss transform');
 
A_text = imread('C:\Users\pltra\OneDrive\Belgeler\text.bmp');

vertical_mask = ones(51,1);
A_text_opening = imopen(A_text,vertical_mask);
marker_image = imerode(A_text, strel('line',51,0));
reconstructed_image = imreconstruct(marker_image, A_text);

figure(4)
subplot(1,3,1), imshow(A_text), title('Original image (Mask)');
subplot(1,3,2), imshow(marker_image), title('Eroded image (Marker)');
subplot(1,3,3), imshow(reconstructed_image), title('Reconstruction (Letters with vertical part)');



A_fingerprint = imread('C:\Users\pltra\OneDrive\Belgeler\fingerprint.bmp');

B1 = bwmorph(A_fingerprint, 'thin', 1);
B2 = bwmorph(A_fingerprint, 'thin', 2);
B_inf = bwmorph(A_fingerprint, 'thin', Inf);

figure(5)
subplot(2,2,1), imshow(A_fingerprint), title('Original image');
subplot(2,2,2), imshow(B1), title('Thinning');
subplot(2,2,3), imshow(B2), title('2x Thinning');
subplot(2,2,4), imshow(B_inf), title('∞ Thinning');

A_bone = imread('C:\Users\pltra\OneDrive\Belgeler\bone.bmp');

B_skeleton = bwmorph(A_bone, 'skel', Inf);

figure(6)
subplot(1,2,1), imshow(A_bone), title('Original image');
subplot(1,2,2), imshow(B_skeleton), title('Skeleton');

B_filled = imfill(A_text, 'holes');

figure(7)
subplot(1,2,1), imshow(A_text), title('Original image');
subplot(1,2,2), imshow(B_filled), title('Image with holes filled');

B_clearborder = imclearborder(A_text);

figure(8)
subplot(1,2,1), imshow(A_text), title('Original image');
subplot(1,2,2), imshow(B_clearborder), title('Image with cleared border');

%%
A = zeros(11, 11);
A(2:10, 2:10) = 1;
A(6, 6:7) = 1;
A(7, 6:7) = 1;
A(6:7, 6) = 1;
A(6:7, 7) = 1;

A(1, 1) = 1;
A(1, 11) = 1;
A(11, 1) = 1;
A(11, 11) = 1;

subplot(2, 3, 1); imagesc(A); title('Original image');


B_erosion = imerode(A, SE);
B_opening = imopen(A, SE);
B_dilation = imdilate(A, SE);
B_closing = imclose(A, SE);

subplot(2, 3, 2); imagesc(B_erosion); title('Eroded image');
subplot(2, 3, 3); imagesc(B_opening); title('Erosion → Dilation (Opening)');
subplot(2, 3, 4); imagesc(B_dilation); title('Dilated image');
subplot(2, 3, 5); imagesc(B_closing); title('Dilation → Erosion (Closing)');


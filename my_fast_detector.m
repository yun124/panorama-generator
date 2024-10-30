
function detected = my_fast_detector (img)
    
    
    [rowSize, colSize] = size(img);

    imgI = zeros(rowSize+6, colSize+6);
    imgI(4:rowSize+3, 4:colSize+3) = img;
    
    pixels = zeros(rowSize, colSize, 16);
    
    pixels(:,:,1) = imgI(1:end-6, 4:end-3) - imgI(4:end-3, 4:end-3);
    pixels(:,:,2) = imgI(1:end-6, 5:end-2) - imgI(4:end-3, 4:end-3);
    pixels(:,:,3) = imgI(2:end-5, 6:end-1) - imgI(4:end-3, 4:end-3);
    pixels(:,:,4) = imgI(3:end-4, 7:end) - imgI(4:end-3, 4:end-3);
    pixels(:,:,5) = imgI(4:end-3, 7:end) - imgI(4:end-3, 4:end-3);
    pixels(:,:,6) = imgI(5:end-2, 7:end) - imgI(4:end-3, 4:end-3);
    pixels(:,:,7) = imgI(6:end-1, 6:end-1) - imgI(4:end-3, 4:end-3);
    pixels(:,:,8) = imgI(7:end, 5:end-2) - imgI(4:end-3, 4:end-3);
    pixels(:,:,9) = imgI(7:end, 4:end-3) - imgI(4:end-3, 4:end-3);
    pixels(:,:,10) = imgI(7:end, 3:end-4) - imgI(4:end-3, 4:end-3);
    pixels(:,:,11) = imgI(6:end-1, 2:end-5) - imgI(4:end-3, 4:end-3);
    pixels(:,:,12) = imgI(5:end-2, 1:end-6) - imgI(4:end-3, 4:end-3);
    pixels(:,:,13) = imgI(4:end-3, 1:end-6) - imgI(4:end-3, 4:end-3);
    pixels(:,:,14) = imgI(3:end-4, 1:end-6) - imgI(4:end-3, 4:end-3);
    pixels(:,:,15) = imgI(2:end-5, 2:end-5) - imgI(4:end-3, 4:end-3);
    pixels(:,:,16) = imgI(1:end-6, 3:end-4) - imgI(4:end-3, 4:end-3);

    threshold = 0.05;
    pixels = (pixels > threshold) | (pixels < -threshold);
    
    
    detected = zeros(rowSize, colSize);
    detected = sum(pixels, 3);

    N = 12;
    detected = detected >= N;

  
end

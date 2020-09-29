A = imread('F:\Offline Signature Identification\my_sig1.jpg'); % Reading image file
I = rgb2gray(A);   %Converting to grayscale image
%% Extracting LBP features
features = extractLBPFeatures(I); % using all default values

%% Computing the number of features
cellsize = size(I);  %(Cellsize decreases --> No of features increases)
numCells = prod(floor(size(I)./cellsize));   % Total number of cells
P = 8;              % Number of Neighbours (P increases --> No of features increases)
Bins = (P*(P-1)+3); % Number of bins in each cell histogram
N = numCells*Bins;  % Number of features

%% Writting features in text file
fileID = fopen('F:\Offline Signature Identification\my_lbp1.txt','a');
fprintf(fileID,'\t%s\r\n\r\n','LBP Features');
fprintf(fileID,'\t%f\r\n',features);
fclose(fileID);
A = imread('F:\Offline Signature Identification\my_sig1.jpg'); % Reading image file
I = rgb2gray(A);                 %Converting to grayscale image

%% Setting Offset values and computing GLCM
offset6 = [0 1;-1 1;-1 0;-1 -1;0 2;-2 2;-2 0;-2 -2;0 3;-3 3;-3 0;-3 -3;0 4;-4 4;-4 0;-4 -4];
glcms10 = graycomatrix(I,'Offset',offset6,'NumLevels',256,'GrayLimits',[0 255],'Symmetric',true); % See khata

%% Computing Contrast,Energy,Correlation and Homogeneity from GLCM
stats10 = graycoprops(glcms10,'all'); %4 features

%% Computing Entropy,MeanG,Standard Deviation from GLCM
Ent = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];   %16 vector(one dimentional array)
MeanG = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];   %16 vector(one dimentional array)
B = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];   %16 vector(one dimentional array)
for i = 1:16
Ent(i) = entropy(glcms10(:,:,i));
MeanG(i) = log(log(mean2(glcms10(:,:,i))));    %Extracting three features
B(i) = std2(glcms10(:,:,i));
end

%%  Writting features in text file
fileID = fopen('F:\Offline Signature Identification\my_glcm1.txt','a');
fprintf(fileID,'%s\t\t%s\t\t\t%s\t\t%s\t\t%s\t\t\t%s\t\t\t%s\r\n\r\n','Contrast','Energy','Correlation','Homogeneity','Entropy','MeanG','Standard Deviation');
fprintf(fileID,'%f\t\t%f\t\t%f\t\t%f\t\t%f\t\t%f\t\t%f\r\n',stats10.Contrast,stats10.Energy,stats10.Correlation,stats10.Homogeneity,Ent,MeanG,B);
fclose(fileID);
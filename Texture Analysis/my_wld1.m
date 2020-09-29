features = d_differential_excitation.*theta;

J = sum(features);

%%  Writting features in text file
fileID = fopen('F:\Offline Signature Identification\my_wld1.txt','a');
fprintf(fileID,'\t%s\r\n','WLD features');
fprintf(fileID,'\t%f\r\n',J);
fclose(fileID);
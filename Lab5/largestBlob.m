function binaryImage = largestBlob(binaryImage, numberToExtract)
  
  [labeledImage, numberOfBlobs] = bwlabel(binaryImage);
  blobMeasurements = regionprops(labeledImage, 'area');
  % Get all the areas
  allAreas = [blobMeasurements.Area];
  % sort the areas in descendent order
  [sortedAreas, sortIndexes] = sort(allAreas, 'descend');
  % Extract the "numberToExtract" largest blob(s) using ismember().
  biggestBlob = ismember(labeledImage, sortIndexes(1:numberToExtract));
  % Convert from integer labeled image into binary (logical) image.
  binaryImage = biggestBlob > 0;

end
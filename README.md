# ImageAnalysis
This repository contains Matlab code for 3D single cell segmentation and analysis. Step by step instructions can be found [here](https://github.com/colganwi/ImageAnalysis/blob/master/instructions/Image%20Analysis%20Directions.pdf).

## Segmentation
**Segmenter** is an Matlab app for single cell segmentation. The simple user interface alows parameters to adjusted until an accurate segmentation is achieved. Cells can be segmented in 3D by thresholding a cytoplasmic marker or by performing a watershed transform on a membrane marker.

<img src="https://github.com/colganwi/ImageAnalysis/blob/master/instructions/Segmenter.png" width="480">

The segmentation parameters include:
1. A 3D clipping plane to remove adjacent cells
2. The thresholding level and channel.
3. The sigma of the guassian applied before thresholding.
4. The amount of dialation and erosion.
5. The approximate radius of the cell.

You can scroll through the z dimension in the app and the cell mask can be viewed in 3D.

<img src="https://github.com/colganwi/ImageAnalysis/blob/master/instructions/3DView.png" width="480">

Once an accurate segmantation is achieved it can be saved as a Tiff. The cell can then be analyzed with Matlab, ImageJ, or any other program.

## Analysis
The **analysis** script applies a function to a folder of images and saves the result as Excel file. My **analyze** function thresholds the channels at the 90th percentile to identify puncta and then calculates the enrichment and fractional overlap for three regions: plasma membrane (<1um), peripheral cytoplasm (1-3um), and deep cytoplasm (>3um).

<img src="https://github.com/colganwi/ImageAnalysis/blob/master/instructions/Analysis.png" width="480">

Different functions can easily be written to analyze cells in different ways.

## Visualization
This repository also includes code for visualizing enrichment and fractional overlap. The **distribution** script generates a circular heatmap that represents the average fractional overlap for a set of cells.

<img src="https://github.com/colganwi/ImageAnalysis/blob/master/instructions/HeatMap.png" width="480">



# MeDUsA
For details, please read the paper here: 論文のアドレス

### MeDUsA (a *Me*thod for the quantification of *D*egeneration *Us*ing fly *A*xons) is a software that automatically creates masks and counts axon terminals using a combination of deep learning and Python. By using the software, the number of R7 axons in Drosophila can be automatically quantified easily and quickly from confocal images.

To download the MeDUsA for Windows visit here: [https://doi.org/10.5281/zenodo.5533046](https://doi.org/10.5281/zenodo.5533046)

To download the pretrained model please visit here:  [https://doi.org/10.5281/zenodo.5533811](https://doi.org/10.5281/zenodo.5533811)

To download the sample files visit here: [MeDUsA_samples.zip](https://github.com/SugieLab/MeDUsA/blob/5b34dcd87ba854033e07035d54a5de1a8decd8e4/Sample/MeDUsA_samples.zip)


## Preparation before using the MeDUsA
See Fig. 2 (C) of the above paper for specimen preparation.<br><br>
When scanning your samples, please keep in mind the following points:
- Pixel size of each slice in the z-stack must be 512 * 512 pixels.
- Pixel width/height of the each slice should be around 0.414 µm.
- z-stack step size should be 1 µm.
- Scanning samples with each axon terminal positioned diagonally (see above sample files).
- ![Test Image 1](images/Scanning Area.png?raw=true)

After scanning, you need to convert confocal z-stacks into tif files. The tif files must be named in the following order: 001.tif, 002.tif, ...<br> Next, each tif files needs to be placed in a different folder for each sample, and the folder name must end with "_ raw".


## Runnning the MeDUsA
MeDUsA has a very simple graphical interface and is capable of automatically quantify the number of R7 axons of *Drosophila* in a few short steps.
1. In 'data folder', choose the folder containing the samples you would like to predict.
2. In 'mask output folder', choose the folder where you would like to export predicted mask files.
3. In 'mask output folder', choose the folder where you would like to output the .csv file for prediction results.
4. In 'model hdf5', choose the pretrained model you downloaded above.
5. In 'percent of images to output detection points', ほにゃらら
6. Click the start button.

Prediction will start immediately and predicted mask will be exported as tif files to the folder specified in step-2 and prediction result will be exported as csv file to the folder selected in step-3.<br>
Prediction takes 50 seconds per sample on a typical desktop workstation (CPU: Intel Core i7 9800 X 3.8 GHz RAM: DDR4 128 GB).

## Trouble shooting

## Contact
### Developer:
Hiroki Kawai

### Corresponding Author:
Atsushi Sugie, PhD<br>
Associate Professor<br>
Brain Research Institute<br>
Niigata University<br>
E-mail: atsushi.sugie [at] bri.niigata-u.ac.jp

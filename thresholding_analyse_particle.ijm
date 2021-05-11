//Select Directories
input = getDirectory("Choose Source Directory");
output = getDirectory("Choose Destination Directory");

//===============================

run("Bio-Formats Macro Extensions"); // need this to run to open images with the special importer (see below)
									// that does not have the popup window

list = getFileList(input);			//a new variable containing the names of the files in the input variable
for (i = 0; i < list.length; i++)
        action(input, output, list[i]);
 
function action(input, output, filename) {
        Ext.openImagePlus(input+list[i]); //this is the line to open images without the bioformats importer
        filename = getTitle();
        run("Threshold...");
        setThreshold(280, 65535);            // set here the thresholding values
        setOption("BlackBackground", false);
        run("Convert to Mask");
        run("Analyze Particles...", "size=0.10-6 show=Outlines display overlay");
        run("Close All");
}

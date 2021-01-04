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
        run("Split Channels");
        selectWindow("C1-" + filename);  // change here dependent on which channel you want to do the max projection (C1- - is channel one etc.)
        run("Grays");
        run("Z Project...", "projection=[Max Intensity]");
        saveAs("Tiff", output + filename + "max_proj_GFP");
        run("Close All");
}

You can directly run the test.m file. 
I already store the parameters for these lines and ellipses in the linepara.mat and ellipse.mat file.
If you want to run my alogrithm, you can delete the %% before
%%[A,para] = houghLine(n,m,data);  line 28
%%ellipse = houghellipse(data); line 48

The most important files are houghline and houghellipse, these two files implement the alogrithm for hough transform.

My result picture is in the picture folder.



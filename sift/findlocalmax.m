function localmax = findlocalmax(octave,smin)
%this funciton take n^3 time complexity, so it's little slow
[N,M,S]=size(octave); 
m=1;
localmax = [];
eps = 0.02;
for s=2:S-1
    for j=20:M-20
        for i=20:N-20
            a=octave(i,j,s);
            if a>octave(i-1,j-1,s-1) && a>octave(i-1,j,s-1) && a>octave(i-1,j+1,s-1) ...
                    && a>octave(i,j-1,s-1) && a>octave(i,j+1,s-1) && a>octave(i+1,j-1,s-1) ...
                    && a>octave(i+1,j,s-1) && a>octave(i+1,j+1,s-1) && a>octave(i-1,j-1,s) ...
                    && a>octave(i-1,j,s) && a>octave(i-1,j+1,s) && a>octave(i,j-1,s) ...
                    && a>octave(i,j+1,s) && a>octave(i+1,j-1,s) && a>octave(i+1,j,s) ...
                    && a>octave(i+1,j+1,s) && a>octave(i-1,j-1,s+1) && a>octave(i-1,j,s+1) ...
                    && a>octave(i-1,j+1,s+1) && a>octave(i,j-1,s+1) && a>octave(i,j+1,s+1) ...
                    && a>octave(i+1,j-1,s+1) && a>octave(i+1,j,s+1) && a>octave(i+1,j+1,s+1)...
                    && a > eps
           
                localmax(1,m)=j-1;
                localmax(2,m)=i-1;
                localmax(3,m)=s+smin-1;
                m=m+1;
            end
        end
    end
end
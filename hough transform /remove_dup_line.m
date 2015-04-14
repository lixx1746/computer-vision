% these function can remove parallel lines, so i just want to draw one line
% for each pair of the parallel lines
function para = remove_dup_line(para)
i = 1;
while i < length(para)
para = remove_dup(para(i,:),para);
i = i+1;
end

function para = remove_dup(a,para)
index = near(a,para);
para(index,:) = [];
para = [a;para];


function index = near(a,para)
eps = 0.08;
index = [];
for i = 1 : length(para)
    if (abs(a(1) - para(i,1))< eps)
        index = [i;index];
    end
end


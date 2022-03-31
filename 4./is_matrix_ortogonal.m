function orth = is_matrix_ortogonal(A)
orth = 1;
for i = 1:size(A,1) 
    for j = i+1:size(A,2)
        value = dot(A(:,i),A(:,j));
        if value~=0
            orth=0;
            break;
        end
    end 
end 
end
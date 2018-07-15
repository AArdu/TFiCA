CPT1 = cell(1,N);
for i=1:N
  s=struct(bnet3.CPD{i});  % violate object privacy
  CPT1{i}=s.CPT;
end

dispcpt(CPT1{2})
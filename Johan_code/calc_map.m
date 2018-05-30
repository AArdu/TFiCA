function [map] = calc_map(engine, evidence, explanation)
% CALC_MAP Computes the Partial MAP 
%
% INPUT
% engine must support max-propagation
% evidence{i} is the observed value of node i, or [] if hidden
% explanation is the set of variables for which an explanation is sought
%
% OUTPUT
% mpe{i} is the most likely value of node i (cell array!)

[engine, ll] = enter_evidence(engine, evidence);

observed = ~isemptycell(evidence);
N = length(evidence);
map = cell(1,N);
for i=1:N
  m = marginal_nodes(engine, i);
  % observed nodes are all set to 1 inside the inference engine, so we must undo this
  if observed(i)
    map{i} = evidence{i};
  else
    if ismember(i, explanation)
	  map{i} = argmax(m.T);
    end
  end
end

function dif = diff_expl(map, explanation, N)
% diff_expl returns 1 if the variables in explanation differ in the various cell arrays of map,
% and 0 if they are all the same
%
% INPUT
% explanation is the set of variables for which an explanation is sought
% map is a m-sized cell array, where each cell denotes an array of map variables

M = length(map);
diff_map = 0;

for i=1:N
	if ismember(i, explanation)
		values = map{1};
		val = values{i};
		for j=1:M
			values = map{j};
			if val ~= values{i};
				diff_map = 1;
			end
		end
	end
end
%dif = floor(2 * rand(1));

dif = diff_map;

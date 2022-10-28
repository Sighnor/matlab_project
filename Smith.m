function [G] = Smith(roughness, in, out)
idotn = dot([0 0 1], in);
odotn = dot([0 0 1], out);
k = (roughness + 1)^2 / 8;
Gi = idotn / (idotn * (1 - k) + k);
Go = odotn / (odotn * (1 - k) + k);
G = Gi * Go;
end

function [output] = my_normalize(input)
    output = input / norm(input);
end
function [ tab ] = push( tab,val)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    tab(end+1,1) = val(1);
    tab(end,2) = val(2);

end


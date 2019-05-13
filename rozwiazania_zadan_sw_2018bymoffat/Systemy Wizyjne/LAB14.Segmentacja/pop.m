function [ tab, val1, val2 ] = pop( tab )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
     val1 = tab(end,1);
     val2 = tab(end,2);
     tab(end,:)=[];
end


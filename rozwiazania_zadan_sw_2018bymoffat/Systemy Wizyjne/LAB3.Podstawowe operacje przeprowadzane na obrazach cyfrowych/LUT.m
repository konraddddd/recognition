function LUT(obraz,przekodowanie)
subplot(3,1,1);
plot(przekodowanie)
title('Przekodowanie')
subplot(3,1,2)
imshow(obraz)
title('Input Image')
subplot(3,1,3)
imshow(intlut(obraz,przekodowanie))
title('LUT img')
end
%% Reiknrit 1

y = zeros(1,10)
y(4) = 1

x = zeros(1,10)

for i = 2:5
    x(i) = 1
    i = i + 1
end


z = conv(x,y)
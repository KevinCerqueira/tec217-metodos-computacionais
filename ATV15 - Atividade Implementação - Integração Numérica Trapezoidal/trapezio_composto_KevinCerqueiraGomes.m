x = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0];
y = [1.00000, 0.89445, 0.70711, 0.55475, 0.44722, 0.37138, 0.31623, 0.27473, 0.24254];

function area = trapezio_composto(x, y)
  n = length(x);
  area = 0;
  
  for i = 1:(n-1)
    h = x(i+1) - x(i);
    area = area + (y(i) + y(i+1)) * h / 2;
  end
end

area = trapezio_composto(x, y);
disp(area);

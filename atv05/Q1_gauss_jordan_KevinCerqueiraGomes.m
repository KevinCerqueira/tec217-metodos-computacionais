% Passo 1
m = Ab(2,1)/Ab(1,1);
Ab(2,:) = Ab(2,:) - m*Ab(1,:);

m = Ab(3,1)/Ab(1,1);
Ab(3,:) = Ab(3,:) - m*Ab(1,:);

% Passo 2
m = Ab(3,2)/Ab(2,2);
Ab(3,:) = Ab(3,:) - m*Ab(2,:);

% Passo 3
Ab(3,:) = Ab(3,:)/Ab(3,3);

m = Ab(2,3)/Ab(3,3);
Ab(2,:) = Ab(2,:) - m*Ab(3,:);

m = Ab(1,3)/Ab(3,3);
Ab(1,:) = Ab(1,:) - m*Ab(3,:);

% Passo 4
Ab(2,:) = Ab(2,:)/Ab(2,2);

m = Ab(1,2)/Ab(2,2);
Ab(1,:) = Ab(1,:) - m*Ab(2,:);

disp(Ab);
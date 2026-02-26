clear

% Chance of an adjacent square catching fire
light_chance = .5;
max_res = .5;
min_res = -.2;
% Size of the grid
matrix_size = 20;
% Number of iterations
num_iterations = 10;
% Iterations to average
avg_num = 1000;

% Instantiate a zero matrix
grid = zeros(matrix_size);

% Make a resitance matrix
res_grid = grid;
for row = 1:matrix_size
    for col = 1:matrix_size
        res_grid(row, col) = (max_res - min_res).*rand(1)+min_res;
    end

end

% Set starting point
grid(matrix_size / 2, matrix_size/2) = 1;

avg_grid = zeros([matrix_size matrix_size num_iterations]);
avg_grid(:,:,1) = grid;
grid_copy = grid;

for iter = 1:avg_num
    % Run the propogation
    grid = grid_copy;
    for iteration=2:num_iterations
        grid = propogate_onestep(grid, light_chance, res_grid);
        avg_grid(:,:,iteration) = avg_grid(:,:,iteration) + grid;
    end
    
end

avg_grid = avg_grid / avg_num;

Mmov = avg_grid;
% Make the movie
make_movie(Mmov, num_iterations)
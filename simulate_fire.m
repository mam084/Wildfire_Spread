function mean_area = simulate_fire(p, moisture_level, drying, grid_size, num_steps, num_trials)
% SIMULATE_FIRE  Average burning area over time across repeated trials.
%   Starts a single fire in the center of a grid_size x grid_size grid with
%   uniform moisture, runs num_steps timesteps, and returns a 1 x num_steps
%   vector of the mean number of burning cells at each step.

    area = zeros(num_trials, num_steps);
    center = ceil(grid_size / 2);
    for trial = 1:num_trials
        grid = zeros(grid_size);
        moisture = moisture_level * ones(grid_size);
        grid(center, center) = 1;
        area(trial, 1) = 1;
        for step = 2:num_steps
            [grid, moisture] = propagate_step(grid, moisture, p, drying);
            area(trial, step) = sum(grid(:));
        end
    end
    mean_area = mean(area, 1);
end

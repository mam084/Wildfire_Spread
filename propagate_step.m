function [grid, moisture] = propagate_step(grid, moisture, p, drying)
% PROPAGATE_STEP  Advance the fire one timestep.
%   grid      - matrix of 0 (unburned) and 1 (burning)
%   moisture  - matrix of moisture levels in [0, 1], same size as grid
%   p         - base ignition probability
%   drying    - drying factor d >= 1; a neighbor that fails to ignite has
%               its moisture divided by d (d = 1 means no drying)
%
%   Each unburned cell next to a burning cell (all 8 neighbors) gets one
%   ignition attempt per burning neighbor, succeeding when rand <= p*(1-m).
%   Cells that fail dry out. Decisions use the grid from the start of the
%   step, so fire spreads at most one cell per timestep.

    [n_rows, n_cols] = size(grid);
    burning = grid;
    for row = 1:n_rows
        for col = 1:n_cols
            if burning(row, col) ~= 1
                continue
            end
            for dr = -1:1
                for dc = -1:1
                    r = row + dr;
                    c = col + dc;
                    if r < 1 || r > n_rows || c < 1 || c > n_cols || grid(r, c) == 1
                        continue
                    end
                    if rand() <= p * (1 - moisture(r, c))
                        grid(r, c) = 1;
                    else
                        moisture(r, c) = moisture(r, c) / drying;
                    end
                end
            end
        end
    end
end

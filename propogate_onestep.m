function grid = propogate_onestep(grid, light_chance, resist)
    % Copy grid so that newly propogated squares don't factor in
    grid_copy = grid;
    row_dimen = size(grid, 1);
    col_dimen = size(grid, 2);
    % Loop through the rows
    for row = 1:row_dimen
        % Loop thorugh the columns
        for col = 1:col_dimen
            % If space is alight
            if grid_copy(row, col) == 1
                % Iterate through all neighboring spaces
                for row_neighbor = -1:1
                    for col_neighbor = -1:1
                        % Get grid coordinates
                        row_adj = row + row_neighbor;
                        col_adj = col + col_neighbor;
                        % If space is in the grid...
                        if row_adj >= 1 && row_adj <= row_dimen && col_adj >= 1 && col_adj <= col_dimen
                            % Set space alight based on probability
                            if rand(1) <= light_chance - resist(row_adj, col_adj)
                                grid(row_adj, col_adj) = 1;
                            end
                        end
                    end
                end
            end
        end
    end
              
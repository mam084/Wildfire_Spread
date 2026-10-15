% RUN_EXPERIMENTS  Reproduce the three experiments from the paper and save
% plots of fire area over time to figures/.

clear
rng(0);  % reproducible results

grid_size = 20;
num_steps = 10;
num_trials = 1000;
steps = 1:num_steps;

if ~exist('figures', 'dir')
    mkdir('figures');
end

% 1. No moisture, no drying: vary ignition probability
probabilities = [0.25 0.5 0.75];
figure; hold on
for p = probabilities
    plot(steps, simulate_fire(p, 0, 1, grid_size, num_steps, num_trials), '-o', ...
        'DisplayName', sprintf('p = %.2f', p));
end
title('No moisture, no drying'); xlabel('Timestep'); ylabel('Mean burning cells');
legend('Location', 'northwest'); grid on
saveas(gcf, fullfile('figures', 'exp1_ignition_probability.png'));

% 2. Moisture without drying: p = 0.5, vary moisture
moisture_levels = [0 0.25 0.5 0.75];
figure; hold on
for m = moisture_levels
    plot(steps, simulate_fire(0.5, m, 1, grid_size, num_steps, num_trials), '-o', ...
        'DisplayName', sprintf('m = %.2f', m));
end
title('Moisture without drying (p = 0.5)'); xlabel('Timestep'); ylabel('Mean burning cells');
legend('Location', 'northwest'); grid on
saveas(gcf, fullfile('figures', 'exp2_moisture.png'));

% 3. Moisture with drying: p = 0.5, m = 0.75, vary drying factor
drying_factors = [1 2 4 8];
figure; hold on
for d = drying_factors
    plot(steps, simulate_fire(0.5, 0.75, d, grid_size, num_steps, num_trials), '-o', ...
        'DisplayName', sprintf('d = %d', d));
end
plot(steps, simulate_fire(0.5, 0, 1, grid_size, num_steps, num_trials), 'k--', ...
    'DisplayName', 'dry grid (m = 0)');
title('Moisture with drying (p = 0.5, m = 0.75)'); xlabel('Timestep'); ylabel('Mean burning cells');
legend('Location', 'northwest'); grid on
saveas(gcf, fullfile('figures', 'exp3_drying.png'));

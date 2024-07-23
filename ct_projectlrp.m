years = [2016, 2017, 2018, 2019, 2020];
predictions_10s = [9.60319, 9.6202, 9.63731, 9.6545, 9.67178];
predictions_50s = [9.79818, 9.81512, 9.83214, 9.84924, 9.84924];
real_values = [10, 9.8,  9.7, 9.9, 10.1];

abs_errors_10s = abs(predictions_10s - real_values);
abs_errors_50s = abs(predictions_50s - real_values);

figure;
plot(years, real_values, 'o-', 'LineWidth', 2, 'DisplayName', 'Real');
hold on;

for i = 1:length(years)
    line([years(i), years(i)], [predictions_10s(i) - abs_errors_10s(i), predictions_10s(i) + abs_errors_10s(i)], 'Color', [0 1 0], 'LineWidth', 2); % Yeşil renk
end
plot(years, predictions_10s, 's-', 'LineWidth', 2, 'DisplayName', 'Predict with 10s');

for i = 1:length(years)
    line([years(i), years(i)], [predictions_50s(i) - abs_errors_50s(i), predictions_50s(i) + abs_errors_50s(i)], 'Color', [0.5 0 0.5], 'LineWidth', 2); % Mor renk
end
plot(years, predictions_50s, 'd-', 'LineWidth', 2, 'DisplayName', 'Predict with 50s');
hold off;

title('Comparison of Predictions and Real Values with Absolute Errors');
xlabel('Year'); ylabel('Value');
grid on;

legend('Real', 'Predict with 10s', 'Predict with 50s', 'Location', 'Best'); %

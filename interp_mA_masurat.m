% Date originale
x = [-50.85, -51, -53.08, -55.93, -61.04, -69.86, -88.03, 83.02, 74.85, 62.80];
y = [6, 7, 9, 13, 19, 28, 50, 61, 73, 85];

% Transformări
x_final = x;
for i = 1:length(x)
    if x(i) < 0
        % negative → modul
        x_final(i) = -x(i);
    else
        % pozitive → cadran 2
        x_final(i) = 180 - x(i);
    end
end

disp('x_final:');
disp(x_final);

% Interpolare polinomială (grad 3, de exemplu)
n = 3;
p = polyfit(x_final, y, n);

disp('Coeficienții polinomului (grad 3):');
disp(p);

% Generăm puncte pentru desen
x_fit = linspace(min(x_final), max(x_final), 200);
y_fit = polyval(p, x_fit);

% Plot
figure;
plot(x_final, y, 'o', 'MarkerSize', 8, 'DisplayName', 'Date transformate');
hold on;
plot(x_fit, y_fit, '-', 'LineWidth', 2, 'DisplayName', sprintf('Interpolare grad %d', n));
xlabel('x (modificat)');
ylabel('y (mA)');
legend;
grid on;

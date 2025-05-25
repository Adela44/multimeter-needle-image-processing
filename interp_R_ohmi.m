x = [-50.85, -51, -53.08, -55.93, -61.04, -69.86, -88.03, 83.02, 74.85, 62.80];
y = [820, 680, 560, 390, 270, 180, 100, 82, 68, 56];  % in Ohmi

% Transformare x
x_final = x;
for i = 1:length(x)
    if x(i) < 0
        x_final(i) = -x(i);  % negative → modul
    else
        x_final(i) = 180 - x(i);  % pozitive → cadran 2
    end
end

% Transformare y -> log10(y)
log_y = log10(y);

% Alegem gradul polinomului (ex: grad 3)
grad_polinom = 2;

% Fit pe log(y)
coef_polinom_log = polyfit(x_final, log_y, grad_polinom);

disp('Coeficienții polinomului pe log10(y):');
disp(coef_polinom_log);

% Generăm puncte pentru desen
x_fit = linspace(min(x_final), max(x_final), 500);
log_y_fit = polyval(coef_polinom_log, x_fit);
y_fit = 10.^log_y_fit;  % revenim la scara originală

% Plot log(y)
figure;
semilogy(x_final, y, 'o', 'MarkerSize', 8, 'DisplayName', 'Date originale');
hold on;
semilogy(x_fit, y_fit, '-', 'LineWidth', 2, 'DisplayName', sprintf('Fit pe log(y), grad %d', grad_polinom));
xlabel('x (modificat)');
ylabel('y (Ohmi, scara logaritmică)');
legend;
grid on;
title('Interpolare Polinomială pe log(y)');

log_y = polyval([0, 0.0019, -0.1874, 8.4167], x);
y_new = 10.^log_y;




log_y_func = @(x) 0.0003 .* x.^2 - 0.0586 .* x + 5.1327;

% Calculam y(x)
y_func = @(x) 10.^log_y_func(x);
y_func(51)

% Date originale
x = [-50.85, -51, -53.08, -55.93, -61.04, -69.86, -88.03, 83.02, 74.85, 62.80];
y_Amp = [6, 7, 9, 13, 19, 28, 50, 61, 73, 89];
z_Ohm = [820, 680, 560, 390, 270, 180, 100, 82, 68, 56];

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

% Interpolare polinomială
n = 2;
p = polyfit(x_final, y_Amp, n);

U = 5 %V

f_Amp = @(x) (0.0024*x^(2) + 0.832*x - 41.72777);
f_Ohm = @(x) (U/f_Amp(x))*10^3;

%Exemplu pentru valoarea unghiului 53.08
disp('Valoarea I (Amp): ')
f_Amp(53)

disp('Valoarea R (Ohm): ')
f_Ohm(53)

disp('Coeficienții polinomului (grad 2):');
disp(p);

% Generăm puncte pentru desen
x_fit = linspace(min(x_final), max(x_final), 200);
y_fit = polyval(p, x_fit);

% Plot
figure;
plot(x_final, y_Amp, 'o', 'MarkerSize', 8, 'DisplayName', 'Date transformate');
hold on;
plot(x_fit, y_fit, '-', 'LineWidth', 2, 'DisplayName', sprintf('Interpolare grad %d', n));
xlabel('x (unghi)');
ylabel('y (mA)');
legend;
grid on;

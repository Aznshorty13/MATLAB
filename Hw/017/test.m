syms x

clf
f(x) = sin(x)/x;
fplot(f, [-20, 20]);
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '01 made.png');

clf
f(x) = (10*x-3)/(x-13);
fplot(f, [3, 23]);
set(gca,'xtick',[5,10,15,20]);
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '02 made.png');

clf
f(x) = 3*x+(x-3)/(x+20);
fplot(f, [-30, -10]);
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '03 made.png');

clf
f(x) = sin(1/x);
fplot(f, [-1, 1]);
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '04 made.png');

clf
f(x) = x*sin(1/x);
fplot(f, [-1, 1]);
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '05 made.png');

clf
f(x) = x^2*sin(1/x);
fplot(f, [-1, 1]);
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '06 made.png');

clf
f(x) = log(abs(x));
fplot(f, [-1, 1]);
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '07 made.png');

clf
g(x) = x;
f(x) = x*sin(1/x);
lims = [-0.25, 0.25];
fplot(f, lims);
hold on
g(x) = x;
fplot(g, lims, 'r');
fplot(-g, lims, 'r');
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '08 made.png');

clf
g(x) = x^2;
f(x) = x^2*sin(1/x);
lims = [-0.25, 0.25];
fplot(f, lims);
hold on
g(x) = x^2;
fplot(g, lims, 'r');
fplot(-g, lims, 'r');
title(['$y = ', latex(f), '$'], 'Interpreter', 'latex')
saveas(gcf, '09 made.png');

clf
g(x) = cos(x);
f(x) = 1-x^2/2;
h(x) = x^4/24-x^2/2+1;
lims = [-pi, pi];
fplot(g, lims,'b');
hold on
g(x) = cos(x);
fplot(f, lims, 'r');
hold on
h(x) =  x^4/24-x^2/2+1;
fplot(h,lims,'y')
hold off
legend('cos(x)','1-x^2/2','x^4/24-x^2/2+1') % Note you could just "legend TOGGLE"
saveas(gcf, '10 made.png');

% Hint: the box you see in 10.png is called a legend.


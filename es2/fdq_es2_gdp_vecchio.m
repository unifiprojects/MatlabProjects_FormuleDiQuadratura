clc
f1 = @(x) x;
f2 = @(x) x.^2;
f3 = @(x) x.^3;
f4 = @(x) x.^4;

num_intervalli = 10;
If1 = simpson( num_intervalli, 0, 30, f1) %valore vero = 450     OK
If2 = simpson( num_intervalli, 0, 30, f2) %valore vero = 9000    OK
If3 = simpson( num_intervalli, 0, 30, f3) %valore vero = 202500  OK
If4 = simpson( num_intervalli, 0, 30, f4) %valore vero = 4860000

% RISULTATO: simpson diventa spreciso dal polinomio di grado 4, quindi
% ha gdp n=3

function If = simpson( m, a, b, f )
% If = simpson( m, a, b, f )
% Calcola l'integrale della funzione, nell'intervallo prescelto, usando la
% formula di Simpson composita.
%
% Input:
%   m: numero di intervalli in [a,b] (deve essere maggiore di 0 e pari)
%   a: estremo sinistro
%   b: estremo destro
%   f: funzione integranda
% Output:
%   If: valore approssimato dell'integrale definito della funzione

    % Controlli di robustezza:
    % - m deve essere maggiore di 0
    % - a deve essere minore di b
    if m<=0
        error("Numero di intervalli non corretto.")
    end
    if a>=b
        error("Intervallo di integrazione non corretto.")
    end

    x = linspace(a,b,m+1);
    y = f(x);
    If = ((b-a)/(3*m)) * (y(1) + 4 * sum(y(2:2:m+1)) + 2 * sum(y(3:2:m-1)) + y(end));  
end
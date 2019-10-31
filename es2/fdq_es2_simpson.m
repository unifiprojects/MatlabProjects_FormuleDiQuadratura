clc
f = @(x) x.*sin(x);

m = 2 * 100
If = simpson(m, 0, pi, f)

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
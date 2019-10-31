clc
f = @(x) x.*sin(x);
If = trapezi( 500, 0, pi, f)

function If = trapezi( m, a, b, f )
% If = trapezi( n, a, b, f )
% Calcola l'integrale della funzione, nell'intervallo prescelto, usando la
% formula dei trapezi composita.
%
% Input: 
%   m: numero di intervalli in [a,b] (deve essere maggiore di 0)
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
    If = ((b-a)/(2*m))*(2*sum(y)-(y(1)+y(end)));
    return
end
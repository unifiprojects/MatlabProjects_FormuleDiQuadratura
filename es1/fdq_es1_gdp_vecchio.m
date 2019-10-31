clc
f = @(x) x;
f2 = @(x) x.^2;
f3 = @(x) x.^3;
f4 = @(x) x.^4;

num_intervalli = 10;
If1 = trapezi( num_intervalli, 0, 30, f) %valore vero = 450     OK
If2 = trapezi( num_intervalli, 0, 30, f2) %valore vero = 9000    
If3 = trapezi( num_intervalli, 0, 30, f3) %valore vero = 202500  
If4 = trapezi( num_intervalli, 0, 30, f4) %valore vero = 4860000

% RISULTATO: trapezi diventa spreciso gia' dal polinomio di grado 2, quindi
% ha gdp n=1

function If = trapezi( num_intervalli, a, b, f )
% If = trapezi( num_intervalli, a, b, f )
% Calcola l'integrale della funzione, nell'intervallo prescelto, usando la
% formula dei trapezi composita.
%
% Input: 
%   num_intervalli: numero di intervalli in [a,b] (deve essere maggiore di 0)
%   a: estremo sinistro
%   b: estremo destro
%   f: funzione integranda
% Output:
%   If: valore approssimato dell'integrale definito della funzione

    % Controlli di robustezza:
    % - num_intervalli deve essere maggiore di 0
    % - a deve essere minore di b
    if num_intervalli<=0
        error("Numero di intervalli non corretto.")
    end
    if a>=b
        error("Intervallo di integrazione non corretto.")
    end
    x = linspace(a,b,num_intervalli+1);
    y = f(x);
    If = ((b-a)/(2*num_intervalli))*(2*sum(y)-(y(1)+y(end)));
    return
end
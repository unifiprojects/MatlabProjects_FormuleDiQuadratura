clc
f1 = @(x) x;
f2 = @(x) x.^2;
f3 = @(x) x.^3;
f4 = @(x) x.^4;
f5 = @(x) x.^5;
f6 = @(x) x.^6;

num_intervalli=2;
If1 = gauss_chebychev( num_intervalli, -1, 1, f1) %valore vero = 0       OK
If2 = gauss_chebychev( num_intervalli, -1, 1, f2) %valore vero = 1.5708  OK
If3 = gauss_chebychev( num_intervalli, -1, 1, f3) %valore vero = 0       OK
If4 = gauss_chebychev( num_intervalli, -1, 1, f4) %valore vero = 1.1781  OK
If5 = gauss_chebychev( num_intervalli, -1, 1, f5) %valore vero = 0       OK
If6 = gauss_chebychev( num_intervalli, -1, 1, f6) %valore vero = 0.9817


% RISULTATO:grado di precisione 2n+1, con n = 2 diventa spreciso dal polinomio di grado 6 

g = @(x) f./(sqrt(1-x.^2));
%Calcolo dell'integrale della funzione g con il metodo di Gauss-Chebychev
function If = gauss_chebychev( m, a, b, f )
% If = gauss_chebychev( n, a, b, f )
% Calcola l'integrale della funzione, nell'intervallo prescelto, usando la
% formula dei Gauss Chebychev.
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
    punti_cheby = cheby(m,a,b);
    If = sum(f(punti_cheby).*(pi/(m + 1)));
    return
end

function xi = cheby(n, a, b)
   % xi = cheby(n, a, b)
   % Calcola le ascisse di Chebyshev per il polinomio di grado n
   % trasformate in [a,b]
   %
   % INPUT:
   %    n: grado del polinomio interpolante
   %    a: estremo sinistro
   %    b: estremo destro
   %
   % OUTPUT:
   %    xi: ascisse di Chebyshev
  
   if n<=0
       error('Il numero n inserito deve essere maggiore di 0.')
   end
   xi = cos((2*[0:n]+1)*pi/(2*n+2));
   xi = ((a+b)+(b-a)*xi)/2;
   return
end
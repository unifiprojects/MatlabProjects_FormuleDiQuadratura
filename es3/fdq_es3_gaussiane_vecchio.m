clc
f = @(x) x.*sin(x);

g = @(x) f./(sqrt(1-x.^2));

If = gauss_chebychev( 500, -1, 1, f)

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
    x = cheby(m,a,b);
    If = sum(f(x).*(pi/(m + 1)));
    return
end

function xi = cheby(n, a, b)
   % xi = ceby(n, a, b)
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
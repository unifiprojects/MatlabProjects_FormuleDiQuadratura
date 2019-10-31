clc
clear
format long g

f1 = @(x) x;
f2 = @(x) x.^2;
f3 = @(x) x.^3;
f4 = @(x) x.^4;
integrale_vero_f1 = 450;
integrale_vero_f2 = 9000;
integrale_vero_f3 = 202500;
integrale_vero_f4 = 4860000;

vettore_num_intervalli = linspace(1,100,100);

for i = vettore_num_intervalli
   If1(i) = simpson( i, 0, 30, f1);
end
for i = vettore_num_intervalli
   If2(i) = simpson( i, 0, 30, f2);
end
for i = vettore_num_intervalli
   If3(i) = simpson( i, 0, 30, f3);
end
for i = vettore_num_intervalli
   If4(i) = simpson( i, 0, 30, f4);
end


figure('Name','Errore commesso dal metodo di simpson');
plot(vettore_num_intervalli, abs(If1 - integrale_vero_f1));
hold on
plot(vettore_num_intervalli, abs(If2 - integrale_vero_f2));
hold on
plot(vettore_num_intervalli, abs(If3 - integrale_vero_f3));
hold on
plot(vettore_num_intervalli, abs(If4 - integrale_vero_f4));
legend('errore f(x)=x','errore f(x)=x^2','errore f(x)=x^3','errore f(x)=x^4')
xlabel('numero di intervalli');
ylabel('errore');

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
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
   If1(i) = trapezi( i, 0, 30, f1);
end
for i = vettore_num_intervalli
   If2(i) = trapezi( i, 0, 30, f2);
end
for i = vettore_num_intervalli
   If3(i) = trapezi( i, 0, 30, f3);
end
for i = vettore_num_intervalli
   If4(i) = trapezi( i, 0, 30, f4);
end


figure('Name','Errore commesso dal metodo del trapezio');
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
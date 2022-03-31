function [opt_w]=sor_konvergencija(A)  
%funkcija koja za matricu A crta graf spektralnih radijusa matrice
%iteracija za SOR metodu
    n = length(A);
    D = diag(diag(A));
    L = tril(A,-1);
    R = triu(A,1);

    omega=[];
    ro=[];
    min=10000;

    for w=0:0.01:2
        Tsorw = inv(D+w*L)*((1-w)*D-w*R);
        roT = max(abs(eig(Tsorw)));

        if roT < min
            min = roT;
            opt_w = w;
        end

        omega = [omega,w];
        ro = [ro,roT];
    end

    omega;
    ro;
    plot(omega, ro)
    xlabel('Vrijednost omega')
    ylabel('Vrijednost spektralnog radijusa')
    pause
end
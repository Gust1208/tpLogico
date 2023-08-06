/*TP Logíco Grupo 3 
  Matías Ezequiel Fernández Lucero 
  Gustavo DG Gutiérrez */

%comio(Personaje, Bicho) 

comio(pumba, vaquitaSanAntonio(gervasia,3)). 
comio(pumba, hormiga(federica)). 
comio(pumba, hormiga(tuNoEresLaReina)). 
comio(pumba, cucaracha(ginger,15,6)). 
comio(pumba, cucaracha(erikElRojo,25,70)). 


comio(timon, vaquitaSanAntonio(romualda,4)). 
comio(timon, cucaracha(gimeno,12,8)). 
comio(timon, cucaracha(cucurucha,12,5)). 

comio(simba, vaquitaSanAntonio(remeditos,4)). 
comio(simba, hormiga(schwartzenegger)). 
comio(simba, hormiga(niato)). 
comio(simba, hormiga(lula)). 

comio(shenzi,hormiga(conCaraDeSimba)). 

pesoHormiga(2). 

%peso(Personaje, Peso) 
peso(pumba, 100). 
peso(timon, 50). 
peso(simba, 200). 
peso(scar, 300). 
peso(shenzi, 400). 
peso(banzai, 500). 



% Punto 1%
% A %
jugosita(Cucaracha) :- comio(Quien, Cucaracha),
                findall(Cucaracha,comio(Quien, Cucaracha), Lista).
cucaracha(Nombre,T1,P1),cucarqacha(Nombre,T2,P2), T1 = T2, P1 > P2.
cucaracha(Nombre,T1,P1),cucarqacha(Nombre,T2,P2), T1 = T2, P1 < P2.  
% B %
hormigofilico(Quien) :- comio(Quien, hormiga(_)).

% C %
cucarachofobico(Quien) :- not(comio(Quien,cucaracha(_,_,_))).

% D %
picaron(Quien) :- comio(Quien,vaquitaSanAntonio(remeditos,_)).
picaron(Quien) :- comio(Quien, Cucaracha), jugosita(Cucaracha).
picarones(Lista) :- findall(Quien, picaron(Quien), Lista).

% Punto 2 %
persigue(scar, timon). 
persigue(scar, pumba). 
persigue(shenzi, simba). 
persigue(shenzi, scar). 
persigue(banzai, timon). 


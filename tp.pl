% TP Logíco Grupo 3 %

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

pesoHormiga(2). 

%peso(Personaje, Peso) 
peso(pumba, 100). 
peso(timon, 50). 
peso(simba, 200). 


% Punto 1%
% A %
jugosita(Cucaracha) :- comio(Quien, Cucaracha),
                forall(comio(Quien, Cucaracha), masgordita(Quien,Cucaracha)).
masgordita(Quien,Cucaracha):-comio(Quien,cucarqacha(_,T1,P1)),
                    comio(Quien,cucarqacha(_,T2,P2)), T1 = T2, P1 > P2.
masgordita(Quien, Cucaracha):-comio(Quien,cucarqacha(_,T1,P1)),
                comio(Quien,cucarqacha(_,T2,P2)), T1 = T2, P1 < P2.  
% B %
hormigofilico(Quien) :- comio(Quien, hormiga(_)).

% C %
cucarachofobico(Quien) :- not(comio(Quien,cucaracha(_,_,_))).
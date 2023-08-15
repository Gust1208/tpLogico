% TP Logíco Grupo 3 | Matías Ezequiel Fernández Lucero | Gustavo DG Gutiérrez %

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

peso(pumba, 100). 
peso(timon, 50). 
peso(simba, 200). 
peso(scar, 300). 
peso(shenzi, 400). 
peso(banzai, 500). 



% Punto 1%
% A %

% Inversibilidad %
jugosita(cucaracha(Nombre, Tamanio, Peso)):-
  cucaracha(OtroNombre, Tamanio, OtroPeso),
  Nombre \= OtroNombre,
  Peso > OtroPeso.

% B %
% Inversibilidad %
/* Aca creo el predicado Quien(Personaje) como generador para paoder hacer inversible al predicado findall, admitiendo consultas
individuales como existenciales */
hormigofilico(Personaje) :- quien(Personaje),
    findall(Personaje, (comio(Personaje, hormiga(A)), comio(Personaje, hormiga(B)), A \= B), Personajes),
    member(Personaje, Personajes).

% C %
/* Aca creo el predicado personaje(Quien) como generador para paoder hacer inversible al predicado not, admitiendo consultas
individuales como existenciales */
cucarachofobico(Quien) :-personaje(Quien), not(comio(Quien,cucaracha(_,_,_))).
personaje(Quien) :- comio(Quien, _).


% D %
% Inversibilidad %

picaron(Quien) :- comio(Quien,vaquitaSanAntonio(remeditos,_)).
picaron(pumba).
picaron(Quien) :- comio(Quien, Cucaracha), jugosita(Cucaracha).
picarones(Lista) :- findall(Quien, picaron(Quien), Lista).

% Punto 2 %

persigue(scar, timon). 
persigue(scar, pumba). 
persigue(shenzi, simba). 
persigue(shenzi, scar). 
persigue(banzai, timon). 
persigue(scar, mufasa). 


% A %

pesoBicho(vaquitaSanAntonio(_, Peso), Peso).
pesoBicho(cucaracha(_, _, Peso), Peso).
pesoBicho(hormiga(_),2).

% Recursividad %
sumarListas([], 0).
sumarListas([X | Xs], Suma) :-
    sumarListas(Xs, SumaRestante),
    Suma is X + SumaRestante.

% Inversibilidad %
engordadoConBichos(Personaje,PesoFinal):-
    peso(Personaje,_),
    findall(Peso,(comio(Personaje,Bicho),pesoBicho(Bicho,Peso)),Pesos),
    sumarListas(Pesos,Acumulador),
    PesoFinal is Acumulador.
    
% Inversibilidad %
engordadoConPresas(Personaje,PesoResultante):-
    peso(Personaje,_),
    findall(Peso+PesoPresa+PesoDepredador,(persigue(Personaje,Presa),peso(Presa,PesoPresa),engordadoConBichos(Presa,Peso),engordadoConPresas(Presa,PesoDepredador)),Pesos),
    sumarListas(Pesos,Acumulador),
    PesoResultante is Acumulador.

% Inversibilidad %
cuantoEngorda(Personaje,PesoFinal):-
    peso(Personaje,_),
    engordadoConBichos(Personaje,Peso1),
    engordadoConPresas(Personaje,Peso2),
    PesoFinal is Peso1+Peso2. 

% Punto 3 %
% inversibilidad %
combinaComidas(Personaje, ListaComidas):-
  esPersonaje(Personaje),
  findall(CosaQueCome, (comio(Personaje, CosaQueCome) ; persigue(Personaje, CosaQueCome)), ListaComidas).
  member(CosaQueCome, ListaComidas).

% Punto 4 %

% Inversibilidad %
cantidadDeDepredadores(Personaje,CantidadDeDepredadores):-
    persigue(_,Personaje),
    findall(Depredador,persigue(Depredador,Personaje),Depredadores),
    length(Depredadores,CantidadDeDepredadores).

% Inversibilidad %
rey(Personaje):-
    persigue(_,Personaje),
    not(comio(Personaje,_)),
    not(persigue(Personaje,_)),
    cantidadDeDepredadores(Personaje,NumeroDepredadores),
    NumeroDepredadores == 1.
    




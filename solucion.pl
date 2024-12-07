% Aqui va el codigo

vive(juan,casa(120)).
%         departamento(ambientes,baños)
vive(nico,departamento(3,2)).
vive(alf,departamento(3,1)).
vive(julian,loft(2000)).
vive(vale,departamento(4,1)).
vive(fer,casa(110)).

viveEn(almagro,alf).
viveEn(almagro,juan).
viveEn(almagro,nico).
viveEn(almagro,julian).
viveEn(flores,vale).
viveEn(flores,fer).

barrio(Barrio):-
    viveEn(Barrio,_).

persona(Persona):-
    vive(Persona,_).

propiedad(Propiedad):-
    vive(_,Propiedad).

% PUNTO 2

esBarrioCopado(Barrio):-
    barrio(Barrio),
    forall( viveEn(Barrio,Persona) , viveEnPropiedadCopada(Persona)).

viveEnPropiedadCopada(Persona):-
    vive(Persona,Casa),
    esPropiedadCopada(Casa).

esPropiedadCopada(casa(Metros)):-
    Metros > 100.
    
esPropiedadCopada(departamento(Ambientes,_)):-
    Ambientes > 3.

esPropiedadCopada(departamento(_,Banios)):-
    Banios > 1.

esPropiedadCopada(loft(AnioConstruccion)):-
    AnioConstruccion > 2015.

% PUNTO 3

quedaEn(Propiedad,Barrio):-
    vive(Persona,Propiedad),
    viveEn(Barrio,Persona).

esBarrioCaro(Barrio):-
    barrio(Barrio),
    not(tienePropiedadBarata(Barrio)).

tienePropiedadBarata(Barrio):-
    quedaEn(Propiedad,Barrio),
    esPropiedadBarata(Propiedad).


esPropiedadBarata(loft(AnioConstruccion)):-
    AnioConstruccion < 2005.

esPropiedadBarata(casa(Metros)):-
    Metros < 90.

esPropiedadBarata(departamento(Ambientes,_)):-
    Ambientes =< 2.

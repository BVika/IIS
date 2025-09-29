% actor(Name, Gender, Genre, MinAge, MaxAge)
actor(alex, m, tragedy, 25, 40).
actor(bella, f, comedy, 18, 30).
actor(chris, m, tragedy, 35, 55).
actor(diana, f, comedy, 22, 35).
actor(steven, m, comedy, 28, 45).

% role(Name, ReqGender, Genre, Age)
role(romeo, m, tragedy, 27).
role(juliet, f, tragedy, 18).
role(clown, x, comedy, 30).

% Предикат matches(Role, Actor): проверяет, подходит ли актер на роль
matches(Role, Actor) :-
    role(Role, ReqGender, ReqGenre, Age),
    actor(Actor, ActorGender, ActorGenre, MinAge, MaxAge),
    ReqGenre == ActorGenre,  % Жанр должен совпадать
    (ReqGender == m, ActorGender == m ;
     ReqGender == f, ActorGender == f ;
     ReqGender == x),        % Для x (clown) подходит любой пол
    MinAge =< Age, Age =< MaxAge.  % Возраст в диапазоне

cast_romeo(RomeoActor) :- matches(romeo, RomeoActor).
cast_juliet(JulietActor) :- matches(juliet, JulietActor).
cast_clown(ClownActor) :- matches(clown, ClownActor).

:-dynamic pos/3.
pos(1,1,black).
pos(2,1,white).
pos(3,1,black).
pos(4,1,empty).
pos(5,1,white).
pos(6,1,black).
pos(7,1,white).


cleartable:-retract(pos(1,1,black)),assert(pos(1,1,empty)),retract(pos(2,1,white)),assert(pos(2,1,empty)),retract(pos(3,1,black)),assert(pos(3,1,empty)),
            retract(pos(5,1,white)),assert(pos(5,1,empty)),retract(pos(6,1,black)),assert(pos(6,1,empty)),retract(pos(7,1,white)),assert(pos(7,1,empty)),
            showtable.

insertpos :-write('Please insert a value for X, Be careful! 1<=X<=7,then press .'),nl,
            read(X),nl,((X is 1; X is 2; X is 3; X is 4; X is 5; X is 6; X is 7)->
            write('Now paint the box you picked black or white or leave it empty,only 1 empty box can exist'),
            read(Z),nl,((Z==black;Z==white;Z==empty)->
            retract(pos(X,1,empty)),assert(pos(X,1,Z))),showtable;write('wrong input try again')).
          

make_line:-write('-------------------------------------------').
show_box(K,N):-pos(K,N,Z),(Z==empty,write('|')),tab(5);
               pos(K,N,Z),Z==black,write('|black');
               pos(K,N,Z),Z==white,write('|white').

showtable:-make_line,nl,show_box(1,1),show_box(2,1),show_box(3,1),show_box(4,1),show_box(5,1),show_box(6,1),show_box(7,1),write('|'),nl,make_line.

move_right(X,Y,Z):-pos(X,Y,Z),Z==black,X=<6,X1 is X+1,pos(X1,Y,Z1),Z1==empty,retract(pos(X,Y,black)),assert(pos(X,Y,empty)),retract(pos(X1,Y,empty)),assert(pos(X1,Y,black));
            pos(X,Y,Z),Z==white,X=<6,X1 is X+1,pos(X1,Y,Z1),Z1==empty,retract(pos(X,Y,white)),assert(pos(X,Y,empty)),retract(pos(X1,Y,empty)),assert(pos(X1,Y,white));
            pos(X,Y,Z),Z==black,X=<6,X1 is X+1,pos(X1,Y,Z1),Z1==white,retract(pos(X,Y,black)),assert(pos(X,Y,white)),retract(pos(X1,Y,white)),assert(pos(X1,Y,black));
            pos(X,Y,Z),Z==white,X=<6,X1 is X+1,pos(X1,Y,Z1),Z1==black,retract(pos(X,Y,white)),assert(pos(X,Y,black)),retract(pos(X1,Y,black)),assert(pos(X1,Y,white));
            write('Your form of expresion is wrong, Please try again').
                        

move_left(X,Y,Z):-pos(X,Y,Z),Z==black,X>=2,X1 is X-1,pos(X1,Y,Z1),Z1==empty,retract(pos(X,Y,black)),assert(pos(X,Y,empty)),retract(pos(X1,Y,empty)),assert(pos(X1,Y,black));
            pos(X,Y,Z),Z==white,X>=2,X1 is X-1,pos(X1,Y,Z1),Z1==empty,retract(pos(X,Y,white)),assert(pos(X,Y,empty)),retract(pos(X1,Y,empty)),assert(pos(X1,Y,white));
            pos(X,Y,Z),Z==black,X>=2,X1 is X-1,pos(X1,Y,Z1),Z1==white,retract(pos(X,Y,black)),assert(pos(X,Y,white)),retract(pos(X1,Y,white)),assert(pos(X1,Y,black));
            pos(X,Y,Z),Z==white,X>=2,X1 is X-1,pos(X1,Y,Z1),Z1==black,retract(pos(X,Y,white)),assert(pos(X,Y,black)),retract(pos(X1,Y,black)),assert(pos(X1,Y,white));
            write('Your form of expresion is wrong, Please try again').

move_to_empty(X,Y,Z):-pos(_,Y,Z1),Z1==empty,
                      pos(X,Y,Z),Z==black,pos(X1,Y,Z1),Z1==empty,retract(pos(X,Y,black)),assert(pos(X,Y,empty)),retract(pos(X1,Y,empty)),assert(pos(X1,Y,black));
                      pos(X,Y,Z),Z==white,pos(X1,Y,Z1),Z1==empty,retract(pos(X,Y,white)),assert(pos(X,Y,empty)),retract(pos(X1,Y,empty)),assert(pos(X1,Y,white));
                      write('This is not allowed').

        
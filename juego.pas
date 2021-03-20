PROGRAM Juego_Sudoku;
uses crt;

const
    filas = 9;
 columnas = 9;

 type

 NumF = 1..filas;
 NumC = 1..columnas;

 matriz = array [NumF,NumC] of integer;
 matrizllena = array [NumF,NumC] of integer;

 var
   sudoku:matriz;
   llenar:matrizllena;
   sw, numero, opcion, posFila, posColumna:integer;
   respuesta, nombre : string;


//**********************************************************
//************ VERIFICA LA PISTAS DEL JUEGO ****************
//**********************************************************

procedure verificarpistas(var i,j:integer;var existe:boolean);
begin
    if (i = 1) and (j = 2) then
        existe := true;

    if (i = 1) and (j = 3) then
        existe := true;

    if (i = 1) and (j = 4) then
        existe := true;

    if (i = 2) and (j = 5) then
        existe := true;

    if (i = 2) and (j = 7) then
        existe := true;

    if (i = 4) and (j = 4) then
        existe := true;

    if (i = 4) and (j = 7) then
        existe := true;

    if (i = 5) and (j = 9) then
        existe := true;

    if (i = 6) and (j = 1) then
        existe := true;

    if (i = 6) and (j = 2) then
        existe := true;

    if (i = 6) and (j = 6) then
        existe := true;

    if (i = 7) and (j = 5) then
        existe := true;

    if (i = 7) and (j = 9) then
        existe := true;

    if (i = 8) and (j = 1) then
        existe := true;

    if (i = 8) and (j = 4) then
        existe := true;

    if (i = 9) and (j = 3) then
        existe := true;

    if (i = 9) and (j = 8) then
        existe := true;


end;

//**********************************************************
//****************** ELIMINAR POSICI‡N *********************
//**********************************************************
 procedure eliminarposicion(var posF,posC:integer);
 var  existe : boolean;

 begin
        existe := false;
        verificarpistas(posF,posC,existe);

        if existe = true then
           begin
              textcolor(yellow);
              gotoxy(20,24);write('Las Posiciones de Pistas NO pueden ser Eliminadas ');
              textcolor(15);
              existe := false;
              readkey;
           end
       else
           sudoku[posF,posC] := 0;

 end;


//**********************************************************
//************* MOSTRAR PISTA DE LA MATRIAZ ****************
//**********************************************************

 procedure MostrarMatriz(sudoku:matriz);
 var i, j,x,y : integer;
     existe : boolean;
 begin
     existe:=false;
     for i:=1 to filas do begin
         x := i;
         for j:=1 to columnas do
             begin
                 y := j;
                 verificarpistas(x,y,existe);

                 if existe = true then
                 begin
                       textcolor(14);
                       gotoxy(2 + j*2,i*2); write(sudoku[i,j],' ');
                       textcolor(15);
                       existe:=false;
                    end
                 else
                   begin
                     gotoxy(2 + j*2,i*2); write(sudoku[i,j],' ');
                   end;
     end;

         writeln;
     end;
 end;


//**********************************************************
//***************  MOSTRAR MATRIAZ LLENA  ******************
//**********************************************************

 procedure MostrarMatrizEjemplo(llenar:matrizllena);
 var i, j, x, y : integer;
 existe:boolean;
 begin
     for i:=1 to filas do begin
         x := i;
         for j:=1 to columnas do
             begin
                 y := j;
                 verificarpistas(x,y,existe);

                 if existe = true then
                 begin
                       textcolor(14);
                       gotoxy(55 + j*2,i*2);  write(llenar[i,j],' ');
                       textcolor(15);
                       existe := false;

                    end
                 else
                   begin
                     textcolor(15);
                     gotoxy(55 + j*2,i*2); write(llenar[i,j],' ');
                   end;
     end;

         writeln;
     end;
 end;



//**********************************************************
//******************* INICIALIZA LA MATRIAZ ****************
//**********************************************************

 procedure InicializarMatriz(var sudoku:matriz);
 var i, j : integer;
 begin
    for i:=1 to filas do
        for j:=1 to columnas do
            sudoku[i,j] := 0;
 end;

//**********************************************************
//*********** CARGA LAS PISTA DE INICIO DEL JUEGO **********
//**********************************************************

 procedure PistasInicialesMatriz(var sudoku:matriz);
 var i, j : integer;
 begin
       sudoku[1,2] := 5;
       sudoku[1,3] := 4;
       sudoku[1,4] := 6;
       sudoku[2,5] := 7;
       sudoku[2,7] := 9;
       sudoku[4,4] := 8;
       sudoku[4,7] := 3;
       sudoku[5,9] := 8;
       sudoku[6,1] := 7;
       sudoku[6,2] := 6;
       sudoku[6,6] := 2;
       sudoku[7,5] := 5;
       sudoku[7,9] := 2;
       sudoku[8,1] := 9;
       sudoku[8,4] := 2;
       sudoku[9,3] := 1;
       sudoku[9,8] := 7;

 end;

//**********************************************************
//**************** CARGA MATRIZ PARA MOSTRAR ***************
//**********************************************************

 procedure LlenarMatriz(var llenar:matrizllena);

 begin
    llenar[1,1] := 1;llenar[1,2] := 5;llenar[1,3] := 4;llenar[1,4] := 6;llenar[1,5] := 9;llenar[1,6] := 3;llenar[1,7] := 2;llenar[1,8] := 8;llenar[1,9] := 7;
    llenar[2,1] := 6;llenar[2,2] := 3;llenar[2,3] := 2;llenar[2,4] := 5;llenar[2,5] := 7;llenar[2,6] := 8;llenar[2,7] := 9;llenar[2,8] := 4;llenar[2,9] := 1;
    llenar[3,1] := 8;llenar[3,2] := 9;llenar[3,3] := 7;llenar[3,4] := 1;llenar[3,5] := 2;llenar[3,6] := 4;llenar[3,7] := 6;llenar[3,8] := 5;llenar[3,9] := 3;
    llenar[4,1] := 5;llenar[4,2] := 1;llenar[4,3] := 9;llenar[4,4] := 8;llenar[4,5] := 4;llenar[4,6] := 7;llenar[4,7] := 3;llenar[4,8] := 2;llenar[4,9] := 6;
    llenar[5,1] := 2;llenar[5,2] := 4;llenar[5,3] := 3;llenar[5,4] := 9;llenar[5,5] := 6;llenar[5,6] := 5;llenar[5,7] := 7;llenar[5,8] := 1;llenar[5,9] := 8;
    llenar[6,1] := 7;llenar[6,2] := 6;llenar[6,3] := 8;llenar[6,4] := 3;llenar[6,5] := 1;llenar[6,6] := 2;llenar[6,7] := 4;llenar[6,8] := 9;llenar[6,9] := 5;
    llenar[7,1] := 4;llenar[7,2] := 8;llenar[7,3] := 6;llenar[7,4] := 7;llenar[7,5] := 5;llenar[7,6] := 9;llenar[7,7] := 1;llenar[7,8] := 3;llenar[7,9] := 2;
    llenar[8,1] := 9;llenar[8,2] := 7;llenar[8,3] := 5;llenar[8,4] := 2;llenar[8,5] := 3;llenar[8,6] := 1;llenar[8,7] := 8;llenar[8,8] := 6;llenar[8,9] := 4;
    llenar[9,1] := 3;llenar[9,2] := 2;llenar[9,3] := 1;llenar[9,4] := 4;llenar[9,5] := 8;llenar[9,6] := 6;llenar[9,7] := 5;llenar[9,8] := 7;llenar[9,9] := 9;
 end;

 // *************************************************************************
 // ***********************    P R I N C I P A L   **************************
 // *************************************************************************


 BEGIN

 ClrScr;
 llenarmatriz(llenar);
      gotoxy(25,2);textcolor(yellow);writeln('BIENVENIDO AL JUEGO DE SUDOKU ');
      gotoxy(25,3);writeln('-------------------------------');
      gotoxy(25,4);textcolor(15);writeln('         Versi¢n 1.0');


      gotoxy(25,7);writeln('   M E N U   D E   J U E G O');
      gotoxy(25,8);writeln('-------------------------------');

      gotoxy(25,10); writeln('1.-  Nuevo Juego ');
      gotoxy(25,11); writeln('2.-  Salir del Juego');

      gotoxy(25,13);write ('Seleccione una Opci¢n: ');readln(opcion);

      case opcion of
           1: begin

                   sw:=0;
                   InicializarMatriz (sudoku);
                   PistasInicialesMatriz(sudoku);
                  ClrScr;
                  gotoxy(25,7);writeln('   N U E V O    J U E G O');
                  gotoxy(25,8);writeln('-------------------------------');
                  gotoxy(25,10);write('Nombre del Jugador: ');readln(nombre);
                  writeln;
                  repeat
                    begin
                        ClrScr;
                        opcion:=0;
                        respuesta:='';
                        MostrarMatriz (sudoku);
                        gotoxy(25,1);writeln('      B I E N V E N I D O');
                        gotoxy(55,2);writeln('     ',nombre);
                        gotoxy(25,3);writeln('------------------------------------------------------');
                        gotoxy(25,5);writeln('   M E N È   D E    J U E G O');
                        gotoxy(25,6);writeln('---------------------------------');
                        gotoxy(30,8); writeln('1 -  Nueva Posici¢n');
                        gotoxy(30,9); writeln('2 -  Eliminar Jugada');
                        gotoxy(30,10); writeln('3 -  Abandonar Juego');

                        gotoxy(28,12);write ('Seleccione una Opci¢n: ');readln(opcion);

                        case opcion of
                            1: begin
                                  posFila:=0;
                                  posColumna:=0;
                                  numero:=0;
                                  gotoxy(28,16); writeln('Indicar la posici¢n a jugada');

                                  gotoxy(29,18);write('Indique el N£mero: ');readln(numero);
                                  gotoxy(31,20);write('Indique la Fila: ');readln(posFila);
                                  gotoxy(28,21);write('Indique la Columna: ');readln(posColumna);
                                  if (posFila = 0) or (posColumna = 0) then
                                     begin
                                         textcolor(yellow);
                                         gotoxy(23,24);write('Posicion inv†lida, intente nuevamente');
                                         textcolor(15);
                                         readkey;
                                     end
                                  else

                                      if llenar[posFila,posColumna] = numero then
                                         begin
                                            sudoku[posFila,posColumna] := numero;
                                         end
                                      else
                                         begin

                                            gotoxy(28,24);write('N£mero invalido en posicion');
                                            gotoxy(28,25);write('    Intente Nuevamente');
                                            readkey;
                                         end;

                               end;
                            2: begin
                                  posFila:=0;
                                  posColumna:=0;

                                  gotoxy(28,16); writeln('Indicar la posici¢n a eliminar');
                                  gotoxy(31,20);write('Indique la Fila: ');readln(posFila);
                                  gotoxy(28,21);write('Indique la Columna: ');readln(posColumna);
                                  if (posFila = 0) or (posColumna = 0) then
                                     begin
                                         textcolor(yellow);
                                         gotoxy(23,24);write('Posicion inv†lida, intente nuevamente');
                                         textcolor(15);
                                         readkey;
                                     end
                                  else
                                     eliminarposicion(posFila,posColumna);


                               end;

                            3: begin

                                    gotoxy(25,14);write('®Seguro de Abandonar el Juegos/n ?: '); readln(respuesta);

                                    if (respuesta ='s') or (respuesta ='S') then
                                        begin
                                           ClrScr;
                                           MostrarMatriz (sudoku);
                                           writeln;
                                           gotoxy(57,22);textcolor(yellow);writeln('R E S P U E S T A');
                                           textcolor(15);writeln;
                                           MostrarMatrizEjemplo(llenar);
                                           readkey;
                                       end;
                               end;
                         end;

                    end;
                  until(respuesta='s') or (respuesta='S');

              end;


          end;

 END.

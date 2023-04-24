program UNA;
uses CRT;
const
  N = 250; // SE ASIGNA EL MÁXIMO DE VALORES QUE PUEDE CONTENER UN ARREGLO PORQUE
           // NO SABEMOS CUANTOS VALORES PUEDA INGRESAR EL USUARIO, POR DEFECTO ES 250.

type
  TArray = array[1..N] of integer;

var
  res: TArray; // ARREGLO EN EL CUAL ALMACENAREMOS LOS DATOS INGRESADOS POR EL USUARIO
  max: integer; // MÁXIMO INDICE DEL ARREGLO DE LOS NÚMEROS INGRESADOS POR EL USUARIO

  //ESTE PROCEDIMIENTO SE UTILIZA PARA REALIZAR EL CAMBIO DE ELEMENTOS DE ARREGLOS OCASIONADO POR EL QUICKSORT
procedure Swap(var a, b: integer);
var
  temp: integer;
begin
  temp := a;
  a := b;
  b := temp;
end;
//El Quicksort es un algoritmo de ordenamiento que utiliza la técnica de divide
//y vencerás para ordenar un conjunto de elementos. Es uno de los algoritmos
//de ordenamiento más utilizados debido a su eficiencia y simplicidad.

// EN ESTE QUICKSORT SE UTILIZA PARA ORDENAR DE MAYOR A MENOR LOS ELEMENTOS DE LOS ARREGLOS. ES RECURSIVO.
procedure QuickSort(var a: TArray; izq, der: integer);
var
  i, j, pivote: integer;
begin
  i := izq;
  j := der;
  pivote := a[(izq + der) div 2];
  
  repeat
    while a[i] > pivote do
      Inc(i);
    while a[j] < pivote do
      Dec(j);
    if i <= j then
    begin
      Swap(a[i], a[j]);
      Inc(i);
      Dec(j);
    end;
  until i > j;
  
  if izq < j then
    QuickSort(a, izq, j);
  if i < der then
    QuickSort(a, i, der);
end;
// CON ESTE PROCEDIMIENTO SE PROCEDE A LEER LOS NÚMEROS ENTEROS INGRESADOS
// POR EL USUARIO, CABE DESTACAR QUE SI INGRESA UN VALOR NEGATIVO, DEJA DE LEER ENTEROS.
procedure ReadArray(var res: TArray; var max:integer);
var
  num: integer;
begin

  num:=1;
  while ( num > 0 )do
  begin
       Writeln('Ingrese un número entero: ');
       ReadLn(num);
       max:= max + 1;
       res[max] := num;
  end;
end;
// ESTO ES UN PROCEDIMIENTO ENCARGADO DE REVISAR SI LOS ELEMENTOS DE UN ARREGLO SE
// REPITEN, HACIENDO LIMPIEZA DEL ARREGLO Y QUE NO SE REPITA NINGÚN NÚMERO EN EL ARREGLO ORIGINAL.
procedure NoRepeat(var a: TArray; var max: integer);
var
   i,j,k: integer;
begin
   for i := 1 to max do
  begin
    j := i + 1;
    while (j <= max) do
    begin
      if (a[i] = a[j]) then
      begin
        for k := j to max - 1 do
        begin
          a[k] := a[k + 1];
        end;
        max := max - 1; // Reducir el tamaño del arreglo
      end
      else
      begin
        j := j + 1;
      end;
    end;
  end;
end;
// ESTE PROCEDIMIENTO SE ENCARGA DE IMPRIMIR LOS 3 VALORES MÁXIMOS DEL ARREGLO, SI ES NEGATIVO NO IMPRIME.
procedure PrintMax(const a: TArray; var max:integer);
var
  i: integer;
  num: integer;
begin
  for i := 1 to max do
  begin
    num:= a[i];
    if ( num > 0) then
       Write(a[i], ' ');
  Writeln;
  end;
end;
begin
  max:= 0; // ESTA VARIABLE ALMACENA EL MÁXIMO DE ELEMENTOS DEL ARREGLO, INTRINSICAMENTE FUNCIONA COMO UN CONTADOR DE ELEMENTOS.
  Writeln;
  Writeln;
  Writeln;
  // PRESENTACIÓN DEL PROGRAMA Y SU AUTOR.
  Writeln('***************************************************************************************************************');
  Writeln('¡BIENVENIDO A MI PROGRAMA DEL TRABAJO PRACTICO DE LA MATERIA COMPUTACION I EN LA UNIVERSIDAD NACIONAL ABIERTA!');
  Writeln('AUTOR: JOSE ALFONSO GRANADO LUIS');
  Writeln('C.I.V: 26.272.914');
  Writeln;
  Writeln('SE ESCRIBE UN PROGRAMA EN LENGUAJE PASCAL, QUE VAYA PIDIENDO AL USUARIO VALORES ENTEROS HASTA INTRODUZCA UN VALOR NEGATIVO, DESPUES DEBE INDICAR LOS 3 VALORES MAYORES');
  Writeln('******************************************************************************************************************');
  Writeln;
  Writeln('Presiona ENTER para continuar...');
  Writeln;
  readln;
  // SE LIMPIA LA PANTALLA AL TECLEAR ENTER.
  ClrScr;
  // SE LEE LOS ELEMENTOS DEL ARREGLO.
  ReadArray(res, max);
  Writeln;
  Writeln('Presiona ENTER para continuar...');
  readln;
  ClrScr;
  // SE HACE USO DEL METODO DE ORDENAMIENTO PARA ORDENAR LOS NÚMEROS ENTEROS DE MAYOR A MENOR INGRESADOS POR EL USUARIO.
  QuickSort(res, 1, max);
  ClrScr;
  // SE INVOCA ESTE PROCEDIMIENTO PARA ELIMINAR LOS ELEMENTOS REPETIDOS EN UN ARREGLO.
  NoRepeat(res, max);
  Writeln('LOS TRES NUMEROS MAYORES INGRESADOS SON LOS SIGUIENTES ');
  max := 3;
  // SE IMPRIME LOS 3 NÚMEROS MAYORES DEL ARREGLO, SÓLO SÍ SON POSITIVOS.
  PrintMax(res, max);
  Writeln('Presiona ENTER para salir del programa...');
  readln;
end.



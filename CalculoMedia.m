clc;
pkg load io

# se carga los datos del xlsx en una array
matriz = xlsread('N2.xlsx');

# se encuentra el numero de filas que tiene la matriz (4137 en este caso)
n = size(matriz)(1);

# se define una array vacio para almacenar las medias calculadas
medias = [];

# se almancena numero del primer encontrado en la matriz
dia_actual = matriz(1,1);
# se almancena numero del primer dia del primer mes encontrado en la matiz
mes_actual = matriz(1,2);


# se incia un contador k para iterar en el array de las medias
k = 1;
# se define un contador para contar el numero de veces que se realiza la medicion
# por dia
cont_med_dia = 0;
# se defina una varible suma para almacear lass sumas parciales
suma = 0;

# se define un ciclo for que se repite n veces
for i=1:n

  if matriz(i,1) > mes_actual
    mes_actual = matriz(i,1);
    dia_actual = matriz(i,2);
   endif

   try
     dia_siguiente = matriz(i+1,2);
   catch
     dia_siguiente = 0;
   end_try_catch

   if matriz(i,2) > dia_actual || matriz(i,2) > dia_siguiente
      medias(k) = (suma/cont_med_dia);
      suma = 0;
      cont_med_dia = 0;
      dia_actual = matriz(i,2);
      k++;
   endif

  suma += matriz(i,3);
  cont_med_dia++;

endfor


# solo es para mostrar en pantalla
i = 1;
n = length(medias);
while i <= n
    disp(sprintf("media del dia %d = %f ", i, medias(i)));
    i++;
end

pkg unload io

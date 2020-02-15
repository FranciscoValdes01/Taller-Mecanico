program Afiliar_por_txt;
uses dos,crt, sysutils;

type
datosafiliadoest = record
        folio: integer;
        nombre: string;
        curp: string;
        sexo:string;
        numerodomicilio: string;
        calle: string;
        colonia: string;
        municipio: string;
        estado: boolean;
        dia,mes,anio,ds:word;
        dia2,mes2,anio2,ds2:word;
end;

var
        datosafiliado:datosafiliadoest;
        arcsalida:file of datosafiliadoest;
        arcsalida_t: text;
        temp:datosafiliadoest;
        linea:string;
        clave2:string;
        contador:word;
        tanio:integer;
        tmes:integer;
        tanio2:integer;
        tmes2:integer;
        encuentra:integer;
        seleccion:integer;


////////////////////////////////////////////////////////////////////////////////////
procedure guardar();

Begin
  reset(arcsalida);

  while(not(EOF(arcsalida)))do
  begin
  read(arcsalida,temp);
  end;
      write(arcsalida,datosafiliado);
      close(arcsalida);
end;
////////////////////////////////////////////////////////////////////////////////////
procedure fecha();
var
   aa,dd,mm,dss:word;
begin

     getdate(aa,mm,dd,dss);
     datosafiliado.dia:=dd;
     datosafiliado.mes:=mm;
     datosafiliado.anio:=aa;
     datosafiliado.ds:=dss;
     datosafiliado.dia2:=01;
     datosafiliado.mes2:=mm+1;
     datosafiliado.anio2:=aa+3;
     datosafiliado.ds2:=dss;


end;
////////////////////////////////////////////////////////////////////////////////////
procedure generar_datos(var nombre:string);

begin

     datosafiliado.nombre:=linea;
     datosafiliado.curp:='AEVE970510HMCRRG'+inttostr(contador);
     datosafiliado.sexo:='Hombre';
     datosafiliado.numerodomicilio:='24';
     datosafiliado.calle:='12';
     datosafiliado.colonia:= 'Azteca';
     datosafiliado.municipio:= 'Toluca';
     datosafiliado.folio:=contador+10000;
     datosafiliado.estado:= true;
     fecha();
     guardar();
end;
////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////
function buscarnombre(var clave2:string):integer;
begin
  reset(arcsalida);
  datosafiliado.nombre:=' ';

  WHILE (NOT(EOF(arcsalida)) AND (clave2<>datosafiliado.nombre)) DO
  begin
    read(arcsalida,datosafiliado);
  end;
if (clave2=datosafiliado.nombre) then
	begin
		buscarnombre:=1;
	end
else
	begin
		buscarnombre:=0;
	end;

end;
////////////////////////////////////////////////////////////////////////////////////
procedure impresion();
var
   i:integer;
begin
  writeln('Ingresa Nombre a Buscar: ');
  readln(clave2);

  encuentra:=buscarnombre(clave2);

  if (encuentra=1) then
             begin
             writeln('AFILIADO ');

			 for i:=1 to length(datosafiliado.nombre) do
			 begin
				if (datosafiliado.nombre[i]=',')then
					begin
						writeln();
					end
				else
					begin
						write(datosafiliado.nombre[i]);
					end;
			 end;

             writeln();

             writeln('CLAVE CURP ' + datosafiliado.curp);
             writeln('DOMICILIO: ',datosafiliado.numerodomicilio,'  ',datosafiliado.calle,'  ',datosafiliado.colonia,'  ',datosafiliado.municipio);
             writeln('Sexo:' + datosafiliado.sexo);
             writeln('FOlIO DE AFILIACION: ',datosafiliado.folio);
             writeln('SITUACION: ',datosafiliado.estado);

             writeln('FECHA DE AFILIACION: ',datosafiliado.dia,'/',datosafiliado.mes,'/',datosafiliado.anio);
             writeln('FECHA DE EXPIRACION: ' ,datosafiliado.dia2,'/',datosafiliado.mes2,'/',datosafiliado.anio2);
             readkey
             end
			
			
			
			
			
  else
      begin
          writeln('No se Encontro Afiliado');
          readkey
      end;


end;
////////////////////////////////////////////////////////////////////////////////////
procedure afiliar();

Begin
        contador := 0;
        reset(arcsalida_t);
        while(not (EOF(arcsalida_t)))do
                  begin
                  contador := contador+1;
                  readln(arcsalida_t,linea);
                  generar_datos(linea);
                  end;
        close(arcsalida_t);


      end;
////////////////////////////////////////////////////////////////////////////////////
procedure menu();
begin
     writeln('Escoje una opcion: ');
     writeln('1.-Afiliar por Archivo de texto');
     writeln('2.-Mostrar Informacion de Afiliado');
     readln(seleccion);

     case seleccion of
     1: afiliar();
     2: impresion();
     else
         menu();
     end;
end;
////////////////////////////////////////////////////////////////////////////////////
begin
        assign(arcsalida,'C:\Users\salva\OneDrive - uicui.edu.mx\INGENIERIA EN COMPUTACION 2018\cuarto semestre\organizacion de archivos\PROYECTO SEGURO POPULAR 03.18.19\Diseno v2\Afiliados.dat');
        assign(arcsalida_t, 'porafiliar.txt');
        if fileExists('C:\Users\salva\OneDrive - uicui.edu.mx\INGENIERIA EN COMPUTACION 2018\cuarto semestre\organizacion de archivos\PROYECTO SEGURO POPULAR 03.18.19\Diseno v2\Afiliados.dat') then
                begin

                reset(arcsalida);
                end
        else
                begin

                rewrite(arcsalida);
                end;
                close(arcsalida);
        menu();

END.


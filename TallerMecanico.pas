{PROGRAMA RegistroSolicitud
AUTOR: AT&I - CoWorkers 
UTILIDAD: Automatizar el registro de las solicitudes de servicio realizadas en un taller mecánico.
FECHA DE ELABORACIÓN: 12 de febrero de 2020
ÚLTIMA MODIFICACIÓN: 16 de febrero de 2020}

//CONSTANTES
//	----------------

USES CRT;

TYPE
	EstAutomovil = RECORD
		Marca: STRING;
		Modelo: STRING;  
		Color: STRING;  
		Anio: INTEGER;
		NoPlacas: STRING;  
		NoSerie: STRING;   
		Refacciones: STRING;  
		ManoObra: STRING;   
		EdoPzs: ARRAY [1..34] OF BOOLEAN;
		NamePzs: ARRAY [1..34] OF STRING;  
		ServicesPrice: ARRAY [1..24] OF REAL; 
		ServicesName: ARRAY [1..24] OF STRING;  
		TotalServicios: REAL; 
		TotalRefacciones: REAL;   
		TotalManoObra: REAL; 
		CargosAdicionales: REAL;  
		UsoGrua: REAL;   
		Subtotal: REAL;   
		PrecioFinal: REAL;   
		Anticipo: REAL;   
		Resta: REAL;  
	end; // FIN (Estructura) 
 
	EstPersonaFisica = RECORD  
		IdCliente: INTEGER;   
		Nombre: STRING;   
		CURP: STRING;   
		Calle: STRING;   
		Colonia: STRING;   
		NoInt: INTEGER;   
		NoExterior: INTEGER;  
		Municipio: STRING;   
		CP: STRING;  
		Tel: STRING; 
	end; // FIN estructura 

	EstSolicitudServicio = RECORD
		PersonaFisica:INTEGER;
		Automovil:STRING;
		CostoTotal:REAL;
		//FechaIngreso: DATE;
		//FechaSalida: DATE;
	end; // FIN (Estructura)

VAR
	Solicitud: EstSolicitudServicio;
	RegAutomovil: EstAutomovil;

//MÓDULOS
	function SumarPrecios(precios:STRING):REAL;
	VAR
	long_precios:INTEGER;
	c,k:INTEGER;
	precio_u:STRING;
	precio_c:REAL;
	sumatoria:REAL;

	BEGIN
	long_precios := Length(precios);
	c := 1;
	precio_u := '';
	sumatoria := 0;

	WHILE (c <= long_precios) DO
	BEGIN
		WHILE(precios[c] <> '$') DO
		BEGIN
			c := c+1;
		END;
		c:=c+1;

		WHILE(precios[c] <> ',') DO
		BEGIN
			precio_u:=precio_u + precios[c];
			c := c+1;
		END;
		val(precio_u,precio_c,k);
		sumatoria := sumatoria + precio_c;
		c := c+1;
		precio_u := '';
	END;

	SumarPrecios:=sumatoria;
END;

	function SumarIVA(Cantidad:REAL):REAL;
	CONST
	IVA = 0.16;
	VAR
	CantidadConIVA: REAL;
	BEGIN
		CantidadConIVA := 0;
		CantidadConIVA := Cantidad;
		CantidadConIVA := CantidadConIVA + (Cantidad * IVA);
		SumarIVA:=CantidadConIVA;
	end;


	procedure Guardar(datos:EstAutomovil);
	VAR
	arch: file of EstAutomovil;
	aux: EstAutomovil;

	BEGIN
		assign(arch, 'Automoviles.dat');
	  	{$I-}
	  	RESET (arch);
	  	{$I+}
	  	IF (IoResult=0)THEN
	    	close(arch)
	  	ELSE
	  	BEGIN
	    	REWRITE(arch);
	  	END;


	  	RESET(arch);
	  	WHILE NOT EOF (arch) DO
	  	BEGIN
	  		READ(arch,aux);
	  	END;
	  	WRITE(arch,datos);
	  	CLOSE(arch);
	end;

	PROCEDURE CapturarRegAutomovil();
	VAR
		Respuesta: STRING;
		Contador: INTEGER;

	BEGIN
		Respuesta := '';
		Contador := 0;

		RegAutomovil.Marca := '';
		RegAutomovil.Modelo := '';
		RegAutomovil.Color := '';
		RegAutomovil.Anio := 0 ;
		RegAutomovil.NoPlacas := '';
		RegAutomovil.NoSerie := '';
		RegAutomovil.Refacciones := '';
		RegAutomovil.ManoObra := '';

		FOR Contador := 1 to 34 do
		BEGIN
			RegAutomovil.EdoPzs[Contador] := FALSE;
		end; // FIN (FOR)

		FOR Contador := 1 to 34 do
		BEGIN
			RegAutomovil.NamePzs[Contador] := '';
		end; // FIN (FOR)

		FOR Contador := 1 to 24 do
		BEGIN
			RegAutomovil.ServicesPrice[Contador] := 0.0;
		end; // FIN (FOR)

		FOR Contador := 1 to 24 do
		BEGIN
			RegAutomovil.ServicesName[Contador] := '';
		end; // FIN (FOR)

		RegAutomovil.TotalServicios := 0.0;
		RegAutomovil.TotalRefacciones := 0.0;
		RegAutomovil.TotalManoObra := 0.0;
		RegAutomovil.CargosAdicionales := 0.0;
		RegAutomovil.UsoGrua := 0.0; 
		RegAutomovil.Subtotal := 0.0;
		RegAutomovil.PrecioFinal := 0.0;
		RegAutomovil.Anticipo := 0.0;
		RegAutomovil.Resta := 0.0;

		RegAutomovil.ServicesName[1] := 'mantenimiento eléctrico general';
		RegAutomovil.ServicesName[2] := 'lavado de inyectores';
		RegAutomovil.ServicesName[3] := 'alternadores';
		RegAutomovil.ServicesName[4] := 'electro-ventiladores';
		RegAutomovil.ServicesName[5] := 'afinación completa';
		RegAutomovil.ServicesName[6] := 'cambio de bujías';
		RegAutomovil.ServicesName[7] := 'cuerpo de aceleración';
		RegAutomovil.ServicesName[8] := 'sistema de enfriamiento';
		RegAutomovil.ServicesName[9] := 'mantenimiento mecánico general';
		RegAutomovil.ServicesName[10] := 'neumáticos';
		RegAutomovil.ServicesName[11] := 'sistema de frenos';
		RegAutomovil.ServicesName[12] := 'suspensión';
		RegAutomovil.ServicesName[13] := 'transmisión';
		RegAutomovil.ServicesName[14] := 'luces';
		RegAutomovil.ServicesName[15] := 'gases';
		RegAutomovil.ServicesName[16] := 'dirección';
		RegAutomovil.ServicesName[17] := 'cambio de aceite y filtros';
		RegAutomovil.ServicesName[18] := 'alineación y balanceo';
		RegAutomovil.ServicesName[19] := 'reparación de chapas';
		RegAutomovil.ServicesName[20] := 'pintura del automóvil';
		RegAutomovil.ServicesName[21] := 'reparación del aire acondicionado';
		RegAutomovil.ServicesName[22] := 'Limpieza del motor';
		RegAutomovil.ServicesName[23] := 'limpieza de la carrocería';
		RegAutomovil.ServicesName[24] := 'verificación';

		RegAutomovil.NamePzs[1] := 'unidades de luces';
		RegAutomovil.NamePzs[2] := 'luces de los cuartos';
		RegAutomovil.NamePzs[3] := 'espejos laterales';
		RegAutomovil.NamePzs[4] := 'cristales';
		RegAutomovil.NamePzs[5] := 'emblema';
		RegAutomovil.NamePzs[6] := 'las 4 llantas';
		RegAutomovil.NamePzs[7] := 'tapones en las 4 ruedas';
		RegAutomovil.NamePzs[8] := 'la carrocería sin golpes';
		RegAutomovil.NamePzs[9] := 'las bocinas del claxon';
		RegAutomovil.NamePzs[10] := 'los limpiadores';
		RegAutomovil.NamePzs[11] := 'bocinas';
		RegAutomovil.NamePzs[12] := 'la calefacción';
		RegAutomovil.NamePzs[13] := 'los instrumentos del tablero';
		RegAutomovil.NamePzs[14] := 'el encendedor electrónico de cigarros';
		RegAutomovil.NamePzs[15] := 'el espejo retrovisor';
		RegAutomovil.NamePzs[16] := 'los ceniceros';
		RegAutomovil.NamePzs[17] := 'los cinturones de seguridad';
		RegAutomovil.NamePzs[18] := 'los botones interiores';
		RegAutomovil.NamePzs[19] := 'las manijas interiores';
		RegAutomovil.NamePzs[20] := 'los tapetes';
		RegAutomovil.NamePzs[21] := 'las vestiduras';
		RegAutomovil.NamePzs[22] := 'gato hidráulico';
		RegAutomovil.NamePzs[23] := 'maneral del gato hidráulico';
		RegAutomovil.NamePzs[24] := 'triángulo de seguridad';
		RegAutomovil.NamePzs[25] := 'llanta de refacción';
		RegAutomovil.NamePzs[26] := 'extinguidor';
		RegAutomovil.NamePzs[27] := 'el tapón de aceite';
		RegAutomovil.NamePzs[28] := 'el tapón del radiador';
		RegAutomovil.NamePzs[29] := 'el tapón de la gasolina';
		RegAutomovil.NamePzs[30] := 'las molduras competas';
		RegAutomovil.NamePzs[31] := 'la varilla del aceite';
		RegAutomovil.NamePzs[32] := 'filtro de aire';
		RegAutomovil.NamePzs[33] := 'batería';
		RegAutomovil.NamePzs[34] := 'estuche de herramientas';

		WRITELN (Utf8ToAnsi('Por favor, ingrese los datos de su automovil…'));
		WRITELN ('Marca: ');
		READLN (RegAutomovil.Marca);
		WRITELN ('Modelo: ');
		READLN (RegAutomovil.Modelo);
		WRITELN ('Color: ');
		READLN (RegAutomovil.Color);
		WRITELN (Utf8ToAnsi('Año: '));
		READLN (RegAutomovil.Anio);
		WRITELN ('No. de placas: ');
		READLN (RegAutomovil.NoPlacas);
		WRITELN ('No. de serie: ');
		READLN (RegAutomovil.NoSerie);

		WRITELN (Utf8ToAnsi('¿Utilizó refacciones?: '));
		READLN (Respuesta);
		IF ((Respuesta = 'SI') OR (Respuesta = 'si')) THEN 
		BEGIN
			WRITELN (Utf8ToAnsi('Ingrese que refacciones utilizó seguido de su costo, separadas con una coma: ejemplo: balatas $250.00, manija $200.00'));
			READLN (Respuesta);

			RegAutomovil.Refacciones := Respuesta;
			RegAutomovil.TotalRefacciones := SumarPrecios(Respuesta);

			WRITELN ('ingrese el nombre y el costo de la mano de obra de cada una de las refacciones separado por una coma. Ejemplo: cambio de balatas $100.00');
			READLN (Respuesta);
				
			RegAutomovil.TotalManoObra := SumarPrecios(Respuesta);
		end; // FIN (SI)

		FOR Contador := 1 TO 24 DO
		BEGIN
			WRITELN (Utf8ToAnsi('¿Realizó ' + RegAutomovil.ServicesName[Contador] + '?'));
			READLN (Respuesta);
			IF ((Respuesta = 'SI') OR (Respuesta = 'si')) THEN
			BEGIN
				WRITELN (Utf8ToAnsi('¿Cuál fue el costo del servicio?'));
				READLN (RegAutomovil.ServicesPrice[Contador]);
			end; // FIN (SI)
		end; // FIN (FOR)

		WRITELN ('Verifique el estado del auto:');

		FOR Contador := 1 TO 34 DO
		BEGIN
			WRITELN (Utf8ToAnsi('¿El automóvil tiene ' + RegAutomovil.NamePzs[Contador] + '?'));
			READLN(Respuesta);
			IF ((Respuesta = 'SI') OR (Respuesta ='si')) THEN
			BEGIN
				RegAutomovil.EdoPzs[Contador] := TRUE;
			END
			ELSE
			BEGIN
				RegAutomovil.EdoPzs[Contador] := FALSE;
			end; // FIN (SI)
		end; // FIN (FOR)

		WRITELN (Utf8ToAnsi('¿Se realizaron cargos adicionales? SI/NO'));
		READLN (Respuesta);

		IF ((Respuesta = 'SI') OR (Respuesta = 'si')) THEN
		BEGIN
			WRITELN (Utf8ToAnsi('¿Cuál fue el costo de los cargos adicionales?'));
			READLN (RegAutomovil.CargosAdicionales);
		end; // FIN (SI)

		WRITELN (Utf8ToAnsi('¿Utilizó grúa para transportar el automóvil?'));
		READLN(Respuesta);

		IF ((Respuesta = 'si') OR (Respuesta = 'SI')) THEN
		BEGIN
			WRITELN (Utf8ToAnsi('Ingrese el costo del transporte en grúa: '));
			READLN(RegAutomovil.UsoGrua);
		end; // FIN (SI)

		WRITELN (Utf8ToAnsi('El cliente dejó anticipo? SI/NO '));
		READLN (Respuesta);
		IF ((Respuesta = 'SI') OR (Respuesta ='si')) THEN
		BEGIN
			WRITELN (Utf8ToAnsi('¿Cuánto dinero dejó de anticipo?'));
			READLN (RegAutomovil.Anticipo);
		end; // FIN (SI)

		WRITELN ('Desglose de gastos');

		FOR Contador := 1 TO 24 DO
		BEGIN
		RegAutomovil.TotalServicios := RegAutomovil.TotalServicios + RegAutomovil.ServicesPrice[Contador];
		end; // FIN (FOR)

		RegAutomovil.TotalRefacciones := SumarPrecios (RegAutomovil.Refacciones);
		RegAutomovil.Subtotal := RegAutomovil.TotalRefacciones + RegAutomovil.TotalManoObra + RegAutomovil.TotalServicios;
		RegAutomovil.PrecioFinal := SumarIVA(RegAutomovil.Subtotal);
		RegAutomovil.Resta := RegAutomovil.PrecioFinal - RegAutomovil.Anticipo;

		READKEY;
	END;

	PROCEDURE MostrarDatosAuto();
	VAR
		ArchivoAutos: FILE OF EstAutomovil;
		RegAuto: EstAutomovil;
		c:INTEGER;
	BEGIN
		ASSIGN(ArchivoAutos, 'Automoviles.dat');
		RESET(ArchivoAutos);
	    READ (ArchivoAutos, RegAuto);
	    CLOSE(ArchivoAutos);
	    c:=1;
		WRITELN ('Marca: ' + RegAuto.Marca);
		WRITELN ('Modelo: ' + RegAuto.Modelo);
		WRITELN ('Color: ' + RegAuto.Color);
		WRITELN (Utf8ToAnsi('Año: '), RegAuto.Anio);
		WRITELN ('No. de placas: ' + RegAuto.NoPlacas);
		WRITELN ('No. de serie: ' + RegAuto.NoSerie);
		WRITELN ('Refacciones: ' + RegAuto.Refacciones);  
		WRITELN ('Mano de Obra: ',RegAuto.ManoObra);
		WRITELN ('Piezas que contiene el carro');
		while(c<=34) do
		BEGIN
			IF (RegAuto.EdoPzs[c] = TRUE) THEN
			BEGIN
				WRITELN(Utf8ToAnsi(RegAuto.NamePzs[c]));
			END;
			c:=c+1;
		end;
		c:=1;
		WRITELN ('Servicios del auto y costos');
		while(c<=24) do
		BEGIN
			IF (RegAuto.ServicesPrice[c] <> 0.0) THEN
			BEGIN
				WRITELN(Utf8ToAnsi(RegAuto.ServicesName[c])+': ',RegAuto.ServicesPrice[c]:0:2);
			END;
			c:=c+1;
		end;
	  
		WRITELN('Total de servicios: ',RegAuto.TotalServicios:0:2); 
		WRITELN('Total de refacciones',RegAuto.TotalRefacciones:0:2);   
		WRITELN('Total mano de obra',RegAuto.TotalManoObra:0:2); 
		WRITELN('Cargos: ',RegAuto.CargosAdicionales:0:2);  
		WRITELN('Grua: ',RegAuto.UsoGrua:0:2);   
		WRITELN('Subtotal: ',RegAuto.Subtotal:0:2);
		WRITELN('Precio Final: ',RegAuto.PrecioFinal:0:2);   
		WRITELN('Anticipo: ',RegAuto.Anticipo:0:2);   
		WRITELN('Resta: ',RegAuto.Resta:0:2); 

		READKEY;

	END;

BEGIN
	CapturarRegAutomovil();
	Guardar(RegAutomovil);
	MostrarDatosAuto();
END.

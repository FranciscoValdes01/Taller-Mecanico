PROGRAM taller;
USES dos,crt,sysutils, windows;
 {$CODEPAGE UTF8}
TYPE
EstPersonaFisica = RECORD
	IdCliente: INTEGER;
	Nombre: STRING;
	CURP: STRING;
	Calle: STRING;
	Colonia: STRING;
	NoInt: INTEGER;
	NoExterior: INTEGER;
	Municipio: STRING;
	CP: INTEGER;
	Tel: STRING;
END;

EstAutomovil = RECORD
	Marca: STRING;
    Modelo: STRING;
    Color: STRING;
    Anio: INTEGER;
    NoPlacas: STRING;
    NoSerie: STRING;
	Refacciones: STRING;
	CostoRefacciones: REAL;
	ManoObra: REAL;
	TotalCosto: REAL;
	TotalMO: REAL;
	MantElectGral:BOOLEAN;
	LavadoInyectores: BOOLEAN;
	Alternadores: BOOLEAN;
	ElectVentiladores: BOOLEAN;
	AfinacionCompl: BOOLEAN;
	CambioBujias: BOOLEAN;
	CuerpoAceleracion: BOOLEAN;
	SistEnfr: BOOLEAN;
	MantGral: BOOLEAN;
	Neumaticos: BOOLEAN;
	SistFrenos: BOOLEAN;
	Suspension: BOOLEAN;
	Transmision: BOOLEAN;
	Luces: BOOLEAN;
	Gases: BOOLEAN;
	Direccion: BOOLEAN;
	CambioAceiteFiltros: BOOLEAN;
	AlineacionBalanceo: BOOLEAN;
	ReparacionChapa: BOOLEAN;
	PinturaAutomovil: BOOLEAN;
	RepAireAvondicionado: BOOLEAN;
	LimpiezaMotor: BOOLEAN;
	LimpCarroceria: BOOLEAN;
	Verificacion: BOOLEAN;
	C_MantElectGral:REAL;
	C_LavadoInyectores: REAL;
	C_Alternadores: REAL;
	C_ElectVentiladores: REAL;
	C_AfinacionCompl: REAL;
	C_CambioBujias: REAL;
	C_CuerpoAceleracion: REAL;
	C_SistEnfr: REAL;
	C_MantGral: REAL;
	C_Neumaticos: REAL;
	C_SistFrenos: REAL;
	C_Suspension: REAL;
	C_Transmision: REAL;
	C_Luces: REAL;
	C_Gases: REAL;
	C_Direccion: REAL;
  	C_CambioAceiteFiltros: REAL;
	C_AlineacionBalanceo: REAL;
	C_ReparacionChapa: REAL;
	C_PinturaAutomovil: REAL;
	C_RepAireAvondicionado: REAL;
	C_LimpiezaMotor: REAL;
	C_LimpCarroceria: REAL;
	C_Verificacion: REAL;
	UnidadesLuces: BOOLEAN;
	CuartosLuces: BOOLEAN;
	EspejoLateral: BOOLEAN;
	Cristales: BOOLEAN;
	Emblema: BOOLEAN;
	Llantas4: BOOLEAN;
	TaponRuedas4: BOOLEAN;
	MoldurasCompletas: BOOLEAN;
	TaponGasolina: BOOLEAN;
	CarroceriasSinGolpes: BOOLEAN;
	BocinasClaxon: BOOLEAN;
	Limpiadores: BOOLEAN;
	Bocinas: BOOLEAN;
	Calefaccion: BOOLEAN;
	InstrumentosTablero: BOOLEAN;
	Encendedor: BOOLEAN;
	EspejoRetrovisor: BOOLEAN;
	Ceniceros: BOOLEAN;
	Cinturones: BOOLEAN;
	BotonesInterioes: BOOLEAN;
	ManijasInteriores: BOOLEAN;
	Tapetes: BOOLEAN;
	Vestiduras: BOOLEAN;
	Gato: BOOLEAN;
	ManeralGato: BOOLEAN;
	EstucheHerramientas: BOOLEAN;
	TrianguloSeguridad: BOOLEAN;
	LlantaRefaccion: BOOLEAN;
	Extinguidor: BOOLEAN;
	TaponAceite: BOOLEAN;
	TaponRadiador: BOOLEAN;
	VarillaAceite: BOOLEAN;
	FiltroAire: BOOLEAN;
	Bateria: BOOLEAN;
	Servicios: REAL;
	CargosAdicionales: REAL;
	UsoGrua: REAL;
	Subtotal: REAL;
	PrecioFinal: REAL;
	Anticipo: REAL;
	Resta: REAL;
END;
{
EstSolicitudServicio = RECORD
	PersonaFisica:EstPersonaFisica;
	Automovil:EstAutomovil;
	Refacciones :EstRefacciones;
	Automovil :EstEstadoAutomovil;
	DesgloseGastos:EstDesgloseGastos;
	CostoTotal:REAL;
	//FechaIngreso: FECHA/HORA
	//FechaEntrega:FECHA/HORA
	IdEmpleadoRecepcion:STRING;
END;
}
EstSolicitudServicio = RECORD
	//PersonaFisica: IdPersona;
	//Automovil: NoSerie
	CostoTotal: REAL;
	//FechaIngreso: FECHA/HORA
	//FechcaEntrega: FECHA/HORA
END;

VAR
	Solicitud: EstSolicitudServicio;
	A:real;
	B:real;
	C:real;
	D:real;

	procedure Mostrar(RegAutomovil:EstAutomovil);
	BEGIN 

		WRITELN('Datos del automovil...');
		WRITELN('Marca: ',RegAutomovil.Marca);
		WRITELN('Modelo: ',RegAutomovil.Modelo);
		WRITELN('Color: ',RegAutomovil.Color);
		WRITELN('Anio: ',RegAutomovil.Anio);
		WRITELN('No. de placas: ',RegAutomovil.NoPlacas);
		WRITELN('No. de serie: ',RegAutomovil.NoSerie);
		WRITELN('Refacciones');

		IF (RegAutomovil.Refacciones <> '') THEN
		BEGIN
			WRITELN('Refacciones');
			WRITELN('Refacciones que utilizo: ',RegAutomovil.Refacciones);
			WRITELN('Costo de refacciones: ',RegAutomovil.CostoRefacciones);
			WRITELN('Costo de mano de obra por refaccion: ',RegAutomovil.ManoObra);
			WRITELN('Costo total de la mano de obra: ',RegAutomovil.TotalMO);
		END;

		WRITELN('Mantenimineto electrico al automovil: ',RegAutomovil.MantElectGral);
		WRITELN('Lavado de Inyectores al Automovil: ',RegAutomovil.LavadoInyectores);
		WRITELN('Servicio de Alternadores al Automovil: ',RegAutomovil.Alternadores);
		WRITELN('Servicio de electro ventiladores al automovil: ',RegAutomovil.ElectVentiladores);
		WRITELN('Servicio de afinacion completa al automovil: ',RegAutomovil.AfinacionCompl);
		WRITELN('Servicio de cambio de bujias al automovil: ',RegAutomovil.CambioBujias);
		WRITELN('Realizo servicio de cuerpo de aceleracion al automovil: ',RegAutomovil.CuerpoAceleracion);
		WRITELN('Servicio de sistema de enfriamiento del automovil: ',RegAutomovil.SistEnfr);
		WRITELN('Servicio de mantenimiento general al automovil: ',RegAutomovil.MantGral);
		WRITELN('Servicio de neumaticos al automovil: ',RegAutomovil.Neumaticos);
		WRITELN('Servicio de sistema de frenos al automovil: ',RegAutomovil.SistFrenos);
		WRITELN('Servicio de suspension al automovil: ',RegAutomovil.Suspension);
		WRITELN('Servicio de transmicion al automovil: ',RegAutomovil.Transmision);
		WRITELN('Servicio de luces al automovil: ',RegAutomovil.Luces);
		WRITELN('Servicio de gases al automovil: ',RegAutomovil.Gases);
		WRITELN('Servicio de direcciones al automovil: ',RegAutomovil.Direccion);
		WRITELN('Servicio de Cambio de aceite y filtros al automovil: ',RegAutomovil.CambioAceiteFiltros);
		WRITELN('Servicio de alineacion y balanceo al automovil: ',RegAutomovil.AlineacionBalanceo);
		WRITELN('Servicio de reparacion de chapas al automovil: ',RegAutomovil.ReparacionChapa);
		WRITELN('Servicio de pintura al automovil: ',RegAutomovil.PinturaAutomovil);
		WRITELN('Servicio de aire acondicionado al automovil: ',RegAutomovil.RepAireAvondicionado);
		WRITELN('Servicio de limpieza de motor al automovil: ',RegAutomovil.LimpiezaMotor);
		WRITELN('Servicio de limpieza de carroceria al automovil: ',RegAutomovil.LimpCarroceria);
		WRITELN('Servicio de verificacion al automovil: ',RegAutomovil.Verificacion);

		WRITELN('Costo del servicio de mantenimiento electrico general: ',RegAutomovil.C_MantElectGral);
		WRITELN('Costo del servicio de lavado de inyectores: ',RegAutomovil.C_LavadoInyectores);
		WRITELN('Costo del servicio de alternadores: ',RegAutomovil.C_Alternadores);
		WRITELN('Costo del servicio de electro ventiladores: ',RegAutomovil.C_ElectVentiladores);
		WRITELN('Costo del servicio de afinacion completa: ',RegAutomovil.C_AfinacionCompl);
		WRITELN('Costo del servicio de CambioBujias: ',RegAutomovil.C_CambioBujias);
		WRITELN('Costo del servicio de Cuerpo de aceleracion: ',RegAutomovil.C_CuerpoAceleracion);
		WRITELN('Costo del servicio de Sistema de enfriamiento: ',RegAutomovil.C_SistEnfr);
		WRITELN('Costo del servicio de mantenimiento general: ',RegAutomovil.C_MantGral);
		WRITELN('Costo del servicio de neumaticos: ',RegAutomovil.C_Neumaticos);
		WRITELN('Costo del servicio de sistema de frenos: ',RegAutomovil.C_SistFrenos);
		WRITELN('Costo del servicio de suspension: ',RegAutomovil.C_Suspension);
		WRITELN('Costo del servicio de transmicion: ',RegAutomovil.C_Transmision);
		WRITELN('Costo del servicio de luces: ',RegAutomovil.C_Luces);
		WRITELN('Costo del servicio de gases: ',RegAutomovil.C_Gases);
		WRITELN('Costo del servicio de direccion: ',RegAutomovil.C_Direccion);
		WRITELN('Costo del servicio de cambio de aceite y filtros: ',RegAutomovil.C_CambioAceiteFiltros);
		WRITELN('Costo del servicio de alineacion y balanceo: ',RegAutomovil.C_AlineacionBalanceo);
		WRITELN('Costo del servicio de reparacion de chapa: ',RegAutomovil.C_ReparacionChapa);
		WRITELN('Costo del servicio de pintura de automovil: ',RegAutomovil.C_PinturaAutomovil);
		WRITELN('Costo del servicio de aire acondicionado: ',RegAutomovil.C_RepAireAvondicionado);
		WRITELN('Costo del servicio de limpieza de motor: ',RegAutomovil.C_LimpiezaMotor);
		WRITELN('Costo del servicio de limpieza carroceria: ',RegAutomovil.C_LimpCarroceria);
		WRITELN('Costo del servicio de verificacion: ',RegAutomovil.C_Verificacion);

		WRITELN('Estado del auto: ');
		WRITELN('El automovil tiene buenas condiciones las unidades de luces: ',RegAutomovil.UnidadesLuces);
		WRITELN('El automovil tiene buenas condiciones las luces de los cuartos: ',RegAutomovil.CuartosLuces);
		WRITELN('El automovil tiene buenas condiciones los espejos laterales: ',RegAutomovil.EspejoLateral);
		WRITELN('El automovil tiene buenas condiciones los cristales: ',RegAutomovil.Cristales);
		WRITELN('El automovil tiene buenas condiciones el emblema: ',RegAutomovil.Emblema);
		WRITELN('El automovil tiene buenas condiciones las 4 llantas: ',RegAutomovil.Llantas4);
		WRITELN('El automovil tiene buenas condiciones los 4 tapones de ruedas: ',RegAutomovil.TaponRuedas4);
		WRITELN('El automovil tienelas molduras completas: ',RegAutomovil.MoldurasCompletas);
		WRITELN('El automovil tiene buenas condiciones las unidades de luces: ',RegAutomovil.UnidadesLuces);
		WRITELN('El automovil tiene buenas condiciones el tapon de la gasolina: ',RegAutomovil.TaponGasolina);
		WRITELN('El automovil tiene buenas condiciones la carroceria: ',RegAutomovil.CarroceriasSinGolpes);
		WRITELN('El automovil tiene buenas condiciones las bocinas del claxon:',RegAutomovil.BocinasClaxon);
		WRITELN('El automovil tiene buenas condiciones los limpiadores: ',RegAutomovil.Limpiadores);
		WRITELN('El automovil tiene buenas condiciones las bocinas: ',RegAutomovil.Bocinas);
		WRITELN('El automovil tiene buenas condiciones la calefaccion: ',RegAutomovil.Calefaccion);
		WRITELN('El automovil tiene buenas condiciones los instrumentos del tablero: ',RegAutomovil.InstrumentosTablero);
		WRITELN('El automovil tiene buenas condiciones del encendedor: ',RegAutomovil.Encendedor);
		WRITELN('El automovil tiene buenas condiciones del espejo retrovisor: ',RegAutomovil.EspejoRetrovisor);
		WRITELN('El automovil tiene buenas condiciones los ceniceros: ',RegAutomovil.Ceniceros);
		WRITELN('El automovil tiene buenas condiciones los cinturones: ',RegAutomovil.Cinturones);
		WRITELN('El automovil tiene buenas condiciones los bontones interiores: ',RegAutomovil.BotonesInterioes);
		WRITELN('El automovil tiene buenas condiciones las manijas interiores: ',RegAutomovil.ManijasInteriores);
		WRITELN('El automovil tiene buenas condiciones los tapetes: ',RegAutomovil.Tapetes);
		WRITELN('El automovil tiene buenas condiciones las vestiduras: ',RegAutomovil.Vestiduras);
		WRITELN('El automovil tiene buenas condiciones los cristales?: ',RegAutomovil.Cristales);
		WRITELN('El automovil tiene gato: ',RegAutomovil.Gato);
		WRITELN('El automovil tiene maneral del gato: ',RegAutomovil.ManeralGato);
		WRITELN('El automovil tiene estuche de herramientas: ',RegAutomovil.EstucheHerramientas);
		WRITELN('El automovil tiene triangulo de seguridad: ',RegAutomovil.TrianguloSeguridad);
		WRITELN('El automovil tiene llanta de refaccion: ',RegAutomovil.LlantaRefaccion);
		WRITELN('El automovil tiene tapon de aceite: ',RegAutomovil.TaponAceite);
		WRITELN('El automovil tiene varilla del aceite: ',RegAutomovil.VarillaAceite);
		WRITELN('El automovil tiene filtro de aire: ',RegAutomovil.FiltroAire);
		WRITELN('El automovil tiene bateria: ',RegAutomovil.Bateria);
		WRITELN('El automovil tiene gato: ',RegAutomovil.Gato);
		WRITELN('Costo de los cargos adicionales: ',RegAutomovil.CargosAdicionales);
		WRITELN('Costo del transporte en grúa: ',RegAutomovil.UsoGrua);
		WRITELN('Anticipo del cliente: ',RegAutomovil.Anticipo);
	END;

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
	
	procedure CapturarSolicitud();
	VAR
		RegAutomovil: EstAutomovil;
		Respuesta:STRING;
	BEGIN
		RegAutomovil.Marca := '';
        RegAutomovil.Modelo :='';
        RegAutomovil.Color:='';
        RegAutomovil.Anio:=0;
        RegAutomovil.NoPlacas:='';
        RegAutomovil.NoSerie:='';
		RegAutomovil.Refacciones:='';
		RegAutomovil.CostoRefacciones:=0;
		RegAutomovil.ManoObra:=0;
		RegAutomovil.TotalCosto:=0;
		RegAutomovil.TotalMO:=0;
		RegAutomovil.MantElectGral:= FALSE;
		RegAutomovil.LavadoInyectores:= FALSE;
		RegAutomovil.Alternadores:= FALSE;
		RegAutomovil.ElectVentiladores:= FALSE;
		RegAutomovil.AfinacionCompl:= FALSE;
		RegAutomovil.CambioBujias:= FALSE;
		RegAutomovil.CuerpoAceleracion:= FALSE;
		RegAutomovil.SistEnfr:= FALSE;
		RegAutomovil.MantGral:= FALSE;
		RegAutomovil.Neumaticos:= FALSE;
		RegAutomovil.SistFrenos:= FALSE;
		RegAutomovil.Suspension:= FALSE;
		RegAutomovil.Transmision:= FALSE;
		RegAutomovil.Luces:= FALSE;
		RegAutomovil.Gases:= FALSE;
		RegAutomovil.Direccion:= FALSE;
 		RegAutomovil.CambioAceiteFiltros:= FALSE;
		RegAutomovil.AlineacionBalanceo:= FALSE;
		RegAutomovil.ReparacionChapa:= FALSE;
		RegAutomovil.PinturaAutomovil:= FALSE;
		RegAutomovil.RepAireAvondicionado:= FALSE;
		RegAutomovil.LimpiezaMotor:= FALSE;
		RegAutomovil.LimpCarroceria:= FALSE;
		RegAutomovil.Verificacion:= FALSE;
		RegAutomovil.C_MantElectGral:=0;
		RegAutomovil.C_LavadoInyectores:=0;
		RegAutomovil.C_Alternadores:=0;
		RegAutomovil.C_ElectVentiladores:=0;
		RegAutomovil.C_AfinacionCompl:=0;
		RegAutomovil.C_CambioBujias:=0;
		RegAutomovil.C_CuerpoAceleracion:=0;
		RegAutomovil.C_SistEnfr:=0;
		RegAutomovil.C_MantGral:=0;
		RegAutomovil.C_Neumaticos:=0;
		RegAutomovil.C_SistFrenos:=0;
		RegAutomovil.C_Suspension:=0;
		RegAutomovil.C_Transmision:=0;
		RegAutomovil.C_Luces:=0;
		RegAutomovil.C_Gases:=0;
		RegAutomovil.C_Direccion:=0;
  		RegAutomovil.C_CambioAceiteFiltros:=0;
		RegAutomovil.C_AlineacionBalanceo:=0;
		RegAutomovil.C_ReparacionChapa:=0;
		RegAutomovil.C_PinturaAutomovil:=0;
		RegAutomovil.C_RepAireAvondicionado:=0;
		RegAutomovil.C_LimpiezaMotor:=0;
		RegAutomovil.C_LimpCarroceria:=0;
		RegAutomovil.C_Verificacion:=0;
		RegAutomovil.UnidadesLuces:= FALSE;
		RegAutomovil.CuartosLuces:= FALSE;
		RegAutomovil.EspejoLateral:= FALSE;
		RegAutomovil.Cristales:= FALSE;
		RegAutomovil.Emblema:= FALSE;
		RegAutomovil.Llantas4:= FALSE;
		RegAutomovil.TaponRuedas4:= FALSE;
		RegAutomovil.MoldurasCompletas:= FALSE;
		RegAutomovil.TaponGasolina:= FALSE;
		RegAutomovil.CarroceriasSinGolpes:= FALSE;
		RegAutomovil.BocinasClaxon:= FALSE;
		RegAutomovil.Limpiadores:= FALSE;
		RegAutomovil.Bocinas:= FALSE;
		RegAutomovil.Calefaccion:= FALSE;
		RegAutomovil.InstrumentosTablero:= FALSE;
		RegAutomovil.Encendedor:= FALSE;
		RegAutomovil.EspejoRetrovisor:= FALSE;
		RegAutomovil.Ceniceros:= FALSE;
		RegAutomovil.Cinturones:= FALSE;
		RegAutomovil.BotonesInterioes:= FALSE;
		RegAutomovil.ManijasInteriores:= FALSE;
		RegAutomovil.Tapetes:= FALSE;
		RegAutomovil.Vestiduras:= FALSE;
		RegAutomovil.Gato:= FALSE;
		RegAutomovil.ManeralGato:= FALSE;
		RegAutomovil.EstucheHerramientas:= FALSE;
		RegAutomovil.TrianguloSeguridad:= FALSE;
		RegAutomovil.LlantaRefaccion:= FALSE;
		RegAutomovil.Extinguidor:= FALSE;
		RegAutomovil.TaponAceite:= FALSE;
		RegAutomovil.TaponRadiador:= FALSE;
		RegAutomovil.VarillaAceite:= FALSE;
		RegAutomovil.FiltroAire:= FALSE;
		RegAutomovil.Bateria:= FALSE;
		RegAutomovil.ManoObra:=0;
		RegAutomovil.Servicios:=0;
		RegAutomovil.Refacciones:='';
		RegAutomovil.CargosAdicionales:=0;
		RegAutomovil.UsoGrua:=0;
		RegAutomovil.Subtotal:=0;
		RegAutomovil.PrecioFinal:=0;
		RegAutomovil.Anticipo:=0;
		RegAutomovil.Resta:=0;

		WRITELN('Por favor, ingrese los datos de su automovil...');
		WRITELN('Marca: ');
		READLN(RegAutomovil.Marca);
		WRITELN('Modelo: ');
		READLN(RegAutomovil.Modelo);
		WRITELN('Color: ');
                Readkey;
		READLN(RegAutomovil.Color);
		WRITELN('Anio: ');
		READLN(RegAutomovil.Anio);
		WRITELN('No. de placas: ');
		READLN(RegAutomovil.NoPlacas);
		WRITELN('No. de serie: ');
		READLN(RegAutomovil.NoSerie);
		WRITELN('Utilizo refacciones?');
		READLN(Respuesta);
		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			WRITELN ('Ingrese que refacciones utilizó seguido de su costo, separadas con una coma: ejemplo: balatas $250.00, manija $200.00');
			READLN (Respuesta);

			//RegAutomovil.Costo := Respuesta;
			RegAutomovil.TotalCosto := SumarPrecios(Respuesta);

			WRITELN ('ingrese el nombre y el costo de la mano de obra de cada una de las refacciones separado por una coma. Ejemplo: cambio de balatas $100.00');
			READLN (Respuesta);
				
			RegAutomovil.TotalMO := SumarPrecios(Respuesta);
		END;

		WRITELN('Realizo mantenimineto electrico al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.MantElectGral := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.MantElectGral := FALSE;
		END;

		WRITELN('Realizo Lavado de Inyectores al Automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.LavadoInyectores := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.LavadoInyectores := FALSE;
		END;

		WRITELN('Realizo servicio de Alternadores al Automovil');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Alternadores := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Alternadores := FALSE;
		END;

		WRITELN('Realizo servicio de electro ventiladores al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.ElectVentiladores := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.ElectVentiladores := FALSE;
		END;

		WRITELN('Realizo servicio de afinacion completa al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.AfinacionCompl := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.AfinacionCompl:= FALSE;
		END;

		WRITELN('Realizo servicio de cambio de bujias al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.CambioBujias := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.CambioBujias := FALSE;
		END;

		WRITELN('Realizo servicio de cuerpo de aceleracion al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.CuerpoAceleracion := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.CuerpoAceleracion := FALSE;
		END;


		WRITELN('Realizo servicio de sistema de enfriamiento del automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.SistEnfr := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.SistEnfr := FALSE;
		END;

		WRITELN('Realizo servicio de mantenimiento general al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.MantGral := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.MantGral := FALSE;
		END;

		WRITELN('Realizo servicio de neumaticos al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Neumaticos := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Neumaticos := FALSE;
		END;

		WRITELN('Realizo servicio de sistema de frenos al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.SistFrenos := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.SistFrenos := FALSE;
		END;

		WRITELN('Realizo servicio de suspension al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Suspension := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Suspension := FALSE;
		END;

		WRITELN('Realizo servicio de transmicion al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Transmision := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Transmision := FALSE;
		END;

		WRITELN('Realizo servicio de luces al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Luces := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Luces := FALSE;
		END;

		WRITELN('Realizo servicio de gases al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Gases := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Gases := FALSE;
		END;

		WRITELN('Realizo servicio de direcciones al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Direccion := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Direccion := FALSE;
		END;

		WRITELN('Realizo servicio de Cambio de aceite y filtros al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.CambioAceiteFiltros := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.CambioAceiteFiltros := FALSE;
		END;

		WRITELN('Realizo servicio de alineacion y balanceo al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.AlineacionBalanceo := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.AlineacionBalanceo := FALSE;
		END;

		WRITELN('Realizo servicio de reparacion de chapas al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.ReparacionChapa := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.ReparacionChapa := FALSE;
		END;

		WRITELN('Realizo servicio de pintura al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.PinturaAutomovil := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.PinturaAutomovil := FALSE;
		END;

		WRITELN('Realizo servicio de aire acondicionado al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.RepAireAvondicionado := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.RepAireAvondicionado := FALSE;
		END;

		WRITELN('Realizo servicio de limpieza de motor al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.LimpiezaMotor := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.LimpiezaMotor := FALSE;
		END;

		WRITELN('Realizo servicio de limpieza de carroceria al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.LimpCarroceria := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.LimpCarroceria := FALSE;
		END;

		WRITELN('Realizo servicio de verificacion al automovil?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Verificacion := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Verificacion := FALSE;
		END;

		WRITELN('Ingrese el costo del servicio de mantenimiento electrico general: ');
		READLN(RegAutomovil.C_MantElectGral);
		WRITELN('Ingrese el costo del servicio de lavado de inyectores: ');
		READLN(RegAutomovil.C_LavadoInyectores);
		WRITELN('Ingrese el costo del servicio de alternadores: ');
		READLN(RegAutomovil.C_Alternadores);
		WRITELN('Ingrese el costo del servicio de electro ventiladores: ');
		READLN(RegAutomovil.C_ElectVentiladores);
		WRITELN('Ingrese el costo del servicio de afinacion completa: ');
		READLN(RegAutomovil.C_AfinacionCompl);
		WRITELN('Ingrese el costo del servicio de CambioBujias: ');
		READLN(RegAutomovil.C_CambioBujias);
		WRITELN('Ingrese el costo del servicio de Cuerpo de aceleracion: ');
		READLN(RegAutomovil.C_CuerpoAceleracion);
		WRITELN('Ingrese el costo del servicio de Sistema de enfriamiento: ');
		READLN(RegAutomovil.C_SistEnfr);
		WRITELN('Ingrese el costo del servicio de mantenimiento general: ');
		READLN(RegAutomovil.C_MantGral);
		WRITELN('Ingrese el costo del servicio de neumaticos: ');
		READLN(RegAutomovil.C_Neumaticos);
		WRITELN('Ingrese el costo del servicio de sistema de frenos: ');
		READLN(RegAutomovil.C_SistFrenos);
		WRITELN('Ingrese el costo del servicio de suspension: ');
		READLN(RegAutomovil.C_Suspension);
		WRITELN('Ingrese el costo del servicio de transmicion: ');
		READLN(RegAutomovil.C_Transmision);
		WRITELN('Ingrese el costo del servicio de luces: ');
		READLN(RegAutomovil.C_Luces);
		WRITELN('Ingrese el costo del servicio de gases: ');
		READLN(RegAutomovil.C_Gases);
		WRITELN('Ingrese el costo del servicio de direccion: ');
		READLN(RegAutomovil.C_Direccion);
		WRITELN('Ingrese el costo del servicio de cambio de aceite y filtros: ');
		READLN(RegAutomovil.C_CambioAceiteFiltros);
		WRITELN('Ingrese el costo del servicio de alineacion y balanceo: ');
		READLN(RegAutomovil.C_AlineacionBalanceo);
		WRITELN('Ingrese el costo del servicio de reparacion de chapa: ');
		READLN(RegAutomovil.C_ReparacionChapa);
		WRITELN('Ingrese el costo del servicio de pintura de automovil: ');
		READLN(RegAutomovil.C_PinturaAutomovil);
		WRITELN('Ingrese el costo del servicio de aire acondicionado: ');
		READLN(RegAutomovil.C_RepAireAvondicionado);
		WRITELN('Ingrese el costo del servicio de limpieza de motor: ');
		READLN(RegAutomovil.C_LimpiezaMotor);
		WRITELN('Ingrese el costo del servicio de limpieza carroceria: ');
		READLN(RegAutomovil.C_LimpCarroceria);
		WRITELN('Ingrese el costo del servicio de verificacion: ');
		READLN(RegAutomovil.C_Verificacion);

		WRITELN('Verifique el estado del auto: ');
		WRITELN('El automovil tiene buenas condiciones las unidades de luces? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.UnidadesLuces := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.UnidadesLuces := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones las luces de los cuartos? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.CuartosLuces := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.CuartosLuces := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los espejos laterales? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.EspejoLateral := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.EspejoLateral := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los cristales? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Cristales := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Cristales := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones el emblema?');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Emblema := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Emblema := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones las 4 llantas? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Llantas4 := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Llantas4 := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los 4 tapones de ruedas? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.TaponRuedas4 := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.TaponRuedas4 := FALSE;
		END;

		WRITELN('El automovil tienelas molduras completas? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.MoldurasCompletas := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.MoldurasCompletas := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones las unidades de luces? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.UnidadesLuces := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.UnidadesLuces := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones el tapon de la gasolina? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.TaponGasolina := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.TaponGasolina := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones la carroceria? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.CarroceriasSinGolpes := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.CarroceriasSinGolpes := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones las bocinas del claxon? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.BocinasClaxon := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.BocinasClaxon := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los limpiadores? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Limpiadores := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Limpiadores := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones las bocinas? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Bocinas := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Bocinas := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones la calefaccion? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Calefaccion := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Calefaccion := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los instrumentos del tablero? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.InstrumentosTablero := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.InstrumentosTablero := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones del encendedor? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Encendedor := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Encendedor := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones del espejo retrovisor? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.EspejoRetrovisor := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.EspejoRetrovisor := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los ceniceros? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Ceniceros := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Ceniceros := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los cinturones? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Cinturones := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Cinturones := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los bontones interiores? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.BotonesInterioes := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.BotonesInterioes := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones las manijas interiores? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.ManijasInteriores := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.ManijasInteriores := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los tapetes? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Tapetes := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Tapetes:= FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones las vestiduras? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Vestiduras := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Vestiduras := FALSE;
		END;

		WRITELN('El automovil tiene buenas condiciones los cristales? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Cristales := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Cristales := FALSE;
		END;

		WRITELN('El automovil tiene gato? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Gato := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Gato := FALSE;
		END;

		WRITELN('El automovil tiene maneral del gato? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.ManeralGato := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.ManeralGato := FALSE;
		END;

		WRITELN('El automovil tiene estuche de herramientas? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.EstucheHerramientas := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.EstucheHerramientas := FALSE;
		END;

		WRITELN('El automovil tiene triangulo de seguridad? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.TrianguloSeguridad := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.TrianguloSeguridad := FALSE;
		END;

		WRITELN('El automovil tiene llanta de refaccion? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.LlantaRefaccion := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.LlantaRefaccion := FALSE;
		END;

		WRITELN('El automovil tiene tapon de aceite? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.TaponAceite := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.TaponAceite := FALSE;
		END;

		WRITELN('El automovil tiene varilla del aceite? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.VarillaAceite := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.VarillaAceite := FALSE;
		END;

		WRITELN('El automovil tiene filtro de aire? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.FiltroAire := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.FiltroAire := FALSE;
		END;

		WRITELN('El automovil tiene bateria? ');
		READLN(Respuesta);

		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			RegAutomovil.Bateria := TRUE;
		END
		ELSE
		BEGIN
			RegAutomovil.Bateria := FALSE;
		END;

		WRITELN('¿Se realizaron cargos adicionales? SI/NO');
		READLN(Respuesta);
		IF (Respuesta = 'SI') OR (Respuesta = 'si') THEN
		BEGIN
			WRITELN('¿Cuál fue el costo de los cargos adicionales?');
			READLN(RegAutomovil.CargosAdicionales);
		END;

		WRITELN('¿Utilizó grúa para transportar el automóvil?');
		READLN(Respuesta);

		IF (Respuesta = 'si') OR (Respuesta = 'SI') THEN
		BEGIN
			WRITELN('Ingrese el costo del transporte en grúa: ');
			READLN(RegAutomovil.UsoGrua);
		END;

		WRITELN('El cliente dejó anticipo? SI/NO ');
		
		IF (Respuesta = 'SI') OR (Respuesta ='si') THEN
		BEGIN
			WRITELN('¿Cuánto dinero dejó de anticipo?');
			READLN(RegAutomovil.Anticipo);
		END;
		
		A:=RegAutomovil.C_Alternadores + RegAutomovil.C_ElectVentiladores + RegAutomovil.C_AfinacionCompl + RegAutomovil.C_CambioBujias + RegAutomovil.C_Direccion + RegAutomovil.C_CambioAceiteFiltros;
		B:=RegAutomovil.C_MantGral + RegAutomovil.C_Neumaticos + RegAutomovil.C_SistFrenos + RegAutomovil.C_Suspension + RegAutomovil.C_Transmision +RegAutomovil.C_Luces + RegAutomovil.C_Gases;
		C:=RegAutomovil.C_LimpiezaMotor + RegAutomovil.C_LimpCarroceria + RegAutomovil.C_Verificacion+RegAutomovil.C_AlineacionBalanceo+RegAutomovil.C_MantElectGral + RegAutomovil.C_LavadoInyectores;
		D:=RegAutomovil.C_ReparacionChapa + RegAutomovil.C_PinturaAutomovil + RegAutomovil.C_RepAireAvondicionado + RegAutomovil.C_CuerpoAceleracion + RegAutomovil.C_SistEnfr;
		RegAutomovil.Servicios:=  A + B + C + D;

		RegAutomovil.CostoRefacciones := SumarPrecios (RegAutomovil.Refacciones);
		RegAutomovil.Subtotal := RegAutomovil.CostoRefacciones + RegAutomovil.TotalCosto + RegAutomovil.TotalMO + RegAutomovil.Servicios;
		RegAutomovil.PrecioFinal := SumarIVA(RegAutomovil.Subtotal);
		RegAutomovil.Resta := RegAutomovil.PrecioFinal - RegAutomovil.Anticipo;

		WRITELN('Desglose de gastos');
		WRITELN('Costo de los servicios: ', RegAutomovil.Servicios:0:2);
		WRITELN('Costo de las refacciones: ', RegAutomovil.CostoRefacciones:0:2);
		WRITELN('Costo de los subtotal: ', RegAutomovil.Subtotal:0:2);
		WRITELN('Costo de los precio final: ', RegAutomovil.PrecioFinal:0:2);
		WRITELN('Anticipo: ', RegAutomovil.Anticipo:0:2);
	
		Guardar(RegAutomovil);
		Readkey();
	END;

	BEGIN

		setConsoleOutputCP(CP_UTF8);
		CapturarSolicitud();
	END.

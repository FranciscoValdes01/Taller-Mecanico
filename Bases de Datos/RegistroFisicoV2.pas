PROGRAM RegistroFisico;
uses dos,crt, sysutils;

(*Diseño
Pseudocódigo
ENCABEZADO
Nombre:	  Registro Fisicos
Autor:    COWORKERS COMPANNY
Fecha de creación: 11/02/2020
Fecha de última modificación: 12/02/2020*)

type
	EstPersonaFisica = record
		IdCliente: integer;
		Nombre: string;
		CURP: string;
		Calle: string;
		Colonia: string;
		NoInt: integer;
		NoExterior: integer;
		Municipio: string;
		CP: string;
		Tel: string;
	end;

	EstSolicitudServicio = record
		PersonaFisica: integer; 										//IdPersona
		Automovil: string;												//NoSerie
		CostoTotal: real;
		FechaIngreso: string;
		FechcaEntrega: string;
	end;


	EstAutomovil = record
		Marca: string;
        Modelo: string;
        Color: string;
        Ano: integer;
        NoPlacas: string;
        NoSerie: string;
		Refacciones: string;
		CostoRefacciones: real;
		ManoObra: real;
		TotalCosto: real;
		TotalMO: real;
		MantElectGral:boolean;
		LavadoInyectores: boolean;
		Alternadores: boolean;
		ElectVentiladores: boolean;
		AfinacionCompl: boolean;
		CambioBujias: boolean;
		CuerpoAceleracion: boolean;
		SistEnfr: boolean;
		MantGral: boolean;
		Neumaticos: boolean;
		SistFrenos: boolean;
		Suspension: boolean;
		Transmision: boolean;
		Luces: boolean;
		Gases: boolean;
		Direccion: boolean;
		CambioAceiteFiltros: boolean;
		AlineacionBalanceo: boolean;
		ReparacionChapa: boolean;
		PinturaAutomovil: boolean;
		RepAireAvondicionado: boolean;
		LimpiezaMotor: boolean;
		LimpCarroceria: boolean;
		Verificacion: boolean;
		C_MantElectGral:real;
		C_LavadoInyectores: real;
		C_Alternadores: real;
		C_ElectVentiladores: real;
		C_AfinacionCompl: real;
		C_CambioBujias: real;
		C_CuerpoAceleracion: real;
		C_SistEnfr: real;
		C_MantGral: real;
		C_Neumaticos: real;
		C_SistFrenos: real;
		C_Suspension: real;
		C_Transmision: real;
		C_Luces: real;
		C_Gases: real;
		C_Direccion: real;
		C_CambioAceiteFiltros: real;
		C_AlineacionBalanceo: real;
		C_ReparacionChapa: real;
		C_PinturaAutomovil: real;
		C_RepAireAvondicionado: real;
		C_LimpiezaMotor: real;
		C_LimpCarroceria: real;
		C_Verificacion: real;
		UnidadesLuces: boolean;
		CuartosLuces: boolean;
		EspejoLateral: boolean;
		Cristales: boolean;
		Emblema: boolean;
		Llantas4: boolean;
		TaponRuedas4: boolean;
		MoldurasCompletas: boolean;
		TaponGasolina: boolean;
		CarroceriasSinGolpes: boolean;
		BocinasClaxon: boolean;
		Limpiadores: boolean;
		Bocinas: boolean;
		Calefaccion: boolean;
		InstrumentosTablero: boolean;
		Encendedor: boolean;
		EspejoRetrovisor: boolean;
		Ceniceros: boolean;
		Cinturones: boolean;
		BotonesInterioes: boolean;
		ManijasInteriores: boolean;
		Tapetes: boolean;
		Vestiduras: boolean;
		Gato: boolean;
		ManeralGato: boolean;
		EstucheHerramientas: boolean;
		TrianguloSeguridad: boolean;
		LlantaRefaccion: boolean;
		Extinguidor: boolean;
		TaponAceite: boolean;
		TaponRadiador: boolean;
		VarillaAceite: boolean;
		FiltroAire: boolean;
		Bateria: boolean;
		Servicios: real;
		CargosAdicionales: real;
		UsoGrua: real;
		Subtotal: real;
		PrecioFinal: real;
		Anticipo: real;
		Resta: real;
	end;

Var
	arcCliente : file of EstPersonaFisica;
	//arcAutomovil : file of EstAutomovil;
	arcServicio : file of EstSolicitudServicio;
	EstCliente : EstPersonaFisica;
	//EstAuto : EstAutomovil;
	EstServicio : EstSolicitudServicio;
	respuesta: string;
	YYY,MMM,DDD,DDS : Word;
	date:string;
	DD:STRING;
	MM:STRING;
	AA:STRING;

//////////////////////////////////////////////////////////////////////////
procedure llenarCliente();
var
	temp:EstPersonaFisica;
begin
	writeln('Ingrese No de Cliente');
	readln(EstCliente.IdCliente);
	
	writeln('Ingrese Nombre Completo');
	readln(EstCliente.Nombre);
	
	writeln('Ingrese CURP');
	readln(EstCliente.CURP);
	
	writeln('Ingrese Calle');
	readln(EstCliente.Calle);
	
	writeln('Ingrese Colonia');
	readln(EstCliente.Colonia);
	
	writeln('Ingrese NoInt');
	readln(EstCliente.NoInt);
	
	writeln('Ingrese NoExterior');
	readln(EstCliente.NoExterior);
	
	writeln('Ingrese Municipio');
	readln(EstCliente.Municipio);
	
	writeln('Ingrese CP');
	readln(EstCliente.CP);
	
	writeln('Ingrese Tel');
	readln(EstCliente.Tel);
	
	reset(arcCliente);

	while(not(EOF(arcCliente)))do
		begin
			read(arcCliente,temp);
		end;
    write(arcCliente,EstCliente);
    close(arcCliente);
	
end;
//////////////////////////////////////////////////////////////////////////	
procedure llenarServicio();
var
	temp:EstSolicitudServicio;
begin
	writeln('Ingrese Persona Fisica');
	readln(EstServicio.PersonaFisica);
	
	writeln('Ingrese Automovil');
	readln(EstServicio.Automovil);
	
	writeln('Ingrese CostoTotal');
	readln(EstServicio.CostoTotal);
	
	//writeln('Ingrese FechaIngreso');
	//readln(date1);
		(*DD:='';
		MM:='';
		AA:='';																		
        getDATE(YYY,MMM,DDD,DDS);
        val(DD,DDD,ERRORCODE);
        val(MM,MMM,ERRORCODE);
        val(AA,YYY,ERRORCODE);
		date:=DD+MM+AA;
		EstServicio.FechaIngreso:= date;
		
		writeln('Date: ', date);
		readkey;*)
	EstServicio.FechaIngreso:=DateTimeToStr(Now);
		
	writeln('Ingrese FechcaEntrega');
	readln(EstServicio.FechcaEntrega);
	
	reset(arcServicio);

	while(not(EOF(arcServicio)))do
		begin
			read(arcServicio,temp);
		end;
	write(arcServicio,EstServicio);
    close(arcServicio);

end;
//////////////////////////////////////////////////////////////////////////
Procedure inicio();

begin
	EstCliente.IdCliente:= 0;
	EstCliente.Nombre:=' ';
	EstCliente.CURP:=' ';
	EstCliente.Calle:=' ';
	EstCliente.Colonia:=' ';
	EstCliente.NoInt:= 0;
	EstCliente.NoExterior:= 0;	
	EstCliente.Municipio:=' ';
	EstCliente.CP:= ' ';
	EstCliente.Tel:=' ';

	
	EstServicio.PersonaFisica:= 0;
	EstServicio.Automovil:=' ';
	EstServicio.CostoTotal:= 0;

	assign(arcCliente,'Clientes.dat');
	assign(arcServicio, 'Servicios.dat');
	
	if fileExists('Clientes.dat') then
		begin
			reset(arcCliente);
		end
	else
		begin
			rewrite(arcCliente);
		end;
		close(arcCliente);
		
		
	if fileExists('Servicios.dat') then
		begin
			reset(arcServicio);
		end
	else
		begin
			rewrite(arcServicio);
		end;
		close(arcServicio);

end;
//////////////////////////////////////////////////////////////////////////	
BEGIN
	
	respuesta := 'si';
	inicio();
	REPEAT
	clrscr;
		llenarCliente();
		writeln(' ');
		writeln(' ');
		writeln('---------------SERVICIO--------------');
		llenarServicio();
		
		writeln('REGISTRO COMPLETADO');
		
		writeln('Quiere Agregar otor Registro');
		readln(respuesta);
		
	UNTIL(respuesta = 'no');
END.

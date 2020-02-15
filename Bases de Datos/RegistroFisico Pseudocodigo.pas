rEGISTROS FISICOS


Pseudocódigo

Nombre:	  registros Fisicos
Autor:    COWORKERS 
Fecha de creación: 11/02/2020
Fecha de última modificación: 12/02/2020

Tipos
	EstPersonaFisica = estructura
		IdCliente: entero
		Nombre: cadena
		CURP: cadena
		Calle: cadena
		Colonia: cadena
		NoInt: entero
		NoExterior: entero
		Municipio: cadena
		CP: cadena
		Tel: cadena
	fin estructura
	
	EstSolicitudServicio = estructura
		PersonaFisica: entero 										
		Automovil: cadena											
		CostoTotal: real
		FechaIngreso: cadena
		FechcaEntrega: cadena
	fin estructura

	
	EstAutomovil = estructura
		Marca: cadena
        Modelo: cadena
        Color: cadena
        Ano: entero
        NoPlacas: cadena
        NoSerie: cadena
		Refacciones: cadena
		CostoRefacciones: real
		ManoObra: real
		TotalCosto: real
		TotalMO: real
		MantElectGral:booleano
		LavadoInyectores: booleano
		Alternadores: booleano
		ElectVentiladores: booleano
		AfinacionCompl: booleano
		CambioBujias: booleano
		CuerpoAceleracion: booleano
		SistEnfr: booleano
		MantGral: booleano
		Neumaticos: booleano
		SistFrenos: booleano
		Suspension: booleano
		Transmision: booleano
		Luces: booleano
		Gases: booleano
		Direccion: booleano
		CambioAceiteFiltros: booleano
		AlineacionBalanceo: booleano
		ReparacionChapa: booleano
		PinturaAutomovil: booleano
		RepAireAvondicionado: booleano
		LimpiezaMotor: booleano
		LimpCarroceria: booleano
		Verificacion: booleano
		C_MantElectGral:real
		C_LavadoInyectores: real
		C_Alternadores: real
		C_ElectVentiladores: real
		C_AfinacionCompl: real
		C_CambioBujias: real
		C_CuerpoAceleracion: real
		C_SistEnfr: real
		C_MantGral: real
		C_Neumaticos: real
		C_SistFrenos: real
		C_Suspension: real
		C_Transmision: real
		C_Luces: real
		C_Gases: real
		C_Direccion: real
		C_CambioAceiteFiltros: real
		C_AlineacionBalanceo: real
		C_ReparacionChapa: real
		C_PinturaAutomovil: real
		C_RepAireAvondicionado: real
		C_LimpiezaMotor: real
		C_LimpCarroceria: real
		C_Verificacion: real
		UnidadesLuces: booleano
		CuartosLuces: booleano
		EspejoLateral: booleano
		Cristales: booleano
		Emblema: booleano
		Llantas4: booleano
		TaponRuedas4: booleano
		MoldurasCompletas: booleano
		TaponGasolina: booleano
		CarroceriasSinGolpes: booleano
		BocinasClaxon: booleano
		Limpiadores: booleano
		Bocinas: booleano
		Calefaccion: booleano
		InstrumentosTablero: booleano
		Encfiedor: booleano
		EspejoRetrovisor: booleano
		Ceniceros: booleano
		Cinturones: booleano
		BotonesInterioes: booleano
		ManijasInteriores: booleano
		Tapetes: booleano
		Vestiduras: booleano
		Gato: booleano
		ManeralGato: booleano
		EstucheHerramientas: booleano
		TrianguloSeguridad: booleano
		LlantaRefaccion: booleano
		Extinguidor: booleano
		TaponAceite: booleano
		TaponRadiador: booleano
		variablesillaAceite: booleano
		FiltroAire: booleano
		Bateria: booleano
		Servicios: real
		CargosAdicionales: real
		UsoGrua: real
		Subtotal: real
		PrecioFinal: real
		Anticipo: real
		Resta: real
	fin estructura

variables
	arcCliente : archivo de EstPersonaFisica
	arcAutomovil : archivo de EstAutomovil
	arcServicio : archivo de EstSolicitudServicio
	EstCliente : EstPersonaFisica
	EstAuto : EstAutomovil
	EstServicio : EstSolicitudServicio
	respuesta: cadena
	YYY,MMM,DDD,DDS : Fecha
	date:cadena
	DD:cadena
	MM:cadena
	AA:cadena

//////////////////////////////////////////////////////////////////////////
procedimiento llenarCliente()
variables
	temp:EstPersonaFisica
inicio
	escribir('Ingrese No de Cliente')
	leer(EstCliente.IdCliente)
	
	escribir('Ingrese Nombre Completo')
	leer(EstCliente.Nombre)
	
	escribir('Ingrese CURP')
	leer(EstCliente.CURP)
	
	escribir('Ingrese Calle')
	leer(EstCliente.Calle)
	
	escribir('Ingrese Colonia')
	leer(EstCliente.Colonia)
	
	escribir('Ingrese NoInt')
	leer(EstCliente.NoInt)
	
	escribir('Ingrese NoExterior')
	leer(EstCliente.NoExterior)
	
	escribir('Ingrese Municipio')
	leer(EstCliente.Municipio)
	
	escribir('Ingrese CP')
	leer(EstCliente.CP)
	
	escribir('Ingrese Tel')
	leer(EstCliente.Tel)
	
	reset(arcCliente)

	mientras no(EOF(arcCliente))hacer
		inicio
			leer(arcCliente,temp)
		fin
    escriir(arcCliente,EstCliente)
    cerrar(arcCliente)
	
fin
//////////////////////////////////////////////////////////////////////////	
procedimiento llenarServicio()
variables
	temp:EstSolicitudServicio
inicio
	escribir('Ingrese Persona Fisica')
	leer(EstServicio.PersonaFisica)
	
	escribir('Ingrese Automovil')
	leer(EstServicio.Automovil)
	
	escribir('Ingrese CostoTotal')
	leer(EstServicio.CostoTotal)
	
	
		DD<-''
		MM<-''
		AA<-''																		
        fecha de hoy(YYY,MMM,DDD,DDS)
        val(DD,DDD,codigo de error)
        val(MM,MMM,codigo de error)
        val(AA,YYY,codigo de error)
		date<-DD+MM+AA
		EstServicio.FechaIngreso<- date
	
	escribir('Ingrese FechcaEntrega')
	leer(date)
	
	reset(arcServicio)

	mietras no(EOF(arcServicio)) hacer
		inicio
			leer(arcServicio,temp)
		fin
	escriir(arcServicio,EstServicio)
    cerrar(arcServicio)

fin
//////////////////////////////////////////////////////////////////////////
procedimiento inicio()

inicio
	EstCliente.IdCliente<- 0
	EstCliente.Nombre<-' '
	EstCliente.CURP<-' '
	EstCliente.Calle<-' '
	EstCliente.Colonia<-' '
	EstCliente.NoInt<- 0
	EstCliente.NoExterior<- 0	
	EstCliente.Municipio<-' '
	EstCliente.CP<- 0
	EstCliente.Tel<-' '

	
	EstServicio.PersonaFisica<- 0
	EstServicio.Automovil<-' '
	EstServicio.CostoTotal<- 0

	asigar(arcCliente,'Clientes.dat')
	asigar(arcServicio, 'Servicios.dat')
	
	si archivo('Clientes.dat')existe etoces
		
			abrir(arcCliente)
		
	si no
		
			crear(arcCliente)
	fin si
		cerrar(arcCliente)
		
		
	si archivo('Servicios.dat') existe etnoces
			abrir(arcServicio)
		
	si no
		crear(arcServicio)
	fin si
		cerrar(arcServicio)

fin
//////////////////////////////////////////////////////////////////////////	
inicio
	
	respuesta <- 'si'
	
	inicio()
	
	repetir
		llenarCliente()
		escribir(' ')
		escribir(' ')
		escribir('---------------SERVICIO--------------')
		llenarServicio()
		
		escribir('estructura COMPLETADO')
		
		escribir('Quiere Agregar otor estructura')
		leer(respuesta)
		
	hasta(respuesta = 'no')
fin

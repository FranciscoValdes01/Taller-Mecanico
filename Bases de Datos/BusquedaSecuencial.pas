program BusquedaSecuencial;
uses dos,crt,sysutils;



type

	EstSolicitudServicio = record
		PersonaFisica: integer; 										//IdPersona
		Automovil: string;												//NoSerie
		CostoTotal: real;
		FechaIngreso: string;
		FechcaEntrega: string;
	end;

Var
	arcServicio : file of EstSolicitudServicio;
	temp:EstSolicitudServicio;
	i:integer;


(*//////////////////////////////////////////////////////////////////////////
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
*)


BEGIN

	clrscr;
	assign(arcServicio,'Servicios.dat');
	
	
	if fileExists('Servicios.dat') then
		begin
			reset(arcServicio);
		end
	else
		begin
			rewrite(arcServicio);
		end;
		
		
	i:=0;

	
	while(not(EOF(arcServicio)))do
		begin
	
		
			i:=i+1;
			read(arcServicio,temp);
			
			writeln ('PersonaFisica: ',temp.PersonaFisica);
			writeln ('Automovil:',temp.Automovil);
			writeln ('CostoTotal:',temp.CostoTotal:0:2);
			writeln ('FechaIngreso:',temp.FechaIngreso);
			writeln ('FechcaEntrega:',temp.FechcaEntrega);
			writeln ('solicitud no. ',i);
			Sleep(550);
			
		end;
		sleep(300);

    close(arcServicio);


end.
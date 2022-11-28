SubProceso INSERCION_MATRIZ(matriz,n,ccolumnas,corden,aux)
	Definir p,u,c,j,i Como Entero
	p=1
	u=n-1
	mientras p<=u
		c=trunc((p+u)/2)
		si matriz(n,corden)>matriz(c,corden)
			p=c+1
		SiNo
			u=c-1
		FinSi
	FinMientras
	// p tiene la posicion donde hay que insertar la fila (N)
	si p<>n Entonces
		para j=1 hasta ccolumnas con paso 1 Hacer
			aux(j) = matriz(n,J)
		FinPara
		para i=n-1 Hasta p Con Paso -1 Hacer
			para j=1 hasta ccolumnas con paso 1 Hacer
				matriz(i+1,j) = matriz(i,J)
			FinPara
		FinPara
		para j=1 hasta ccolumnas con paso 1 Hacer
			matriz(p,J) = aux(j) 
		FinPara
	FinSi
FinSubProceso


SubProceso BURBUJA_MATRIZ(matriz,n,ccolumnas,corden,aux)
	definir i,j,c, ordenado como entero
	para i=1 Hasta n-1 Con Paso 1 Hacer
		ordenado=1  //por defecto tomo como ordenado
		para j=1 Hasta n-i Con Paso 1
			si Matriz(j,corden)>Matriz(j+1,corden)
				para c=1 Hasta ccolumnas Con Paso 1 Hacer
					aux=matriz(j,c)
					matriz(j,c)=matriz(j+1,c)
					matriz(j+1,c)=aux
				FinPara
				ordenado=0 // no esta ordenado
			FinSi
		FinPara
		si ordenado=1
			i=n    // break
		FinSi
	FinPara
FinSubProceso


SubProceso  posicion=BUSQUEDA_S_M(matriz,n,cbusqueda,valorabuscar) 
	definir posicion, i Como Entero
	posicion=0
	para i=1 hasta n Con Paso 1 Hacer
		si matriz(i,cbusqueda)=valorabuscar
			posicion=i
			i=n    // break
		FinSi
	FinPara
FinSubProceso


SubProceso  texto_retorno = ALINEAR(un_texto,cantidad,tipo)
	// ALINEAR recibe como parámetros un texto, la cantidad de caracteres 
	// del ancho con que tiene que devolver el texto y  la opción que se 
	// selecciona para la alineación (D-derecha I -Izquierda C -Centrado) 
	// Retorna el texto alineado dependiendo de la opción seleccionada 
	// y con el ancho del parametro CANTIDAD
	Definir texto_retorno Como Caracter
	definir cant_espacios,espacios_izquierda, espacios_derecha Como Entero
	tipo=Mayusculas(tipo)
	cant_espacios = cantidad - Longitud(un_texto)
	espacios_derecha=0
	espacios_izquierda=0
	Segun  tipo Hacer
		"I": espacios_derecha= cant_espacios
		"D": espacios_izquierda = cant_espacios
		"C": espacios_derecha=  trunc(cant_espacios/2)
			espacios_izquierda = cant_espacios - espacios_derecha
	FinSegun
	texto_retorno = REPITE(" ",espacios_izquierda) + un_texto + REPITE(" ",espacios_derecha) 
FinSubProceso

SubProceso  texto_retorno = ALINEARN(un_numero,cantidad,tipo)
	Definir texto_retorno Como Caracter
	texto_retorno =  ALINEAR(ConvertirATexto(un_numero),cantidad,tipo)
FinSubProceso

SubProceso texto_repetido=REPITE(un_texto,cantidad)
	definir texto_repetido Como Caracter
	definir contador Como Entero
	texto_repetido=""
	para contador=1 Hasta cantidad Con Paso 1 Hacer
		texto_repetido = texto_repetido + un_texto
	FinPara
FinSubProceso

SubAlgoritmo resultado = validarTipoBateria(tipo)
	definir resultado Como Logico
	resultado = (tipo >= 1 y tipo <= 3)
FinSubAlgoritmo

SubAlgoritmo porcentaje = importePorcentajeBateria(tipo)
	definir porcentaje Como entero
	porcentaje = 0
	
	segun tipo
		caso 1:
			porcentaje = 5
		caso 2:
			porcentaje = 20
		caso 3:
			porcentaje = 30
	FinSegun
	
FinSubAlgoritmo

Algoritmo sin_titulo
	definir MAX_VEHICULOS Como Entero
	definir i como entero
	definir vehiculosInfo Como Entero
	
	escribir "Ingresa la cantidad de vehiculos"
	leer MAX_VEHICULOS
	
	dimension vehiculosInfo[MAX_VEHICULOS, 2]
	
	definir matriz_auxiliar como entero
	dimension matriz_auxiliar[2]
	
	definir codigo_ingresar como entero
	
	
	// VENTAS
	
	definir ventasInfo, MAX_VENTAS Como Entero
	definir ventasInfoC Como Caracter
	
	escribir "Cantidad maxima de ventas:"
	leer MAX_VENTAS
	
	dimension ventasInfo[MAX_VENTAS, 8]
	dimension ventasInfoC[MAX_VENTAS, 2]
	
	definir numero_cliente, numero_chasis, codigo_vehiculo, valor_vehiculo, tipo_bateria, importe_bateria, importe_total, v_id  como entero
	numero_cliente = 1
	numero_chasis = 2
	codigo_vehiculo = 3
	valor_vehiculo = 4
	tipo_bateria = 5
	importe_bateria = 6
	importe_total = 7
	v_id = 8

	
	//
	
	para i = 1 hasta MAX_VEHICULOS
		escribir "Vehículo #",i,":"
		Repetir
			escribir "Ingresa el codigo del vehículo: "
			leer codigo_ingresar
		Hasta Que BUSQUEDA_S_M(vehiculosInfo, MAX_VEHICULOS, 1, codigo_ingresar) == 0 y codigo_ingresar > 0
		vehiculosInfo[i, 1] = codigo_ingresar

		Repetir
			escribir "Ingresa el valor del vehículo: "
			leer vehiculosInfo[i, 2]			
		Hasta Que vehiculosInfo[i, 2] > 0
		INSERCION_MATRIZ(vehiculosInfo, i, 2, 1, matriz_auxiliar)
	FinPara
	
	definir codigo como entero
	definir vehiculo_encontrado como entero
	
	definir clientes_auxiliar Como Entero
	clientes_auxiliar = 0
	
	escribir "------------ CARGADO DE VENTAS ---------------"
	
	para i = 1 hasta MAX_VENTAS
		escribir "Ingresa el NUMERO de cliente: "
		leer ventasInfo[i, numero_cliente]
		
		escribir "Ingresa el NOMBRE del cliente: "
		leer ventasInfoC[i, 1]
		ventasInfoC[i, 2] = ConvertirATexto(i)
		
		escribir "Ingresa el NUMERO DE CHASIS:"
		leer ventasInfo[i, numero_chasis]
		
		Repetir
			escribir "Ingresa el codigo del vehículo:"
			leer codigo
			vehiculo_encontrado = BUSQUEDA_S_M(vehiculosInfo, MAX_VEHICULOS, 1, codigo)
			si(vehiculo_encontrado) == 0
				escribir "NO SE ENCONTRÓ ESE VEHÍCULO"
			FinSi
		hasta que vehiculo_encontrado <> 0
		
		ventasInfo[i, codigo_vehiculo] = codigo
		ventasInfo[i, valor_vehiculo] = vehiculosInfo[vehiculo_encontrado, 2]
		
		Repetir
			Escribir "Ingresa el tipo de bateria [1-3]: "
			leer ventasInfo[i, tipo_bateria]
		Hasta Que validarTipoBateria(ventasInfo[i, tipo_bateria])
		
		
		ventasInfo[i, importe_bateria] = redon((ventasInfo[i, valor_vehiculo] * importePorcentajeBateria(ventasInfo[i, tipo_bateria])) / 100)
		
		ventasInfo[i, importe_total] = ventasInfo[i, valor_vehiculo] + ventasInfo[i, importe_bateria]
		
		ventasInfo[i, v_id] = i
		
	FinPara
	
	escribir "Ventas ordenadas"
	
	BURBUJA_MATRIZ(ventasInfo, MAX_VENTAS, 8, importe_total, clientes_auxiliar)
	
	
	escribir ALINEAR("N cliente", 15, "C") " | " sin saltar
	escribir ALINEAR("Nombre", 15, "C") " | " sin saltar
	escribir ALINEAR("N chasis", 15, "C") " | " sin saltar
	escribir ALINEAR("N vehiculo", 15, "C") " | " sin saltar
	escribir ALINEAR("V vehiculo", 15, "C") " | " sin saltar
	escribir ALINEAR("Tipo bateria", 15, "C") " | " sin saltar
	escribir ALINEAR("importe bateria", 15, "C") " | " sin saltar
	escribir ALINEAR("Importe total", 15, "C") " | " sin saltar
	escribir ""
	
	para i = 1 hasta MAX_VENTAS
		escribir ALINEARN(ventasInfo[i, numero_cliente], 15, "C") " | " sin saltar
		escribir ALINEAR(ventasInfoC[ventasInfo[i, v_id], 1], 15, "C") " | " sin saltar
		escribir ALINEARN(ventasInfo[i, numero_chasis], 15, "C") " | " sin saltar
		escribir ALINEARN(ventasInfo[i, codigo_vehiculo], 15, "C") " | " sin saltar
		escribir ALINEARN(ventasInfo[i, valor_vehiculo], 15, "C") " | " sin saltar
		escribir ALINEARN(ventasInfo[i, tipo_bateria], 15, "C") " | " sin saltar
		escribir ALINEARN(ventasInfo[i, importe_bateria], 15, "C") " | " sin saltar
		escribir ALINEARN(ventasInfo[i, importe_total], 15, "C") " | "
	FinPara
	
	definir b_chasis, index Como Entero
	b_chasis = 1
	
	Repetir
		escribir "Ingresa el numero de chasis para buscar: "
		leer b_chasis
		si(b_chasis <> 0)
		
			index = BUSQUEDA_S_M(ventasInfo, MAX_VENTAS, numero_chasis, b_chasis) 
			si(index == 0)
				escribir "No existe este nro. de chasis."
			SiNo
				escribir ALINEAR("N cliente", 15, "C") " | " sin saltar
				escribir ALINEAR("Nombre", 15, "C") " | " sin saltar
				escribir ALINEAR("Valor vehiculo", 15, "C") " | " sin saltar
				escribir ALINEAR("Valor bateria", 15, "C") " | " sin saltar
				escribir ALINEAR("Importe total", 15, "C") " | "
				
				escribir ALINEARN(ventasInfo[index, numero_cliente], 15, "C") " | " sin saltar
				escribir ALINEAR(ventasInfoC[ventasInfo[index, v_id], 1], 15, "C") " | " sin saltar
				escribir ALINEARN(ventasInfo[index, valor_vehiculo], 15, "C") " | " sin saltar
				escribir ALINEARN(ventasInfo[index, importe_bateria], 15, "C") " | " sin saltar
				escribir ALINEARN(ventasInfo[index, importe_total], 15, "C") " | "
				
			FinSi
		SiNo
			escribir "CERRANDO PROGRAMA..."
		FinSi
	Hasta Que b_chasis == 0
	
FinAlgoritmo

# Single Cycle Processor

## Objetivo de Diseño
- Comprender los requerimientos de una versión reducida de la arquitectura MIPS de 32 bits
para realizar una implementación en forma de procesador monociclo (ruta de datos y unidad
de control). 
- Codificar, ensamblar y simular un programa de prueba para verificar el comportamiento
correcto del procesador. 
- Emplear herramientas de software para el diseño y la simulación de computadores digitales.

El procesador debe estar en capacidad de ejecutar las siguientes instrucciones: load word ```lw```,
store word ```sw```, ```add```, ```sub```, ```and```, ```or```, ```nor```, set-on-less-than ```slt``` , branch if equal ```beq``` , jump ```j``` ,
jump-and-link ```jal``` y jump-register ```jr```.

![Single Cycle Schematics](https://raw.githubusercontent.com/antorpo/MIPS_Processor_Monocycle/master/cpu.png)

## Circuito Implementado
![Logisim Circuit](https://raw.githubusercontent.com/antorpo/MIPS_Single_Cycle_Processor/master/circuito.png)

Los archivos que cargan las instrucciones del problema a resolver son respectivamente **_rom_** (posee las instrucciones) y 
**_ram_** (posee los datos).

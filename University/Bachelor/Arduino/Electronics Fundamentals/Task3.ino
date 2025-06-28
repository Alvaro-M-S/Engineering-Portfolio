int displayPin[7] = { A2, 10, 8, 4, 7, A3, 12 };

int t;
int td;
int a0;
int a1; 

void setup()
{
  	pinMode(13, OUTPUT);
	for(int i = 0; i < 7; i++) { 
 		pinMode(displayPin[i], OUTPUT); 
    } 
}

void writeDisplay(char val, int digit) {

  for(int i = 0; i < 7; i++) {
    digitalWrite(displayPin[i], LOW); }
    if (digit == 0) {
      digitalWrite(13, LOW); 
    }
      else {digitalWrite(13, HIGH);
      }
      
  char segments = 0;
  
  switch (val) {
    case '0': segments = 0b01111110; break;
    case '1': segments = 0b00110000; break;
    case '2': segments = 0b01101101; break;
    case '3': segments = 0b01111001; break;
    case '4': segments = 0b00110011; break;
    case '5': segments = 0b01011011; break;
    case '6': segments = 0b01011111; break;
    case '7': segments = 0b01110000; break;
    case '8': segments = 0b01111111; break;
    case '9': segments = 0b01111011; break;
    case 'a': segments = 0b01111111; break;
    case 'b': segments = 0b00000000; break;
    default : segments = 0b00000001;}
    
  char currSegment = 0b01000000;
  
    for(int i = 0; i < 7; i++) {  
      if ((currSegment & segments) != 0) {
        digitalWrite(displayPin[i], HIGH); 
      }
        currSegment = currSegment >> 1; 
    }
}

void loop()
{ t = millis()/1000; //Tiempo en s
 
  td = 100 - t; //Tiempo decreciente
 
 a1=(td / 10); //Primera cifra, 1 - se activa la decena(cociente)
 
 a0=(td % 10);  //Segunda cifra, 0 - se activa la unidad(resto división)
 
 if((td >= 0) && (td < 100)){ //Se cumplan ambas condiciones, intervalo pedido
                              //AND lógico
   writeDisplay(a1+48,1);  
   writeDisplay(a0+48,0);
// + 48 para pasar int a char según la tabla ASCII
   
 } else{ 
//Si no esta entre el tiempo del enunciado, que aparezca 00
   writeDisplay('0',1);
   writeDisplay('0',0);
 }
 
}

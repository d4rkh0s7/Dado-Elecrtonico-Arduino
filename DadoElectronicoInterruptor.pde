/** analogRead() sensor de conductividad **

/** Display 7 segmentos **/

//      1
//    =====
//  ||     ||
// 6||     ||2
//  ||  7  ||
//    =====
//  ||     ||
// 5||     ||3
//  ||     ||
//    =====
//      4


#define espera 4000


void off()
{
  int i;
  for(i=1;i<8;i++)
  {
    digitalWrite(i,LOW);   
  }
}


void uno()
{
   digitalWrite(2,HIGH);
   digitalWrite(3,HIGH);
   delay(espera);
   off();
}

void dos()
{
   digitalWrite(1,HIGH);
   digitalWrite(2,HIGH);
   digitalWrite(6,HIGH);
   digitalWrite(5,HIGH);
   digitalWrite(4,HIGH);
   delay(espera);
   off();
}

void tres()
{
   digitalWrite(1,HIGH);
   digitalWrite(2,HIGH);
   digitalWrite(6,HIGH);
   digitalWrite(3,HIGH);
   digitalWrite(4,HIGH);
   delay(espera);
   off();
}

void cuatro()
{
   digitalWrite(6,HIGH);
   digitalWrite(7,HIGH);
   digitalWrite(2,HIGH);
   digitalWrite(3,HIGH);
   delay(espera);
   off();
}

void cinco()
{
   digitalWrite(1,HIGH);
   digitalWrite(6,HIGH);
   digitalWrite(7,HIGH);
   digitalWrite(3,HIGH);
   digitalWrite(4,HIGH);
   delay(espera);
   off();
}

void seis()
{
   digitalWrite(1,HIGH);
   digitalWrite(6,HIGH);
   digitalWrite(7,HIGH);
   digitalWrite(3,HIGH);
   digitalWrite(4,HIGH);
   digitalWrite(5,HIGH);
   delay(espera);
   off();
}

void siete()
{
   digitalWrite(1,HIGH);
   digitalWrite(2,HIGH);
   digitalWrite(3,HIGH);
   delay(espera);
   off();
}

void ocho()
{
   digitalWrite(1,HIGH);
   digitalWrite(2,HIGH);
   digitalWrite(3,HIGH);
   digitalWrite(4,HIGH);
   digitalWrite(5,HIGH);
   digitalWrite(6,HIGH);
   digitalWrite(7,HIGH);
   delay(espera);
   off();
}

void nueve()
{
   digitalWrite(1,HIGH);
   digitalWrite(2,HIGH);
   digitalWrite(3,HIGH);
   digitalWrite(7,HIGH);
   digitalWrite(6,HIGH);
   delay(espera);
   off();
}

void cero()
{
   digitalWrite(1,HIGH);
   digitalWrite(2,HIGH);
   digitalWrite(3,HIGH);
   digitalWrite(4,HIGH);
   digitalWrite(5,HIGH);
   digitalWrite(7,HIGH);
   delay(espera);
   off();
}

/*
void vuelta()
{
   int v; //Velocidad
   v=80;
   off();
   int i;
   for(i=1;i<6;i++)
   {
   digitalWrite(i,HIGH);
   delay(v);
   off();
   }
   digitalWrite(7,HIGH);
   delay(v);
   off();
}

*/

void setup()
{
  int i;
  for(i=1;i<8;i++)
  {
   pinMode(i, OUTPUT);
  }
   pinMode(13, INPUT); //Sensor   

}


void loop()
{
  int n;
  
  int estado=0; //Estado de encendido o apagado 1 encendido 0 apagado
  while(true)
  {
    if(estado==1) // Sin esta condicion podria funcionar el dado aunque este el modo espera apagado
    {
      n=random(1,6);
      switch(n) {
         case 1:
           uno();
           break;      
         case 2:
           dos();
           break;
         case 3:
           tres();
           break; 
         case 4:
           cuatro();
           break;
         case 5:
           cinco();
           break;
         case 6:
           seis();
           break;
       }
     }
     while(digitalRead(13)==LOW)
     {
       if(estado==1)
         vuelta();
       /*** Apagado ***/
         //Cambio de estado
         if(digitalRead(11)==HIGH)
         {
           delay(1000); // Tiempo de espera para que al pulsar no pulse varias veces 
            if(estado==1)
            {
               estado=0;
            }else
            {
               estado=1; 
            }
         }
         // Fin de cambio de estado
       /*** Fin apagado ***/
     }
  } 
}

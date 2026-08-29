#line 1 "D:/last/traffic.c"
int counter;
int tens, units;
int manual;
int currentStreet;
int oldStreetButton;


void interrupt() {
 if (INTF_bit == 1) {

 INTF_bit = 0;

 manual = !manual;
 }
}

void show_west(int number) {
 tens = number / 10;
 units = number % 10;
 PORTB = (PORTB & 0xF0) | ((tens & 0x0F)<<1);
 PORTC = (PORTC & 0xF0) | (units & 0x0F);
}

void show_south(int number) {
 tens = number / 10;
 units = number % 10;
 PORTD = (tens & 0x0F) |
 ((units & 0x0F) << 4);

}

void west_green() {
 PORTD.B4 = 0;
 PORTD.B5 = 0;
 PORTD.B6 = 1;

 PORTD.B0 = 1;
 PORTD.B1 = 0;
 PORTD.B2 = 0;

}

void west_yellow() {
 PORTD.B4 = 0;
 PORTD.B5 = 1;
 PORTD.B6 = 0;

 PORTD.B0 = 1;
 PORTD.B1 = 0;
 PORTD.B2 = 0;

}



void south_green() {
 PORTD.B4 = 1;
 PORTD.B5 = 0;
 PORTD.B6 = 0;

 PORTD.B0 = 0;
 PORTD.B1 = 0;
 PORTD.B2 = 1;

}

void south_yellow() {
 PORTD.B4 = 1;
 PORTD.B5 = 0;
 PORTD.B6 = 0;

 PORTD.B0 = 0;
 PORTD.B1 = 1;
 PORTD.B2 = 0;

}



void west_to_south() {

 west_yellow();


 show_west(3);
 show_south(3);
 Delay_ms(1000);

 if (manual == 0)
 return;
 west_yellow();

 show_west(2);
 show_south(2);
 Delay_ms(1000);

 if(manual == 0)
 return;
 west_yellow();

 show_west(1);
 show_south(1);
 Delay_ms(1000);

 if(manual == 0)
 return;
 show_west(0);
 show_south(0);
 south_green();
 currentStreet = 0;

}

void south_to_west() {

 south_yellow();
 show_west(3);
 show_south(3);
 Delay_ms(1000);
 if (manual == 0)
 return;
 south_yellow();
 show_west(2);
 show_south(2);
 Delay_ms(1000);
 if (manual == 0)
 return;
 south_yellow();
 show_west(1);
 show_south(1);
 west_green();
 currentStreet = 1;
}

void manual_mode() {
 show_west(0);
 show_south(0);
 oldStreetButton = PORTE.B0;
 while (manual == 1) {
 if (oldStreetButton == 1 && PORTE.B0 == 0) {
 if (currentStreet == 1) {
 west_to_south();
 } else {
 south_to_west();
 }
 while (PORTE.B0 == 0){
 Delay_ms(10);
 if(manual == 0)
 return;
 }
 oldStreetButton = 1;
 }

 oldStreetButton = PORTE.B0;
 Delay_ms(10);

 }
 }
void main() {
 ADCON1 = 6;
 GIE_bit = 1;
 INTE_bit = 1;
 INTEDG_bit = 1;
 INTF_bit = 0;

 TRISA = 0;
 TRISB = 0b00000001;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0b00000001;

 PORTA = 0;
 PORTB = 0;
 PORTC = 0;
 PORTD = 0;
 PORTE = 0;

 PORTA.B3 = 1;
 PORTB.B5 = 1;
 PORTB.B6 = 1;
 PORTB.B7 = 1;

 manual = 0;
 currentStreet = 1;

 while (1) {
 if (manual == 0) {
 currentStreet = 1;
 for (counter = 20; counter >= 1; counter--) {
 west_green();
 show_west(counter);
 show_south(counter + 3);
 Delay_ms(1000);
 if (manual == 1)
 break;
 }
 }
 if (manual == 0) {
 currentStreet = 1;

 for (counter = 3; counter >= 1; counter--) {
 west_yellow();
 show_west(counter);
 show_south(counter);
 Delay_ms(1000);
 if (manual == 1)
 break;
 }
 }
 if (manual == 0)
 {
 currentStreet = 0;
 for (counter = 15; counter >= 4; counter--) {
 south_green();
 show_west(counter);
 show_south(counter - 3);
 Delay_ms(1000);
 if (manual == 1)
 break;
 }
 }
 if (manual == 0){

 currentStreet = 0;

 for (counter = 3; counter >= 1; counter--) {
 south_yellow();
 show_west(counter);
 show_south(counter);
 Delay_ms(1000);
 if (manual == 1){
 break;
 }
 }
 }

 else {
 manual_mode();
 }
 }
}

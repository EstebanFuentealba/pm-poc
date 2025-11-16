/* Ejemplo avanzado para Pokemon Mini
 * Este archivo muestra más funcionalidades.
 * Para usarlo, renómbralo a main.c
 */

#include "pm.h"
#include "print.h"
#include <stdint.h>

// Variables globales
volatile uint8_t counter = 0;
volatile uint8_t tick = 0;

int main(void)
{
  // Limpiar pantalla escribiendo espacios
  uint8_t i, j;
  for (i = 0; i < 96; i += 6) {
    for (j = 0; j < 64; j += 8) {
      printChar(i, j, ' ');
    }
  }
  
  // Título del juego
  print(12, 0, "POKEMON MINI");
  
  // Mensaje de bienvenida
  print(0, 16, "HOLA MUNDO!");
  
  // Instrucciones
  print(0, 32, "PRESIONA A");
  
  // Mostrar contador
  print(0, 48, "COUNT:");
  printDigit(36, 48, counter);
  
  // Loop infinito del juego
  while (1) {
    // Leer entrada de teclas
    if (KEY_PAD & KEY_A) {
      counter++;
      if (counter > 9) counter = 0;
      
      // Actualizar display
      printDigit(36, 48, counter);
      
      // Espera simple (anti-rebote)
      for (i = 0; i < 255; i++) {
        _slp();
      }
    }
    
    if (KEY_PAD & KEY_B) {
      counter = 0;
      printDigit(36, 48, counter);
      
      for (i = 0; i < 255; i++) {
        _slp();
      }
    }
    
    // Dormir para ahorrar batería
    _slp();
  }
  
  return 0;
}


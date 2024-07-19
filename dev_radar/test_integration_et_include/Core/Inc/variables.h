#ifndef __VARIABLES_H
#define __VARIABLES_H

#include <stdint.h>

#ifndef NB_RADAR_AVAILABLE
    #define NB_RADAR_AVAILABLE (5) // Ajuster selon vos besoins moi j'ai 2 radar
#endif

// Définir la taille du buffer, vous pouvez ajuster cette valeur selon vos besoins.
#define NB_RESULTAT_VOULUE 20


typedef struct {
	float  buffer[NB_RESULTAT_VOULUE];
	uint16_t nb_elt;
	uint8_t indice_r;
	uint8_t indice_W;
}buffer_circulaire;


extern buffer_circulaire buff_radar[NB_RADAR_AVAILABLE] ;
extern uint8_t flag_configuration ;
extern uint32_t radar_id ;
extern uint32_t skeep_initial ;
extern uint32_t skeep_final ;
extern uint8_t button_pressed ;
extern uint32_t button_press_time;
extern uint32_t press_duration ;



// fonction de sauter (skeep) si il y a un radar qui ne fonctionne pas de la boucle for ;
void skeep(uint8_t issue_with_this_radar);

// fonction pour l'initialisation de tout les buffers circulaire:
void buffer_init( void );

#endif /* __VARIABLES_H */


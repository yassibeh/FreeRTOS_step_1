


#include "variables.h"

uint8_t flag_configuration = 0;
uint32_t radar_id = 1 ;
uint32_t skeep_initial = 1;
uint32_t skeep_final = 2;

// declaration des radar selon le nombres de radar disponible :
buffer_circulaire buff_radar[NB_RADAR_AVAILABLE];

// definire ma fonction skeep :
void skeep(uint8_t issue_with_this_radar){
	if( issue_with_this_radar == 1 ) skeep_initial = 2 ;
	if( issue_with_this_radar == 2 ) skeep_final   = 1 ;
}


// definire ma fonction init buffer

void buffer_init( void ){

	for( uint8_t i = 0  ; i < NB_RADAR_AVAILABLE ; i++ ){
		buff_radar[i].nb_elt = 0;
		buff_radar[i].indice_r = NB_RESULTAT_VOULUE;
		buff_radar[i].indice_W = 0 ;
	}

}


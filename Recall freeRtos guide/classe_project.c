/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Description        : Code for freertos applications
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  *
  *
	osSemaphoreDef(semaphore_1);
				osSemaphoreId semaphore_1 ; //Semaphore ID

				semaphore_1 = osSemaphoreCreate(osSemaphore(semaphore_1), 1);
				osSemaphoreRelease(semaphore_1); //synchro avec la tache enregistrement
	osSemaphoreWait(semaphore_1, osWaitForever ); //synchronisation avec la tache asse
  *
  *
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include "MotorDriver.h"					// Pilote du moteur
#include "lsm6ds3.h"						// Pilote de la centrale inertielle
#include "mesn_uart.h"						// Pilote de la liaison UART
#include "libSBR_autom_obs-corr.h"			// Algo observateur et correcteur
#include "MeSN_i2c.h"

#include "stdlib.h"
#include "string.h"
/* USER CODE END Includes */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
#define BUFFERSIZE 	100
/* USER CODE END PM */


/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
typedef struct {
	int32_t  buffer[BUFFERSIZE];
	uint8_t nb_elt;
	uint8_t indice_r;
	uint8_t indice_W;
}buffer_circulaire;

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */


/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */
volatile buffer_circulaire Buffer_enregistre;

/* USER CODE END Variables */
osThreadId defaultTaskHandle;
osThreadId T_ASSERV_handle ;
osThreadId T_ENREG_handle ;
osThreadId T_UART_handle ;


osMutexId mutex_buffer;
osMutexDef(mutex_buffer);

osMessageQDef(mailbox_ang,	200 , uint32_t);
osMessageQId mailbox_ang ;

osMessageQDef(mailbox_stream,1, int32_t);
osMessageQId mailbox_stream ;



//osMutexRelease(mutex_uart);
//osMutexWait(mutex_uart, osWaitForever);

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */

/* USER CODE END FunctionPrototypes */

void StartDefaultTask(void const * argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */


// prototypes de mes taches :
void tache_asservissement(void const * argument);
void tache_enregistrement(void const * argument);
void tache_uart(void const * argument);

/* Hook prototypes */
void vApplicationStackOverflowHook(xTaskHandle xTask, signed char *pcTaskName);
void vApplicationMallocFailedHook(void);

/* USER CODE BEGIN 4 */
void vApplicationStackOverflowHook(xTaskHandle xTask, signed char *pcTaskName)
{
   /* Run time stack overflow checking is performed if
   configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2. This hook function is
   called if a stack overflow is detected. */
	MESN_UART_PutString_Poll((uint8_t*)"\r\nERROR : stack overflow from task");
	MESN_UART_PutString_Poll((uint8_t*)pcTaskName);
	while(1);
}
/* USER CODE END 4 */

/* USER CODE BEGIN 5 */
void vApplicationMallocFailedHook(void)
{
   /* vApplicationMallocFailedHook() will only be called if
   configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h. It is a hook
   function that will get called if a call to pvPortMalloc() fails.
   pvPortMalloc() is called internally by the kernel whenever a task, queue,
   timer or semaphore is created. It is also called by various parts of the
   demo application. If heap_1.c or heap_2.c are used, then the size of the
   heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
   FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
   to query the size of free heap space that remains (although it does not
   provide information on how the remaining heap might be fragmented). */
	MESN_UART_PutString_Poll((uint8_t*)"\r\nERROR : Heap full!");
	while(1);
}
/* USER CODE END 5 */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */
	 /* Initialisation buffer circulaire */
  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
	mutex_buffer = osMutexCreate(osMutex(mutex_buffer));
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */

  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */

	//pour la tache enregistrement :
	mailbox_ang = osMessageCreate(osMessageQ(mailbox_ang), NULL);

	//pour la tache uart
	mailbox_stream = osMessageCreate(osMessageQ(mailbox_stream), NULL);


  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* definition and creation of defaultTask */
	osThreadDef(defaultTask, StartDefaultTask, osPriorityLow, 0, 256);
	defaultTaskHandle = osThreadCreate(osThread(defaultTask), NULL);

  	osThreadDef(tache_asserv,tache_asservissement,osPriorityHigh, 0,configMINIMAL_STACK_SIZE);
  	T_ASSERV_handle = osThreadCreate(osThread(tache_asserv), NULL);

  	osThreadDef(tache_enreg,tache_asservissement,osPriorityAboveNormal, 0,configMINIMAL_STACK_SIZE);
  	T_ENREG_handle = osThreadCreate(osThread(tache_enreg), NULL);

  	osThreadDef(tache_uart,tache_uart,osPriorityNormal, 0,configMINIMAL_STACK_SIZE);
  	T_UART_handle = osThreadCreate(osThread(tache_uart), NULL);


  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

}

/* USER CODE BEGIN Header_StartDefaultTask */
/**
  * @brief  Function implementing the defaultTask thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void const * argument)
{
  /* USER CODE BEGIN StartDefaultTask */
	uint8_t LSM6DS3_Res = 0;
	uint8_t tempString[100];

	/* Init des periphs externes */
	MotorDriver_Init();
	MESN_UART_Init();
	if(LSM6DS3_begin(&LSM6DS3_Res) != IMU_SUCCESS){
		MESN_UART_PutString_Poll((uint8_t*)"\r\nIMU Error !");
		while(1);
	}

	/* Test des periphs externes */
	sprintf((char*)tempString, "\r\nInit done. LSM6DS3 reg = %02x", LSM6DS3_Res);
	MESN_UART_PutString_Poll(tempString);
	MotorDriver_Move(200);

	/* Test algo autom */
	sprintf((char*)tempString, "\r\nAngle = %ldmDeg", autoAlgo_angleObs(50,5));
	MESN_UART_PutString_Poll(tempString);

  /* Infinite loop */
  for(;;)
  {
	MESN_UART_GetString(tempString,osWaitForever);
	MESN_UART_PutString_Poll(tempString);
	HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
  }
  /* USER CODE END StartDefaultTask */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

void tache_asservissement(void const * argument){

	uint32_t os_tick = 0;
	uint8_t LSM6DS3_Res = 0;
	int32_t acc_mg = 0  ;
	int32_t rot_ang_Deg = 0 ;
	int32_t ang = 0 ;

	int32_t v = 0 ;

	MotorDriver_Init();
	MESN_UART_Init();
	if(LSM6DS3_begin(&LSM6DS3_Res) != IMU_SUCCESS){
		MESN_UART_PutString_Poll((uint8_t*)"\r\nIMU Error !");
		while(1);
	}


	os_tick = osKernelSysTick(); //avoir la tick avant de commencer


	while(1){

			LSM6DS3_readMgAccelX(&acc_mg); // une technique special de passer en paramètre d'entrer la variable très utile lorsqu'on veut modifier plusieurs variable parcesque on peut retourner une seul variable

			LSM6DS3_readMdpsGyroY(&rot_ang_Deg); // pareil pour ang de rot

			ang = autoAlgo_angleObs(acc_mg,rot_ang_Deg);

			//une fois la valeur de l'angle est prete en la met dans notre boitre à lettre
			osMessagePut(mailbox_ang, ang, 0); // pour atche enregistrement
			osMessagePut(mailbox_stream, ang, 0); // pour la tache uart

			v = autoAlgo_commandLaw(ang,rot_ang_Deg);
			MotorDriver_Move(v);

		osDelayUntil(&os_tick, 10);
	}
}

void tache_enregistrement(void const * argument){


	uint8_t T = 0 ; // cette tache est synchro(doit etre synchro) avec T _asserve donc appeller chaque 10 ms si elle est en etat prete //pourcela uint8_t  max 255
	osEvent srt ;


	 // TODO  A revoire à propos de cette initialisation ??

	//init indice de lecture et  ecriture
	Buffer_enregistre.indice_W = 0 ;
	Buffer_enregistre.indice_r = Buffer_enregistre.nb_elt ;

	while(1){
		//wait for semaphore

		T++;		//	incrimentation  T chaque 10 ms car on est sychro avec Tache asservissement

		//Attendre Val ANG
		srt = osMessageGet(mailbox_ang, osWaitForever);

		// TODO MUTEX BUFFER ??
		osMutexWait(mutex_buffer, osWaitForever);
		if(srt.status == osEventMessage){
			// enregistrer la val de l'angle dans le buffer circulaire difinit global
			if(Buffer_enregistre.indice_W == 100 ) Buffer_enregistre.indice_W = 0 ;
			Buffer_enregistre.buffer[Buffer_enregistre.indice_W] = srt.value.v;
			Buffer_enregistre.indice_W ++;
			Buffer_enregistre.nb_elt ++ ;

		}

		if(Buffer_enregistre.buffer[Buffer_enregistre.indice_r] > abs(25)  ){
			Buffer_enregistre.indice_r -- ;
			HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);


		}else if(Buffer_enregistre.buffer[Buffer_enregistre.indice_r] < abs(25)  ){
			Buffer_enregistre.indice_r -- ;
			if(T == 10) HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);

		}
		// une fois on termine avec l'utilisation du buffer on relache notre ressource
		osMutexRelease(mutex_buffer);

		//cette doit etre 50 ms periodique donc T = 5 on deppase on reinitialise
		if(T == 5) T=0;


	}
}



void tache_uart(void const * argument){

	char CMD[20];
	char cmd_a_extraire[7]; // 7 char pour une raison spécifique : la commande la plus lente est de 6 char "stream"
	char affichage[25]; // pour affichage sur tera terme
	osEvent srt ;

	uint8_t i ;

	while(1){

		//reception par interruption donc une fois je recois la commande elle est sauvegarde dans le tableau appeller CMD
		MESN_UART_GetString((uint8_t *)CMD,HAL_MAX_DELAY);

		// maintenant  la partie purement que du language c TODO
		// comment je procède je prend mon tableau CMD j utilise sscanf pour extraire la commande
		// et pour comparer avec tout mes commande j'utilise la fct "strcmp()" dans bibli "string.c" pour camparer entre deux chaine de charactère :

		sscanf(CMD, "%6s", cmd_a_extraire); // extraire que 6 charachtère  je pourrai comparer CMD[0]......CMD[4] mais c'est plus comprimé comme ça :


		osMutexWait(mutex_buffer, osWaitForever); // je protège mon buffer
		if(strcmp(cmd_a_extraire,"read") == 0 ){
			sprintf(affichage,"\r\n %ld  mdeg", Buffer_enregistre.buffer[Buffer_enregistre.indice_r]);
			Buffer_enregistre.indice_r -- ;

			//Tera term :
			MESN_UART_PutString_Poll((uint8_t*) affichage);

		}else if(strcmp(cmd_a_extraire,"dump") == 0 ){
			for(i=0;i<100;i++){ // 0 à 100 = 100 fois 0 inclue
 				sprintf(affichage,"\r\n %ld  mdeg", Buffer_enregistre.buffer[Buffer_enregistre.indice_r]);
				Buffer_enregistre.indice_r -- ;
				//Tera term :
				MESN_UART_PutString_Poll((uint8_t*) affichage);
			}
		}else if(strcmp(cmd_a_extraire,"help") == 0 ){
			// TODO cette envoi va prendre bc de temps !! prendre en considération
			MESN_UART_PutString_Poll((uint8_t *) "\r\n read : retourne la dernière valeur de l'angle \r\n .dump : retourne les 100 dernières valeurs ");
			MESN_UART_PutString_Poll((uint8_t *) "\r\n .stream : retourne en continu la valeur de l'angle \r\n .help : affiche un menu d'aide avec les 4 commandes ");

		}
		osMutexRelease(mutex_buffer); // on relache notre buffer parceque c'est plus utilise

		if(strcmp(cmd_a_extraire,"stream") == 0 ){
			srt = osMessageGet(mailbox_stream, osWaitForever);
			sprintf(affichage,"\r %ld  mdeg", srt.value.v);
			MESN_UART_PutString_Poll((uint8_t *) affichage);
		}



	}
}

/* USER CODE END Application */

// fonction deja declarer dans unr aurte biblio comme _weak
//declaration _weak dans une bibli on peut coller directement ici

void vApplicationIdleHook(void){

	// il  faut surtout pas apeller une fct bloaquante !!!!!!!!!
	// Passer  la macro configUSE_IDLE_HOOK à 1
	MESN_UART_PutString_Poll((uint8_t * )" IDLE  "); // à modifier par une fonction mode vielle 
}

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
#include <stdio.h>

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
//TODO ...
#include "mesn_uart.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
void vApplicationStackOverflowHook( xTaskHandle xTask , signed char * pcTaskName );
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */

/* USER CODE END Variables */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */
void task1Fn(void const * argument);
void task2Fn(void const * argument);
void task3Fn(void const * argument);
/* USER CODE END FunctionPrototypes */

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
	//TODO:creer taches 1, 2 et 3
	//osThreadDef(TASK1, task1Fn, ..., 0, ...);
	//... = osThreadCreate (osThread(TASK1), NULL);
	osThreadDef(TACHE1,task1Fn,osPriorityNormal, 0,configMINIMAL_STACK_SIZE);
	osThreadCreate (osThread(TACHE1), NULL);
	osThreadDef(TACHE2,task2Fn,osPriorityLow, 0,configMINIMAL_STACK_SIZE);
	osThreadCreate (osThread(TACHE2), NULL);
	osThreadDef(TACHE3,task3Fn,osPriorityLow, 0,configMINIMAL_STACK_SIZE);
	osThreadCreate (osThread(TACHE3), NULL);
//nom de la fct sans ()


  /* USER CODE END RTOS_THREADS */

}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */
/* task1Fn function */
/*void task1Fn(void const * argument)
{
	uint32_t cycle = 0;
	uint32_t tick_actuelle = osKernelSysTick ;
	uint8_t  tab[20];
	sprintf(tab,"%lu",tick_actuelle);
	for(;;){
//		switch(cycle){
//			case 0 :
//				MESN_UART_PutString_Poll((uint8_t * )"\r\nTask1 MI");
//			case 1 :
//				MESN_UART_PutString_Poll((uint8_t*)"\r\nTask1 MI MI MI ");
//			case 2 :
//				MESN_UART_PutString_Poll((uint8_t * )"\r\nTask1 MI MI MI AND ONLY me me meme");
//		}

	// update cycle

	cycle ++;
	if(cycle == 3) cycle = 0 ;
	MESN_UART_PutString_Poll((uint8_t * )"\r\nTask1");
	MESN_UART_PutString_Poll((uint8_t * )tick_actuelle);


	// blocker la tache pendandt 300 ms
	osDelay(300);
	//osDelayUntil(&tick_actuelle, 300);

	}
}*/
/*void task1Fn(void const * argument)
{
	uint32_t cycle = 0;
	uint32_t tick_actuelle = osKernelSysTick() ;
	uint8_t  tab[50];
	sprintf(tab,"\r\n tick reveil = %ld",tick_actuelle);
	for(;;){
		switch(cycle){
			case 0 :
				MESN_UART_PutString_Poll((uint8_t * )"\r\nTask1 MI");
			case 1 :
				MESN_UART_PutString_Poll((uint8_t*)"\r\nTask1 MI MI MI ");
			case 2 :
				MESN_UART_PutString_Poll((uint8_t * )"\r\nTask1 MI MI MI AND ONLY me me meme");
		}

	// update cycle

	cycle ++;
	if(cycle == 3) cycle = 0 ;
	MESN_UART_PutString_Poll((uint8_t * )tab);
	//MESN_UART_PutString_Poll((uint8_t * )tick_actuelle);


	// blocker la tache pendandt 300 ms
	osDelay(500);

	//osDelayUntil(tick_actuelle, 300);

	}
}*/

void task1Fn(void const * argument)
{
	uint32_t tick_actuelle = 0;
	const uint8_t PER = 300 ;

	uint32_t cycle = 0;

	uint8_t  tab[50];
	sprintf(tab,"\r\n tick reveil = %ld",tick_actuelle);
	MESN_UART_PutString_Poll((uint8_t * )tab);
	for(;;){
		switch(cycle){
			case 0 :
				MESN_UART_PutString_Poll((uint8_t * )"\r\nTask1 **");
			case 1 :
				MESN_UART_PutString_Poll((uint8_t*)"\r\nTask1 ##### ");
			case 2 :
				MESN_UART_PutString_Poll((uint8_t *)"\r\nTask1 ###########");
		}

	// update cycle

	cycle ++;
	if(cycle == 3) cycle = 0 ;

	//MESN_UART_PutString_Poll((uint8_t * )tick_actuelle);


	// blocker la tache pendandt 300 ms
	vTaskDelayUntil( &tick_actuelle, PER );
	//growStack();
	//osDelayUntil(tick_actuelle, 300);

	}
}



/* task2Fn function */
void task2Fn(void const * argument)
{
	  /* Infinite loop */
		for(;;){
		// envoi d un message sur l UART
		MESN_UART_PutString_Poll((uint8_t*)"\r\nTask2 :  ");
		//osThreadYield();
		osDelay(100);
		}

}

/* task3Fn function */
void task3Fn(void const * argument)
{
	  /* Infinite loop */
		for(;;){
		// envoi d un message sur l UART
		MESN_UART_PutString_Poll((uint8_t * )"\r\nTask3 :  ");

		osDelay(100);

		}
}

/* USER CODE END Application */
uint32_t growStack ( void ) {
	volatile uint32_t lclVar ;
	osDelay (1) ;
	lclVar = growStack () ;
return lclVar ;
}

// fonction crocher de idle hook
void vApplicationIdleHook(void){
	MESN_UART_PutString_Poll((uint8_t * )" IDLE u choose ");
	// une restriction il ne faut surtout pas apeller une fct bloaquante !!!!!!!!!!!!!!!!!!!!!!!!!!
	// ecrire i

}

void vApplicationStackOverflowHook( xTaskHandle xTask , signed char * pcTaskName ) {
 /* Run time stack overflow checking is performed if
7 c o nf i g CH E C K _F O R _S T A C K_ O V ER F L O W is defined to 1 or 2. */

	MESN_UART_PutString_Poll(( uint8_t *) " \r\n ERROR : stack overflow by " );
	MESN_UART_PutString_Poll( pcTaskName ) ;

	while (1) ; // Should replace with a software mcu reset
 }

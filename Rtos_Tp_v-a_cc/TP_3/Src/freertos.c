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
//soit avec API  CMSIS :

osSemaphoreId semaphore_1 ; //Semaphore ID

//soit avec API freertos :
//	xSemaphoreHandle semaphore_1 ; //Semaphore ID

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
	osSemaphoreDef(semaphore_1);
	semaphore_1 = osSemaphoreCreate(osSemaphore(semaphore_1), 1);
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
void task1Fn(void const * argument){
	uint32_t tick_actuelle ;
	while(1){
		//500 ms periodcité
		tick_actuelle = (uint32_t) osKernelSysTick;



		MESN_UART_PutString_Poll((uint8_t * )"\r\nTask 1 : -semaphore given ");

		//Give semaphore avEC api cmsis
		osSemaphoreRelease(semaphore_1);

		osDelayUntil(&tick_actuelle, 500);
		//osDelay(500);
	}

}



/* task2Fn function */
void task2Fn(void const * argument)
{
	  /* Infinite loop */
	while(1){
		//wait for semaphore
		osSemaphoreWait(semaphore_1, osWaitForever );//HAL_MAX_DELAY

			MESN_UART_PutString_Poll((uint8_t * )"\r\nTask 2 : - sychro");
		}


}

/* task3Fn function */
void task3Fn(void const * argument)
{
	while(1){

		MESN_UART_PutString_Poll((uint8_t * )"\r\nTask 3 ### ");
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
	MESN_UART_PutString_Poll((uint8_t *)pcTaskName) ;

	while (1) ; // Should replace with a software mcu reset
 }

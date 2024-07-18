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

osMutexId  mutex_pr_uart ;
osMutexDef(mutex_pr_uart);

osMessageQDef(mailbox1,2,uint32_t);
osMessageQId mailbox1 ;

//soit avec API  CMSIS :

//osSemaphoreId semaphore_1 ; //Semaphore ID

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
	osMutexCreate(osMutex(mutex_pr_uart));
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
//	osSemaphoreDef(semaphore_1);
//	semaphore_1 = osSemaphoreCreate(osSemaphore(semaphore_1), 1);
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
	mailbox1 = osMessageCreate( osMessageQ(mailbox1), NULL);
  /* USER CODE END RTOS_QUEUES */

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
	//TODO:creer taches 1, 2 et 3
		//osThreadDef(TASK1, task1Fn, ..., 0, ...);
		//... = osThreadCreate (osThread(TASK1), NULL);
		osThreadDef(TACHE1,task1Fn,osPriorityHigh, 0,configMINIMAL_STACK_SIZE);
		osThreadCreate (osThread(TACHE1), NULL);
		osThreadDef(TACHE2,task2Fn,osPriorityNormal, 0,configMINIMAL_STACK_SIZE);
		osThreadCreate (osThread(TACHE2), NULL);
		osThreadDef(TACHE3,task3Fn,osPriorityNormal, 0,configMINIMAL_STACK_SIZE);
		osThreadCreate (osThread(TACHE3), NULL);
  /* USER CODE END RTOS_THREADS */

}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */
/* task1Fn function */
void task1Fn(void const * argument)
{
	uint32_t  tick_os_actuelle= 0 ;

 /* Infinite loop */
	while(1){
		tick_os_actuelle = (uint32_t) osKernelSysTick();



		MESN_UART_PutString_Poll((uint8_t *) "\r\n Task1 -- MsgSent ");
		//depot de ma tick dans le mail box
		osMessagePut(mailbox1, tick_os_actuelle, 0);

		osDelayUntil(&tick_os_actuelle, 500);
	}

}

/* task2Fn function */
void task2Fn(void const * argument)
{
	// def d'une structure qui contient tout les informations du mailbox
	osEvent srt ;
	uint32_t val_a_prendre = 0; // ou restorere le msg recue
	char tab[30];

	/* Infinite loop */
	 while(1){

		 //	prendre la dernière valeur du mailbox
		  srt = osMessageGet(mailbox1, 300);
		  if(srt.status == osEventMessage){
			  val_a_prendre = srt.value.v;
		  	  //send uart val du mailbox

		  	  sprintf(tab,"\r\nTask 2 : - MsRCieved : %ld ",val_a_prendre);

		  	  MESN_UART_PutString_Poll((uint8_t * ) tab);
		  }else if (srt.status == osEventTimeout ){
			  MESN_UART_PutString_Poll((uint8_t * ) "\r\n tache 2 - timeout" );
		  }


	 }
}


/* task3Fn function */
void task3Fn(void const * argument)
{

/* Infinite loop */
	 while(1){

		 MESN_UART_PutString_Poll((uint8_t * )" \r\n Task 3 ### ");
		 osDelay(100);
	 }
}

/* USER CODE END Application */
void vApplicationStackOverflowHook( xTaskHandle xTask , signed char * pcTaskName ) {
 /* Run time stack overflow checking is performed if
7 c o nf i g CH E C K _F O R _S T A C K_ O V ER F L O W is defined to 1 or 2. */

	MESN_UART_PutString_Poll(( uint8_t *) " \r\n ERROR : stack overflow by " );
	MESN_UART_PutString_Poll((uint8_t *)pcTaskName) ;

	while (1) ; // Should replace with a software mcu reset
 }

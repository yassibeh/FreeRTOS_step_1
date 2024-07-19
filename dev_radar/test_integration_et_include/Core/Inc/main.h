/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32h7xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define BOUTTON_Bleu_Pin GPIO_PIN_13
#define BOUTTON_Bleu_GPIO_Port GPIOC
#define BOUTTON_Bleu_EXTI_IRQn EXTI15_10_IRQn
#define SEN_INT5_Pin GPIO_PIN_0
#define SEN_INT5_GPIO_Port GPIOC
#define SEN_INT5_EXTI_IRQn EXTI0_IRQn
#define SEN_EN5_Pin GPIO_PIN_1
#define SEN_EN5_GPIO_Port GPIOC
#define SPI_SEL1_Pin GPIO_PIN_0
#define SPI_SEL1_GPIO_Port GPIOA
#define SPI_SEL2_Pin GPIO_PIN_1
#define SPI_SEL2_GPIO_Port GPIOA
#define SPI_SEL0_Pin GPIO_PIN_4
#define SPI_SEL0_GPIO_Port GPIOA
#define SEN_EN1_Pin GPIO_PIN_0
#define SEN_EN1_GPIO_Port GPIOB
#define SEN_INT3_Pin GPIO_PIN_10
#define SEN_INT3_GPIO_Port GPIOB
#define SEN_INT3_EXTI_IRQn EXTI15_10_IRQn
#define LED3_Pin GPIO_PIN_14
#define LED3_GPIO_Port GPIOB
#define SEN_INT2_Pin GPIO_PIN_8
#define SEN_INT2_GPIO_Port GPIOA
#define SEN_INT2_EXTI_IRQn EXTI9_5_IRQn
#define SEN_INT1_Pin GPIO_PIN_9
#define SEN_INT1_GPIO_Port GPIOA
#define SEN_INT1_EXTI_IRQn EXTI9_5_IRQn
#define SEN_EN4_Pin GPIO_PIN_10
#define SEN_EN4_GPIO_Port GPIOA
#define SPI_EN_Pin GPIO_PIN_12
#define SPI_EN_GPIO_Port GPIOG
#define SEN_EN3_Pin GPIO_PIN_3
#define SEN_EN3_GPIO_Port GPIOB
#define SEN_INT4_Pin GPIO_PIN_4
#define SEN_INT4_GPIO_Port GPIOB
#define SEN_INT4_EXTI_IRQn EXTI4_IRQn
#define SEN_EN2_Pin GPIO_PIN_5
#define SEN_EN2_GPIO_Port GPIOB
#define A121_SPI_SS_Pin GPIO_PIN_6
#define A121_SPI_SS_GPIO_Port GPIOB
#define LED2_Pin GPIO_PIN_1
#define LED2_GPIO_Port GPIOE

/* USER CODE BEGIN Private defines */
# define A121_SPI_HANDLE hspi1
/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

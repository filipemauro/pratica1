/********************************************//**

	@authors	Filipe Mauro
	@mainpage
	@brief
	@section 	intro_sec Introducao

	@section	lic_sec Licenca

	@sa

	@page conf Configuration bits
	@brief Os bits de configuracao estao setados no codigo, no arquivo #main. Essas configuracoes devem ser as seguites:

	@par WDTEN	@brief -	OFF
@warning - WatchDog desabilitado em hardware, mas sera habilitado em software.
	@par PLLDIV	@brief -	5
- Oscilador dividido por 5( Entrada de 20MHz )
	@par STVREN	@brief -	ON
- Reset no overflow/underflow da pilha habilitado.
	@par XINST	@brief -	OFF
- Set de intrucoes estendido desabilitado.
	@par CPUDIV	@brief -	OSC1
- WatchDog desabilitado em hardware, mas sera habilitado em software.
	@par CP0	@brief -	ON
- Memoria de progama esta protegida
	@par FOSC 	@brief - HSPLL
- PLL habilitado
	@par FCMEN  @brief - ON
- Reset por falha no oscilador habilitado
	@par IESO	@brief - OFF
- Startup em dois tempos desabilitados.
	@par WDTPS  @brief - 8192
@warning - WatchDog timer postcaler de 8192.
	@par CCP2MX	@brief - DEFAULT
- CCP2 Multiplexado com RC1.
	@par MSSPMSK	@brief - MSK7
- 7-Bit Address Masking mode enable.

	@file		main.c
	@defgroup 	Main Main
	@brief		Este modulo contem as funcoes main e de inicializacao do sistema
			  	@{

***********************************************/

/************************
	Include Files
************************/
#include <delays.h>
#include <p18cxxx.h>

/********************************************//**
	Configuration bits
************************************************/


/************************
	Macros & Constants
************************/
#define SemaforoB_green 1
#define SemaforoA_green 2
#define timeout 37
#define yellowTime 30
#define redTime 35
#define start 0
#define firstSemaforoVerde 		0b00000100
#define firstSemaforoAmarelo 	0b00000010
#define firstSemaforoVermelho 	0b00000001
#define secondSemaforoVerde 	0b00100000
#define secondSemaforoAmarelo 	0b00010000
#define secondSemaforoVermelho 	0b00001000




/********************************
	Global Variables
********************************/

/********************************
	Local Functions Prototype
********************************/
void main( void );


/********************************************//**

	@fn			void main( void )
	@brief		Arquivo principal do sistema. Resposavel por chamar todos os outros modulos.

 /*********************************************/
void main( void )
{
    unsigned char countLoop = start;
    unsigned char stateSemaforo;
    unsigned char firstSemaforo;
    unsigned char secondSemaforo;
    unsigned int countDelayLoop = start;
    TRISC = 0x00;
    firstSemaforo = firstSemaforoVermelho;
    secondSemaforo = secondSemaforoVerde;
    PORTC = firstSemaforo | secondSemaforo;
    stateSemaforo = SemaforoB_green;

    while( 1 )
    {
        switch( stateSemaforo )
        {
            //Espero 37 segundos para o estado do semafor de baixo mudar de verde para vermelho.
        case SemaforoB_green:

            // Espero 30 segundos para o estado do semaforo de baixo mudar para amarelo, enquanto o de cima esta no vermelho.
            if( countLoop==yellowTime )
            {
                secondSemaforo = secondSemaforoAmarelo;
            }

            // Espero 5 segundos no estado amarelo do semaforo de baixo para mudar para vermelho, enquanto o de cima esta no vermelho.
            if( countLoop==redTime )
            {
                secondSemaforo = secondSemaforoVermelho;
            }

            // Esperar 2 segundos em que os dois semaforos estao no estado vermelho.

            // Acabado o tempo ocorre a inversao dos estados: o semaforo de cima fica verde, enquanto o sinal de baixo esta no vermelho.
            if( countLoop==timeout )
            {
                firstSemaforo=firstSemaforoVerde;
            }

            PORTC = firstSemaforo | secondSemaforo;

            // Passou do tempo limite, ocorre a troca de caso.
            if( ++countLoop > timeout )
            {
                countLoop=start;
                stateSemaforo = SemaforoA_green;
            }

            //Bloco utilizado para contagem do tempo: aproximadamente 1s.
            for( countDelayLoop = start; countDelayLoop < 10000; countDelayLoop++ )
            {
                Delay10TCYx( 48 );
            }

            break;

            //Espero 37 segundos para o estado do semaforo de cima mudar de verde para vermelho.
        case SemaforoA_green:

            // Espero 30 segundos para o estado do semaforo de cima mudar para amarelo, enquanto o de baixo esta no vermelho.
            if( countLoop==yellowTime )
            {
                firstSemaforo = firstSemaforoAmarelo;
            }

            // Espero 5 segundos no estado amarelo do semaforo de cima para mudar para vermelho, enquanto o de baixo esta no vermelho.
            if( countLoop == redTime )
            {
                firstSemaforo = firstSemaforoVermelho;
            }

            // Esperar 2 segundos em que os dois semaforos estao no estado vermelho.

            // Acabado o tempo ocorre a inversao dos estados: o semaforo de baixo fica verde, enquanto o sinal de cima esta no vermelho.
            if( countLoop == timeout )
            {
                secondSemaforo=secondSemaforoVerde;
            }

            PORTC = firstSemaforo | secondSemaforo;

            // Passou do tempo limite, ocorre a troca de caso.
            if( ++countLoop > timeout )
            {
                countLoop=start;
                stateSemaforo = SemaforoB_green;
            }

            //Bloco utilizado para contagem do tempo: aproximadamente 1s.
            for( countDelayLoop = start; countDelayLoop < 10000; countDelayLoop++ )
            {
                Delay10TCYx( 48 );
            }

            break;
        }
    }
}

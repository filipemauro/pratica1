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
#define vermelho 1
#define verde 2
#define amarelo 3
#define timeout 30
#define yellowTime 25
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
    stateSemaforo = vermelho;

    while( 1 )
    {
        switch( stateSemaforo )
        {
            //No estado do sinal1 vermelho, aguardo 30 segundos antes de mudar o estado para verde.
            //No estado do sinal2 verde, aguardo 30 segundos para mudar o estado para amarelo.
        case vermelho:
            if( ( countLoop==yellowTime ) && ( firstSemaforo == firstSemaforoVermelho ) )
            {
                secondSemaforo = secondSemaforoAmarelo;
            }

            if( ( countLoop==yellowTime ) && ( secondSemaforo== secondSemaforoVermelho ) )
            {
                firstSemaforo = firstSemaforoAmarelo;
            }

            if( ( countLoop==timeout ) && ( firstSemaforo == firstSemaforoAmarelo ) )
            {
                firstSemaforo = firstSemaforoVermelho;
                secondSemaforo = secondSemaforoVerde;
            }

            if( ( countLoop==timeout ) && ( secondSemaforo == secondSemaforoAmarelo ) )
            {
                secondSemaforo = secondSemaforoVermelho;
                firstSemaforo = firstSemaforoVerde;
            }

            PORTC = firstSemaforo | secondSemaforo;

            if( ++countLoop > timeout )
            {
                countLoop=start;
                stateSemaforo = verde;
            }

            for( countDelayLoop = start; countDelayLoop < 10000; countDelayLoop++ )
            {
                Delay10TCYx( 48 );
            }

            break;

            //No estado do sinal verde, aguardo 30 segundos antes de mudar o estado do sinal para amarelo.
        case verde: //sinal aberto
            if( ( countLoop==yellowTime ) && ( firstSemaforo == firstSemaforoVermelho ) )
            {
                secondSemaforo = secondSemaforoAmarelo;
            }

            if( ( countLoop==yellowTime ) && ( secondSemaforo== secondSemaforoVermelho ) )
            {
                firstSemaforo = firstSemaforoAmarelo;
            }

            if( ( countLoop == timeout ) && ( firstSemaforo == firstSemaforoAmarelo ) )
            {
                firstSemaforo = firstSemaforoVermelho;
                secondSemaforo = secondSemaforoVerde;
            }

            if( ( countLoop==timeout ) && ( secondSemaforo == secondSemaforoAmarelo ) )
            {
                secondSemaforo = secondSemaforoVermelho;
                firstSemaforo = firstSemaforoVerde;
            }

            PORTC = firstSemaforo | secondSemaforo;

            if( ++countLoop > timeout )
            {
                countLoop=start;
                stateSemaforo = vermelho;
            }

            for( countDelayLoop = start; countDelayLoop < 10000; countDelayLoop++ )
            {
                Delay10TCYx( 48 );
            }

            break;
        }
    }
}
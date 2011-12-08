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
    unsigned char n = 0;
    unsigned char stateSemaforo = 0;
    unsigned int i = 0;
    TRISC = 0x00;
    PORTC=0x00;
    stateSemaforo = vermelho;

    while( 1 )
    {
        switch( stateSemaforo )
        {

		//No estado do sinal vermelho, aguardo 30 segundos antes de mudar o estado do sinal para verde.	
        case vermelho:
            if( ++n > 30 )
            {
                n=0;
                PORTC = 0b00000001;
                stateSemaforo = verde;
            }

            break;
		//No estado do sinal verde, aguardo 30 segundos antes de mudar o estado do sinal para amarelo.
        case verde: //sinal aberto
            if( ++n > 30 )
            {
                n = 0;
				//Estou acionando o amarelo porque o proximo estado será esse.
                PORTC = 0b000000100;
				stateSemaforo = amarelo;

            }
						
				
            break;

        case amarelo: //sinal amarelo
            if( ++n > 5 )
            {
                n=0;
				//Estou acionando o vermelho porque o proximo estado será esse.
                PORTC = 0b000000010;
                stateSemaforo = vermelho;
            }

            break;
        }

//O loop do meu código terá a duraçao de 1 segundo.
        for( i = 0; i < 10000; i++ )
        {
            Delay10TCYx( 48 );
        }
    }
}
/** @} */// end of group1
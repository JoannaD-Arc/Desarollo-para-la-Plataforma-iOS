//
//  vista_juego_gato.swift
//  Prueba_Hola_Mundo_02
//
//  Created by alumno on 2/11/26.
//

import SwiftUI


struct VistaJuegoGato: View {
    @State var nombre_del_jugador = ""
  

    
    var body: some View {
        VStack{
            Spacer()
            
            VStack{
                TextField("Introduce tu nombre", text: $nombre_del_jugador)}
                    .padding(20)
            }
        Spacer()

        
        Text("Juego del Gato")
        
        HStack{
            BotonTicTac()
            
            BotonTicTac()
            
            BotonTicTac()
        }
        
        HStack{
            BotonTicTac()
            
            BotonTicTac()
            
            BotonTicTac()
        }
        
        HStack{
            BotonTicTac()
            
            BotonTicTac()
            
            BotonTicTac()
        }
        Spacer()
    }
    
}

#Preview {
    VistaJuegoGato()
}

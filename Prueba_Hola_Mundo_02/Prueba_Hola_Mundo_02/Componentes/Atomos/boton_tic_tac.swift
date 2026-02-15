//
//  boton_tic_tac.swift
//  Prueba_Hola_Mundo_02
//
//  Created by alumno on 2/11/26.
//

import SwiftUI

struct BotonTicTac: View {
    @State var opcion_a_mostrar = 0

    
    
    let opciones = ["-","X", "O"]
    var body: some View {
        VStack{
 
            if opcion_a_mostrar == 0 {
                Text("-")
                    .background(Color.white)
                    .padding(10)
                    .cornerRadius(8)
            }
            else if opcion_a_mostrar == 1 {
                Text("X")
                    .background(Color.red)
                    .cornerRadius(8)
            }
            else if opcion_a_mostrar == 2 {
                Text("O")
                    .background(Color.yellow)
                    .padding(10)
                    .cornerRadius(8)
            }

        }
            .padding(7)
            .onTapGesture {
                opcion_a_mostrar += 1
                opcion_a_mostrar = opcion_a_mostrar % 3
            }
        }
       
}

#Preview {
    BotonTicTac()
}

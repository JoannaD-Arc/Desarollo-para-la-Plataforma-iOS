//
//  Prueba_Librerias.swift
//  Prueba_Hola_Mundo_02
//
//  Created by alumno on 2/13/26.
//

import SwiftUI
//Elementos de librería utilizados: Color Picker, Image, Section, VStack, ShareLink, EllipticalGradient, Date Picker, Text Field

struct Prueba_Librerias: View {
    @State var valor_color_picker = Color(.black)
    @State var url_para_compartir = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZg5lwymFOnKnrdFndeDTFfL-oVWuTYruEVw&s")!
    @State var texto_compartir_link = ""
    @State var fecha_guardada = Date()
    
    
    var body: some View {

        
        Section {
            Divider().padding()
            VStack{
                Text("Sección de Color Picker")
                    .padding(15)
                Image("ColorWheel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                    
                ColorPicker("Color Picker", selection: $valor_color_picker)
                        .padding(10)
                Text("Color guardado: \($valor_color_picker)") //Me dice que deprecated
                
            }
            
            Divider().padding()
            VStack{
                Text("Sección Compartir Imagen Gallo con Tenis")
                ShareLink(item: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZg5lwymFOnKnrdFndeDTFfL-oVWuTYruEVw&s")!)
                    .padding(15)
                TextField("Test Pegar Link", text: $texto_compartir_link) //se guarda en el clipboard
                
            }
            VStack{
            
                DatePicker(selection: $fecha_guardada, label: { Text("Guardar fecha") })
                Text("Fecha guardada \(fecha_guardada)")
            }
        } .background(EllipticalGradient(colors:[Color.red, Color.black], center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadiusFraction: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, endRadiusFraction: 2.5))
            .padding(10)
            

    }
 
    

}

#Preview {
    Prueba_Librerias()
}




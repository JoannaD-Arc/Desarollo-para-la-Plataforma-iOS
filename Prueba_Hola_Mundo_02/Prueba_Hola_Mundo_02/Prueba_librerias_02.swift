//
//  Prueba_librerias_02.swift
//  Prueba_Hola_Mundo_02
//
//  Created by Jose de la luz Olivares Gandara on 14/02/26.
//
import SwiftUI

//Cosas utilizadas: Button

struct Prueba_librerias_02: View {
    @State var numero_de_veces_presionado: Int = 0
    @State var color_guardado: Color = .white
    @State var fecha_guardada: Date = Date()
    @State var texto_a_editar_lista_conejos = ["Conejo Blanco", "Conejo Negro", "Conejito Café","Tortuga"]
    @State var url_gallo_con_tenis: URL = URL(string: "https://images7.memedroid.com/images/UPLOADED587/60209908b0a7c.jpeg")!
    @State var numero_ram_instalada: Float = 50
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 15){
                
                Text("Sección de Botón")
                    .font(.largeTitle)
                    .bold()
                Text("Presiona el botón")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                Button("Presióname") {
                    self.numero_de_veces_presionado += 1
                }
                Text("El botón ha sido presionado \(numero_de_veces_presionado) veces.")
            } .padding(10)
            
            Divider()
            
            VStack(alignment: .center, spacing: 15){
                
                Text("Sección de ColorPicker")
                    .font(.largeTitle)
                    .bold()
                Image("ColorWheel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                ColorPicker("Seleccionar Color", selection: $color_guardado)
                    .padding(30)
                    .bold()
                Text("Color seleccionado: \(color_guardado)")
                
            }.padding(10)
            
            Divider()
            
            VStack(alignment: .center, spacing: 15){
                Text("Sección de Date")
                    .font(.largeTitle)
                    .bold()
                    
                DatePicker(selection: $fecha_guardada, label: { Text("Selecciona una fecha:") })
                    .padding(20)
                Text("Fecha guardada: \(fecha_guardada)")
                    .font(.caption)
            }
            .padding(10)
            
            Divider()
            
            VStack(alignment: .center, spacing:15){
                Text("Sección Editar")
                    .font(.largeTitle)
                    .bold()
                NavigationView{
                    List{
                        ForEach(texto_a_editar_lista_conejos, id: \.self){ conejo in Text(conejo)
                        }
                        .onDelete {texto_a_editar_lista_conejos.remove(atOffsets: $0) }
                        .onMove {texto_a_editar_lista_conejos.move(fromOffsets: $0, toOffset: $1) }
                    }
                    .navigationTitle("Lista de Conejitos")
                    .toolbar{
                        EditButton()
                        Button("Añadir"){
                            texto_a_editar_lista_conejos.append("Nuevo conejito")
                        }
                    }
                }

            }
            Divider()
            
            VStack(alignment: .center, spacing: 15){
                Text("Sección Gallo con Tenis")
                    .font(.largeTitle)
                    .bold()
                AsyncImage(url: url_gallo_con_tenis) { phase in
                    switch phase {
                    case .empty:
                        Text("Cargando...")
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    case .failure:
                        Text("No cargó el gallo con tenis. UnU")
                        
                    @unknown default:
                        Text("Quien sabe que pasó")
                    }
                
                    ShareLink(item: url_gallo_con_tenis)
                    TextField("Pegar link aquí", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(20)
                }
            }
            Divider()
            
            VStack(alignment: .center, spacing: 15){
                Text("Sección Descargar RAM")
                    .font(.largeTitle)
                    .bold()
            
                Gauge(value: numero_ram_instalada, in: 0...124) {
                    Text("RAM Descargada")
                } .padding(10)
                
                Text("¿Cuánta RAM quieres?")
                Text("RAM Extra añadida: \(numero_ram_instalada)GB")
                Slider(value: $numero_ram_instalada, in: 0...124)
                    .padding(20)
            }.padding(10)
        }
        Divider()
        Text("Prueba_Libreria_02 por: Jane D'Arc")
    }
}

#Preview {
    Prueba_librerias_02()
}

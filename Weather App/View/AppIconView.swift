//
//  AppIconView.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 15/12/21.
//

import SwiftUI

struct AppIconView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var iconSettings : IconNames
    
    // Rounded rectangle button style
    
    struct PrimaryButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(5)
                .foregroundColor(configuration.isPressed ? Color.red.opacity(0.5) : .blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(configuration.isPressed ? Color.red.opacity(0.5) : .blue, lineWidth: 1.5)
                )
        }
    }
    
//    This is a fail
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker(selection: $iconSettings.currentIndex, label: Text("Icons")){
                    ForEach(0 ..< iconSettings.iconNames.count) { i in
                        HStack {
                            Text(self.iconSettings.iconNames[i] ?? "Basic")
                            Image(uiImage: UIImage(named: self.iconSettings.iconNames[i] ?? "AppIcon") ?? UIImage()).resizable().renderingMode(.original).frame(width: 50, height: 50, alignment: . leading)
                        }
                    }
                }.onReceive([self.iconSettings.currentIndex].publisher.first()) {
                    value in
                    
                    let i = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                    
                    if value != i {
                        UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value], completionHandler: {
                            error in
                            
                            if error != nil {
                                print("error")
                            } else {
                                print("finished")
                            }
                            
                        })
                    }
                }
            }
            .environmentObject(self.iconSettings)
            .navigationTitle("Choose Icon...")
            .navigationBarItems(trailing:
                                    Button("Done") {
                dismiss()
            }
//                                    .buttonStyle(PrimaryButtonStyle())
//                                    .font(.title)
                                    .padding()
                                //        .background(Color.gray)
            )
            
            
        }
    }
}


struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
    }
}

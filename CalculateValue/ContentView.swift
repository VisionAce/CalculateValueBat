//
//  ContentView.swift
//  CalculateValue
//
//  Created by 褚宣德 on 2023/10/12.
//

import SwiftUI

struct ContentView: View {
    @State private var n: Int = 1
    @FocusState private var holdView: Bool
    var result: String { calculate(n) }
    
    // 限制TextField中有效n值最小為1,且最大不超過ˊInt.maxˊ的值
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimum = .init(integerLiteral: 1)
        formatter.maximum = .init(integerLiteral: Int.max)
        formatter.generatesDecimalNumbers = false
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Text("1 + 2 - 3 + 4 - 5 + 6 ... - N + (N + 1) ... = ?")
                
                Section {
                    TextField("請輸入Ｎ值", value: $n, formatter: numberFormatter)
                        .keyboardType(.numberPad)
                        .focused($holdView)
                        .modifier(ClearButton(value: $n))
//                        .padding(.horizontal)
                } header: {
                    Text("當N = \(n)")
                        .font(.title2)
                        .foregroundStyle(.brown)
                }
                
                Section {
                    Text("\(result)")
                        .padding(.horizontal)
                } header: {
                    Text("結果:")
                        .font(.title2)
                        .foregroundStyle(.brown)
                }
                
                Text("說明：N的有效值為\n1 ~ \(Int.max)")
                    .foregroundStyle(.indigo)
            
            }
            .dismissKeyboard()
            .navigationTitle("第一題")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
              
                    Spacer()
                    Button("完成") {
                        holdView = false
                    }
                }
            }
        
        }
        
    }
    
    func calculate(_ n: Int) -> String {
        var result = 0
        if n == 1 {
            return "1"
        } else {
            if !(n.isMultiple(of: 2)) {
                result = (n / 2) * (-1) + 1
            } else {
                result = (n / 2) + 2
            }
            
        }
        return "\(result)"
    }
}

 

#Preview {
        ContentView()
    }

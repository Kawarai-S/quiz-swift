//
//  ContentView.swift
//  quiz0828
//


import SwiftUI

struct ContentView: View {
    let choice = ["カメ","うさぎ","うし","キリン"]
    let answer = "うし"
    @State var jugeImageName = "circlebadge"
    @State var judgeImageColor = Color.red
    @State var isShowJudgeImage = false
    var body: some View {
        ZStack{
            VStack {
                Text("第１問")
                    .font(.largeTitle)
                    .padding()
                Text("ぼうしの中に入っている動物はなに?")
                    .font(.title)
                    .padding()
                Spacer()
                ForEach(0..<choice.count, id: \.self){ num in
                    Button{
                        choiceButtonAction(selectAnswer: choice[num])
                    }label: {
                        Text(choice[num])
                            .padding()
                            .frame(width: UIScreen.main.bounds.width*0.9)
                            .background(.green)
                            .foregroundColor(.white)
                            .padding(5)
                    }
                }
                

            }
            .padding()
            if isShowJudgeImage {
                Image(systemName:jugeImageName)
                    .foregroundColor(judgeImageColor)
                    .font(.system(size: 400, weight: .bold))
            }
        }
    }
    func choiceButtonAction(selectAnswer: String){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            isShowJudgeImage = true
        }
        jugeImageName = selectAnswer == answer ? "circlebadge" : "multiply"
        judgeImageColor = selectAnswer == answer ? .red : .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isShowJudgeImage = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

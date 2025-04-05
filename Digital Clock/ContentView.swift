//
//  ContentView.swift
//  Digital Clock
//
//  Created by Takeshi Nishida on 2025/03/02.
//
//　このサンプルでは、タイマーを使ってデジタル時計を作成します。
//　タイマーは、1秒ごとに現在の時刻を取得し、画面に表示します。
//　また、タイマーの開始と停止をボタンで制御できるようにします。
//
// Swiftの技術としては、以下の点が学べます。
// 1. Timerを使った定期的な処理の実装
// 2. ボタンを使ったタイマーの制御
// 3. タイマーの状態を管理するためのプロパティの利用
// 4. デジタル時計の表示
//

import SwiftUI

struct ContentView: View {
    @State private var currentTime: String = ""
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text(currentTime)
                .font(.system(size: 48, weight: .bold, design: .monospaced))
                .padding()
            HStack {
                Button(action: startClock) {
                    Text("Start Timer")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Button(action: stopClock) {
                    Text("Stop Timer")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .onAppear(perform: startClock)
    }

    func startClock() {
        // 既にタイマーが動作している場合は新しいタイマーを設定しない
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                let formatter = DateFormatter()
                formatter.timeStyle = .medium // 例: "3:42:07 PM"
                currentTime = formatter.string(from: Date())
                print("Timer fired at \(Date())")
            }
        }
    }

    func stopClock() {
        timer?.invalidate()
        timer = nil
        print("Timer stopped")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}

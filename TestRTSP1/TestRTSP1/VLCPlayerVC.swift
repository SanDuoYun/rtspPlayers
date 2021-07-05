//
//  VLCPlayerVC.swift
//  TestRTSP1
//
//  Created by 巢云 on 2021/6/30.
//

import Foundation
import Stevia

class VLCPlayerVC: UIViewController {
    private var player: VLCMediaPlayer!
    private let inputTF = UITextField().placeholder("请输入RTSPURL")
    private let playView = UIView()
    private let playBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.sv(inputTF, playView, playBtn)
        view.layout(
            100,
            |-30-inputTF.height(50).centerHorizontally()-30-|,
            40,
            |-30-playView.height(300).centerHorizontally()-30-|,
            30,
            |-30-playBtn.height(50).centerHorizontally()-30-|,
            >=0
        )
        inputTF.backgroundColor = .lightGray
        playBtn.backgroundColor = .lightGray
        playBtn.setTitle("播放", for: .normal)
        playBtn.setTitleColor(.blue, for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnClick), for: .touchUpInside)
        
        playView.layoutIfNeeded()
        playView.backgroundColor = .gray
        
        player = VLCMediaPlayer.init(options: ["--rtsp-tcp", "--clock-synchro=0", "--network-caching=1000"])
      //  player = VLCMediaPlayer.init(options: [])
        player.drawable = playView
        loadData()
    }
    
    func loadData() {
        let url = URL(string: "https://172.16.0.10:18531/device/deviceList/v1.0?deviceType=2&fromIndex=1&toIndex=10")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    @objc func playBtnClick() {
        playBtn.isSelected = !playBtn.isSelected
        if playBtn.isSelected {
            playBtn.setTitle("停止", for: .normal)
            if let url = inputTF.text {
                if let url1 = URL.init(string: url) {
                    player.media = VLCMedia.init(url: url1)
                    player.play()
                }
            }
        } else {
            playBtn.setTitle("播放", for: .normal)
            player.stop()
        }
        
    }
}

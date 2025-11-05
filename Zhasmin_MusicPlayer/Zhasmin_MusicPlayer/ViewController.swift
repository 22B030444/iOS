//
//  ViewController.swift
//  Zhasmin_MusicPlayer
//
//  Created by Zhasmin Suleimenova on 05.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    private var tracks: [Track] = []
    private var currentTrackIndex = 0
    private var isPlaying = false
    private var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTracks()
        updateUI()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupTracks() {
        tracks = [Track(title: "Bohemian Rhapsody", artist: "Queen", coverImageName: "cover1", audioFileName: "song1"),
                  Track(title: "Another One Bites The Dust", artist: "Queen", coverImageName: "cover2", audioFileName: "song2"),
                  Track(title: "Under Pressure.mp3", artist: "Queen", coverImageName: "cover3", audioFileName: "song3"),
                  Track(title: "A Kind Of Magic", artist: "Queen", coverImageName: "cover4", audioFileName: "song4"),
                  Track(title: "Crazy Little Thing Called Love", artist: "Queen", coverImageName: "cover5", audioFileName: "song5"),
                  Track(title: "Love Of My Life", artist: "Queen", coverImageName: "cover6", audioFileName: "song6"),
                  Track(title: "Killer Queen", artist: "Queen", coverImageName: "cover7", audioFileName: "song7"),
                  Track(title: "The Show Must Go On", artist: "Queen", coverImageName: "cover8", audioFileName: "song8"),
                  Track(title: "Don't Stop Me Now", artist: "Queen", coverImageName: "cover9", audioFileName: "song9"),
                  Track(title: "Radio Ga Ga", artist: "Queen", coverImageName: "cover10", audioFileName: "song10")
              ]
    }
    
    private func setupUI(){
        coverImageView.layer.cornerRadius = 10
        coverImageView.clipsToBounds = true
    }
    
    private func updateUI(){
        let track = tracks[currentTrackIndex]
        coverImageView.image = UIImage(named: track.coverImageName)
        trackTitleLabel.text = track.title
        artistNameLabel.text = track.artist
        
        let imageName = isPlaying ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: imageName), for: .normal)
        
    }
    
    private func loadAudio(){
        let track = tracks[currentTrackIndex]
        guard let url = Bundle.main.url(forResource: track.audioFileName, withExtension: "mp3")else{
            print("Audio file not found: \(track.audioFileName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading audio: \(error)")
        }
    }
    
    private func animateButton(_ button: UIButton){
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        }
    }
    
    @IBAction func previouseButtonTapped(_ sender: UIButton) {
        
        animateButton(sender)
        
        if currentTrackIndex > 0 {
            currentTrackIndex -= 1
        } else {
            currentTrackIndex = tracks.count - 1
        }
        updateUI()
        loadAudio()
        audioPlayer?.play()
        isPlaying = true
        
        
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        animateButton(sender)
        
        if currentTrackIndex < tracks.count - 1 {
            currentTrackIndex += 1
        }
        else{
            currentTrackIndex = 0
        }
        loadAudio()
        audioPlayer?.play()
        isPlaying = true
        updateUI()
        
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        
        animateButton(sender)
        
        if isPlaying{
            audioPlayer?.pause()
            isPlaying = false
        } else{
            if audioPlayer == nil{
                loadAudio()
            }
            audioPlayer?.play()
            isPlaying = true
        }
        updateUI()
    }

}


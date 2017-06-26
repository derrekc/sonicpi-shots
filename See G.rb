# Welcome to Sonic Pi v2.11.1
live_loop :bass_riff do
  use_synth :fm
  play 48, attack: 0.15, sustain: 0.075, release: 0.15
  sleep 0.25
  play 53, attack: 0.15, sustain: 0.075, release: 0.15
  sleep 0.25
end


live_loop :achord do
  sleep 0.25
  use_synth :dark_ambience
  play chord(:C4, :m11), amp: 5, pan: 1
  play chord(:C4, :m9), amp: 5, pan: -1
end

center_left_pan = -0.44
center_right_pan = 0.44

live_loop :pianoman do
  with_fx :reverb, room: 1 do
    use_synth :piano
    sleep 0.75
    play 84, pan: 0
    play 72, attack: 0.1, attack_level: 1, decay: 0.2
    #play 36, attack: 0.3, attack_level: 2, sustain: 0.5, sustain_level: 2
    sleep 0.75
    play 91, pan: center_left_pan
    sleep 0.75
    play 90, pan: center_right_pan
    sample :ambi_piano
  end
end

live_loop :piano2 do
  with_fx :reverb, room: 0.3 do
    sleep 2
    sample :ambi_piano, rate: 0.5, release: 0.75
  end
end

live_loop :drumkit do
  with_fx :band_eq, freq: 40, db: 3.0 do
    sample :bd_haus, amp: 2, rate: 1
  end
  live_loop :hats do
    sample :drum_cymbal_closed, attack: 0.02
    print sample_duration :drum_cymbal_closed
    sleep 0.25
  end
  
  sleep 0.5
end

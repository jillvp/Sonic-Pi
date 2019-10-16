# Timbral possibilities
#live_loop :timbre do
# use_synth (ring :tb303, :blade, :prophet, :saw, :beep, :tri).tick
#play :e2, attack: 0, release: 0.5, cutoff: 100
#sleep 0.5
#end

# Melodic Composition
# live_loop :riff do
# use_synth :prophet
# riff = (ring :e3, :e3, :r, :g3, :r, :r, :r, :a3)
# play riff.tick, release: 0.5, cutoff: 80
# sleep 0.25
# end


# AUTO MELODY
#live_loop :random_riff do
# use_synth :tb303

#with_fx :slicer, phase: 3.33, wave: 1, mix: 1 do
# use_random_seed 33
#notes = (scale :e3, :minor_pentatonic).shuffle
#play notes.tick, release: 1, cutoff: 80
#sleep 0.25
#end
#end

# AUTO RHYTHM
# live_loop :random_riff do
#  use_synth :dsaw
# use_random_seed 30
# notes = (scale :e3, :minor_pentatonic).shuffle
# 16.times do
# play notes.tick, release: 0.2, cutoff: 90 if one_in(2)
# sleep 0.125
# end
# end

# BRINGING IT ALL TOGETHER

use_debug false
live_loop :random_riff do
  # uncomment and hit Run to bring in:
  # synth :blade, note: :e4, release: 4, cutoff: 100, amp: 1.5
  use_synth :dsaw
  use_random_seed 30030
  notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle.take(8)
  8.times do
    play notes.tick, release: rand(0.5),
      cutoff: rrand(60, 130) if one_in(2)
    sleep 0.125
  end
end
live_loop :drums do
  use_random_seed 500
  16.times do
    sample :bd_haus, rate: 2, cutoff: 110 if rand < 0.35
    sleep 0.125
  end
end
live_loop :bd do
  sample :bd_haus, cutoff: 100, amp: 3
  sleep 0.5
end

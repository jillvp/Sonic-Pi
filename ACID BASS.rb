# ACID BASS

#use_synth :tb303
#live_loop :squelch do
# create a riff - ring of notes (E); n = current note
# n = (ring :c1, :e2, :c3).tick

# trigger tb303
#play n, release: 0.125, cutoff: 90, res: 0.93, wave: 0

# loop round every 0.125 seconds = eight times a second at default BPM of 60
#sleep 0.125
#end


#use_synth :tb303
#with_fx :reverb, room: 1 do
#  live_loop :space_scanner do
#   play :e1, cutoff: 100, release: 7, attack: 1,
#    cutoff_attack: 0.3, cutoff_release: 4
# sleep 8
#end
#end

# BRINGING IT ALL TOGETHER
use_synth :tb303
use_debug false

with_fx :reverb, room: 0.8 do
  live_loop :space_scanner do
    with_fx :slicer, phase: 0.25, amp: 1.5 do
      co = (line 70, 130, steps: 8).tick
      play :e1, cutoff: co, release: 7, attack: 1,
        cutoff_attack: 4, cutoff_release: 4
      sleep 8
    end
  end
  live_loop :squelch do
    use_random_seed 3000
    16.times do
      n = (ring :e1, :e2, :e3).tick
      play n, release: 0.125, cutoff: rrand(70, 130),
        res: 0.9, wave: 1, amp: 0.8
      sleep 0.125
    end
  end
end
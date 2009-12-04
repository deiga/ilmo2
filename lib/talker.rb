module Talker
  
  def self.talk_binary(text)
   system("say -o tmp/talk.aiff #{text} && lame tmp/talk.aiff tmp/talk.mp3")
   File.open("tmp/talk.mp3", "r").read
  end
  
end
def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.include?("?")
    "Silly question, get dressed and go to work!"
  elsif your_message.downcase == "i am going to work right now!"
    ""
  else
    "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  answer = coach_answer(your_message)
  if answer != ""
    if your_message == your_message.upcase
      "I can feel your motivation! #{answer}"
    else
      answer
    end
  else
    ""
  end
end

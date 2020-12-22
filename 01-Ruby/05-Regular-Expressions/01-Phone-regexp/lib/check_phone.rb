def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number.match?(/(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/) ? true : false
end

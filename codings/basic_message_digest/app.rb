require_relative './message'

# command line app to
# store a message with a nonce
# to generate a message digest (256-bit)

# then we can verify the message
# when provided with the same message and nonce

puts "What is your message?"
msg = gets.chomp
puts "What is your password?"
password = gets.chomp

orig_msg = Message.new(msg, password)
puts "Your message has been encrypted to..."
puts orig_msg.digest

puts "\nWhat is the message you want to authenticate?"
msg_verify = gets.chomp

puts "What is your password?"
password_verify = gets.chomp

msg_verify = Message.new(msg_verify, password_verify)
puts "Your encryption is..."
puts msg_verify.digest

if orig_msg.digest == msg_verify.digest
  puts "Your message is authentic."
else
  puts "Your message is *NOT* authentic."
end



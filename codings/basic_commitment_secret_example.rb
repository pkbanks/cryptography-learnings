require 'digest'

# The commit function takes a message and secret
# random value, called a nonce, as input and returns a commitment.
# com = commit(msg, nonce)

# verify(com, msg, nonce) The verify function takes a commitment, nonce, and
# message as input. It returns true if com == commit(msg, nonce) and false otherwise

def commit(msg, nonce)
  # returns a commitment
  Digest::SHA2.new(256).hexdigest(nonce + msg)
end

def verify(com, msg, nonce)
  # returns boolean, true if com is authentic
  # else false
  com == commit(msg, nonce)
end

msg = "I am at Taco Bell"
nonce = "pk banks"

com = commit(msg, nonce)
puts verify(com, msg, nonce)



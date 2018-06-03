require 'digest'

# The commit function takes a message and secret
# random value, called a nonce, as input and returns a commitment.
# com = commit(msg, nonce)

# verify(com, msg, nonce) The verify function takes a commitment, nonce, and
# message as input. It returns true if com == commit(msg, nonce) and false otherwise

class Message

  attr_reader :digest, :msg

  def initialize(msg, secret)
    @msg = msg
    @secret = secret
    @digest = commit(@msg, @secret)
  end

  def commit(msg, nonce)
    Digest::SHA2.new(256).hexdigest(nonce + msg)
  end

  def verify(com, msg, nonce)
    # returns boolean, true if com is authentic
    # else false
    com == commit(msg, nonce)
  end
end

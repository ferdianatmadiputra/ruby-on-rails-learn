class SayController < ApplicationController
  def hello
    @time = Time.now
    @onehourtime = 1.hour.from_now.localtime
    @concatString = "cow" + "bow"
    @files = Dir.glob('*')
  end

  def goodbye
  end
end

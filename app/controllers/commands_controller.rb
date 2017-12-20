class CommandsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @command = Command.first
    if @command == nil
      @command = Command.new
      @command.save
    end
    @commands_array = ["on", "off", "christmas", "big_rainbow", "dots", "lightshow", "snake", "middle_pulse", "patterned_snake", "game_of_life"]
  end

  def update
    @command = Command.first
    if @command == nil
      @command = Command.new
    end
    # Set a lock so that another user of the web application can't launch a different command while ours is executing.
    if @command.lock != true
      @command.lock = true
      @command.save
      # We create a new thread so as not to time out the web request.
      Thread.new do
        begin
          n = Strip::NeoPixel.first
          # n.skip_extract = true
          # Setting skip_extract to true skips sending messages to the Apiotics server for delivery to the device.
          # See app/models/neo_pixel.rb for the details of these commands.
          if params[:command] == "on"
            n.all_on([75,40,3])
          elsif params[:command] == "off"
            n.all_off
          elsif params[:command] == "christmas"
            n.christmas(10)
          elsif params[:command] == "big_rainbow"
            n.big_rainbow
          elsif params[:command] == "dots"
            n.moving_dots(10, 4, true, [127,127,0], [0,127,127])
          elsif params[:command] == "lightshow"
            n.lightshow
          elsif params[:command] == "snake"
            n.snake(3, 16, [127,63,255])
          elsif params[:command] == "middle_pulse"
            n.middle_pulse(3, [75,40,3])
          elsif params[:command] == "patterned_snake"
            n.patterned_snake(3, [[127,127,127], [127,0,127], [0,127,127], [127,127,0], [127,0,0], [0,127,0], [0,0,127], [63,127,31], [31,31,0], [0,63,90], [63,63,63]])
          elsif params[:command] == "game_of_life"
            n.game_of_life(30, [31,127,63], [30,31,60,61,90,91,120,121,150,151,180,181])
          end
          # After we are done executing the command, broadcast a message so that the UI can unlock its buttons for the user.
          ActionCable.server.broadcast "command_channel",
            command: params[:command],
            status: "complete"
          # And release the lock in the database
          @command.lock = false
          @command.save
        rescue => e
          # Clean up if we have an error.
          puts e
          ActionCable.server.broadcast "command_channel",
            command: params[:command],
            status: "error running command"
          @command.lock = false
          @command.save
        end
        ActiveRecord::Base.connection.close
      end
    end
    # Allow the user to release the lock if need be.
    if params[:command] == "lock"
      @command = Command.first
      if @command == nil
        @command = Command.new
      end
      @command.lock = false
      @command.save
    end
    success_hash = Hash.new
    success_hash["success"] = params[:command]
    render json: success_hash.to_json, status: 200
  end
  
end

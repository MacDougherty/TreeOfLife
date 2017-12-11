class CommandsController < ApplicationController
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
    if @command.lock != true
      @command.lock = true
      @command.save
      begin
        n = Strip::NeoPixel.first
        n.skip_extract = true
        if params[:command] == "on"
          n.all_on([127,127,127])
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
          n.middle_pulse(3, [255,127,63])
        elsif params[:command] == "patterned_snake"
          n.patterned_snake(3, [[127,127,127], [127,0,127], [0,127,127], [127,127,0], [127,0,0], [0,127,0], [0,0,127], [63,127,31], [31,31,0], [0,63,90], [63,63,63]])
        elsif params[:command] == "game_of_life"
          n.game_of_life(30, [31,127,63], [30,31,60,61,90,91,120,121,150,151,180,181])
        end
      rescue => e
        puts e
      end
      @command.lock = false
      @command.save
    end
    if params[:command] == "lock"
      @command = Command.first
      if @command == nil
        @command = Command.new
      end
      @command.lock = false
    end
    success_hash = Hash.new
    success_hash["success"] = params[:command]
    render json: success_hash.to_json, status: 200
  end
  
end

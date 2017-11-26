class ConsolesController < ApplicationController
  def index
    consoles = [
      { name: 'NES', manufacturer: 'Nintendo' },
      { name: 'SNES', manufacturer: 'Nintendo' },
      { name: 'Wii', manufacturer: 'Nintendo' },
      { name: 'Genesis', manufacturer: 'Sega' },
      { name: 'Xbox', manufacturer: 'Microsoft' },
      { name: 'Switch', manufacturer: 'Nintendo' },
      { name: 'PS1', manufacturer: 'Sonny' },
      { name: 'PS2', manufacturer: 'Sonny' },
    ]

    if params[:manufacturer]
      consoles = consoles.select{ |entry| entry[:manufacturer] == params[:manufacturer] }
    end

    render json: { consoles: consoles.map{|entry| entry[:name] }  }, status: 200
  end
end

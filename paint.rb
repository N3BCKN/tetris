# frozen_string_literal: true

class Paint
  def initialize
    @palette = [
      '#1a1f28', # grey
      '#FD3F59', # salmon
      '#FFC82E', # orange
      '#FEFB34', # yellow
      '#53DA3F', # green
      '#01EDFA', # cyan
      '#DD0AB2', # purple
      '#EA141C', # red
      '#FE4819', # orange
      '#FF910C', # sandy
      '#0077D3' # dark blue
    ]
  end

  def [](index)
    @palette[index]
  end
end

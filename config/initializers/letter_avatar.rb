LetterAvatar.setup do |config|
  config.fill_color        = 'rgba(255, 255, 255, 1)' # default is 'rgba(255, 255, 255, 0.65)'
  config.cache_base_path   = 'public/avatars'     # default is 'public/system'
  config.colors_palette    = :google
  config.custom_palette    = [
    [81, 236, 206],
    [0, 116, 228],
    [85, 34, 250],
    [26, 191, 108],
    [255, 245, 202],
    [255, 214, 10],
    [255, 229, 218],
    [255, 140, 0],
    [249, 92, 92],
    [234, 229, 223]
  ]
  config.weight            = 600                      # default is 300
  config.annotate_position = '-0+5'                  # default is -0+5
  config.letters_count     = 2                        # default is 1
  config.pointsize         = 300                      # default is 140
end
